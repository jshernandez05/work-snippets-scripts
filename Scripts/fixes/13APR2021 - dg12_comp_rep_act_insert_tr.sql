create trigger dg12_comp_rep_act_insert_tr
on dbo.dg12_comp_rep_act
for insert
as

-- $Author:   nealwp  $
-- $Workfile:   dg12_comp_rep_act_insert_tr.sql  $
-- $Revision:   1.0  $

declare
   @mcn                         char(7)
,  @comp_serno          varchar(32)
,  @cur_ti_ddsn         char(8)
,  @dr09_ddsn           char(8)
,  @dr09_rep_mcn        char(7)
,  @dr09_cur_mcn        char(7)
,  @dm04_niin           char(9)
,  @dm09_ecage          char(5)
,  @dm09_epn            varchar(32)
,  @dp01_niin           char(9)

if @@rowcount <> 1
        begin
                return
        end

-- get the mcn and comp_serno from the inserted row
select
        @mcn            = mcn
,   @comp_serno = comp_serno
from inserted

if @@rowcount <> 1 -- Check for error condition
        begin
                return
        end

        -- get the cur_ti_ddsn from the maf table
select
        @cur_ti_ddsn = dbo.dm04_maf.cur_ti_ddsn
from dbo.dm04_maf
where dbo.dm04_maf.mcn = @mcn

-- get cur_mcn and rep_mcn blocks from requisition
select
        @dr09_cur_mcn  = dbo.dr09_requisition.cur_mcn
,       @dr09_rep_mcn  = dbo.dr09_requisition.rep_mcn
from dbo.dr09_requisition
where dbo.dr09_requisition.ddsn = @cur_ti_ddsn

-- fix blank cur_mcn block on requisition table
if @dr09_cur_mcn = ''
        begin
                update dbo.dr09_requisition
                set dbo.dr09_requisition.cur_mcn = @mcn
                where dbo.dr09_requisition.ddsn = @cur_ti_ddsn
        end

-- fix blank rep_mcn block on requisition table
if @dr09_rep_mcn = ''
        begin
                update dbo.dr09_requisition
                set dbo.dr09_requisition.rep_mcn = @mcn
                where dbo.dr09_requisition.ddsn = @cur_ti_ddsn
        end

-- if no difm record exists for mcn, don't write CRA record.
if not exists (select 1 from dbo.ds03_item where dbo.ds03_item.rep_mcn = @mcn and dbo.ds03_item.bal_cd = 'DF')
        begin
		if exists (select 1 from dbo.dt02_transdata where dbo.dt02_transdata.mcn = @mcn and right(sup_trans_cd,3) in ('RFI', 'BCM'))
			begin
                    --item has been cleared previously, no CRA record is needed
                    rollback transaction
                    return
			end
	   	else
	        	begin
                    	raiserror 99999 "ds03 DIFM record not found for mcn %1!, and no history for BCM?RFI action!", @mcn
                    	rollback transaction
                    	return
                end         
	end

-- if comp_serno is blank and no difm record exists, don't write CRA record
if @comp_serno = ''
        begin
                raiserror 99999 "comp_serno cannot be blank!"
                rollback transaction
                return
        end

-- if niin from dm09 isn't written into dm04, fix that
select
        @dm04_niin = dbo.dm04_maf.niin
from dbo.dm04_maf
where dbo.dm04_maf.mcn = @mcn

if @dm04_niin = ''
        begin

                --get cage/partnumber from the removed record
                select
                        @dm09_ecage = dbo.dm09_removed.e_cage
                ,       @dm09_epn   = dbo.dm09_removed.e_part_no
                from dbo.dm09_removed
                where dbo.dm09_removed.mcn = @mcn

                --get the niin based on cage/partnumber
                select
                        @dp01_niin = dbo.dp01_cagepn.niin
                from dbo.dp01_cagepn
                where dbo.dp01_cagepn.cage = @dm09_ecage
                and dbo.dp01_cagepn.part_no = @dm09_epn

                --fix the dm04_niin
                update dbo.dm04_maf
                set dbo.dm04_maf.niin = @dp01_niin
                where dbo.dm04_maf.mcn = @mcn

        end

return
