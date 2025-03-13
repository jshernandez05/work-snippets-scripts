/********************************/
/*  Find login_id and ssn       */
/********************************/

select	last_nm, init, asgn_org_cd, asgn_wc_cd, ssn, login_id
from	du05_personnel
where	last_nm like 'HERNANDEZ'
go


last_nm		init	asgn_org_cd	asgn_wc_cd	ssn			login_id
HERNANDEZ	JS		GNZ			SMD			115122772	hernanjs


/********************************/
/*  Insert User Tasks	        */
/********************************/

-- do a global replace of old ssn with new ssn
-- don't need to run the select statement
-- this it what was used to create the insert

ssn = 115122772

/*
select	'insert into du10_person_task'
		+ ' (ssn, tsk_id, per_tsk_on_off_fg) '
		+ 'values'
		+ ' ("' + ssn + '", ' + '"' + rtrim(tsk_id) + '", ' + '"' + per_tsk_on_off_fg + '") go'
from	du10_person_task
where	ssn like '115122772'
go
*/

------------------------------------------------------------------------------------------------------

insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ACR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ADHEXP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ADHNORM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ALLORGS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ALTCONNSN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ALTNSNCLR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ALTREPNSN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AMSUDISUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AMSUTURNIN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ANLRS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AOM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ASDSITE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AUTOAMSU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPLOCUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPOCMP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPRCPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPREPPTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPSUM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPTRNSPS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "AWPTRNSRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BASELINE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BASICMAF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BTCHMENU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BTCHPRCADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BTCHPRCUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BUNO", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "BUNOSWAP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CAGEPNADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CDIMAFSIG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CHGWC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CHGWORKPRI", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CIV-ART", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CREATEINTF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CRITITMSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CTGRQN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "CUSTRFSL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DAP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DAREVIEW", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DBERROR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DELETENOTE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DFSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DIFMRTN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DIFMSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DIRRQN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DMATDLRS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DUP1348", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "DUPOOLCD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ENGCOSTACC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ENGINE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "EQPDISCRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "EQPOPCAPRP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "EQPSTATCHG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "EXBTCHPROC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "EXSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "FGCUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "FUNDCODE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "FXALWANAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "G-ICRL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "HCNCONTROL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "HPNMPM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "HZRQNCTG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ICRLRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "IMASITE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INDIRMATAU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INDMATDLRS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INDRQN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INPROCDEL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INPROCINSP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INTER", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INTFCNTRL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INTIMARTN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INTREC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INVRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "INVSTAMON", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "IOCANNB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "IOURPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "IOUSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "IOUSUM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ISRPNSANAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ISSSLCT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "JONTBL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "LISSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "LOADCERT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "LRSIGNOFF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "LSCREVERSL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "LSCUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "LSCUPQTYOV", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MAFCANCEL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MAFCONTG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MAINTICRL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MATRECEIPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MATRQMTAU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MNTXTRCT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MNYVALSUMM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MRILADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MSIRQNCLR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MSTRPHKIT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "MTLTI", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "NSNADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "NSNSPI", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "NSNUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "OFEQCANNIB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "OFTRVALUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "OMAP3", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "OMRR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ONEQCANNIB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ORGCODE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ORGW/C", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PASSWRD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PCAPPROVAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PCREVIEW", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBDMD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBEFFISS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBISSUE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBMANAGER", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBOHNDADJ", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBPKPORD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBPKPRCD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBPKPSITE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBPKPTRF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBPKUPRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBPKUPSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBREPLEN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBRESCRN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PEBTECCST", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PERSNL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PHKITINV", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PHKITORD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PHSE3", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PKDEPL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PKPCPTRF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PKSTKUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PKSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PKUPCAGEPN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PKWHSELOC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PRJCODE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "PRODRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "QAREQCHG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "QARMAFSIG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "REPNSNUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "REPORTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "REPPKADUPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RESCNCON", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RESCNREP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RFIINVPST", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RFISTKUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "ROBPOD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RPBLSTKREQ", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RPTADM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RPTMENU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNFOLUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNPOD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNREORD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNREV", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNROB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNSTAUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RQNSTOW", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RSUPLOGON", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "RTNSBPKSP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SAGUIDE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SCRNACCESS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SEACTUAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SEBASELINE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SEINVGAIN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SEINVLOSS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SESUBCUS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SHML", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SITEVALTBL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SPSTKUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SQGRPTASK", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "STKREPMGMT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SUBSTKUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SUPEFFIND", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SUPERSIG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SUPSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "SYSTBL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TDINIT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TEC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TECHDIR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TOOLBOX", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TRANSPURGE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TRNARNDTM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "TSTBNCHSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "UNLOCKCERT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "UPDTDINFO", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "WKLDRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "WRHSRFSL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "WRINIT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "WUC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values ("115122772", "XFRSBPKSP", "Y") go


/********************************/
/*  Insert AuthWC Tasks	        */
/********************************/

-- don't need to run the select statement
-- this it what was used to create the insert

/*
select	'insert into du03_authwc'
		+ ' (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) '
		+ 'values'
		+ ' ("' + wc_cd + '", ' + '"' + org_cd + '", ' + '"' + tsk_id + '", ' + '"' + ssn + '", ' 
		+ '"' + prime_pc_ind +  '") go'
from	du03_authwc
where	ssn like '115122772'
go
*/

---------------------------------------------


insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "AMSUTURNIN", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "ANLRS     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "AUTOAMSU  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "BASICMAF  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CDIMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CHGWC     ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CHGWC     ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CHGWC     ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CHGWC     ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CHGWC     ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CHGWC     ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "CHGWC     ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CHGWC     ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CHGWORKPRI", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CHGWORKPRI", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CHGWORKPRI", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CHGWORKPRI", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CHGWORKPRI", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CHGWORKPRI", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CHGWORKPRI", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CIV-ART   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "DELETENOTE", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "DMATDLRS  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "EQPSTATCHG", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "EQPSTATCHG", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "EQPSTATCHG", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "EQPSTATCHG", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "EQPSTATCHG", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "EQPSTATCHG", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "EQPSTATCHG", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INDIRMATAU", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INDMATDLRS", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INPROCDEL ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INPROCINSP", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INPROCINSP", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INPROCINSP", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INPROCINSP", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INPROCINSP", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INPROCINSP", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INPROCINSP", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "IOCANNB   ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "IOCANNB   ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "IOCANNB   ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "IOCANNB   ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "IOCANNB   ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "IOCANNB   ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "IOCANNB   ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "LRSIGNOFF ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "LRSIGNOFF ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "LRSIGNOFF ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "LRSIGNOFF ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "LRSIGNOFF ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "LRSIGNOFF ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "LRSIGNOFF ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "MAFCANCEL ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "MAFCANCEL ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "MAFCANCEL ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "MAFCANCEL ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "MAFCANCEL ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "MAFCANCEL ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "MAFCANCEL ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "OFEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "OFEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "OFEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "OFEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "OFEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "OFEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "OFEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "ONEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "ONEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "ONEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "ONEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "ONEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "ONEQCANNIB", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "ONEQCANNIB", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "PCAPPROVAL", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "PCAPPROVAL", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "PCAPPROVAL", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "PCAPPROVAL", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "PCAPPROVAL", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "PCAPPROVAL", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "PCAPPROVAL", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "PCREVIEW  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "PCREVIEW  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "PCREVIEW  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "PCREVIEW  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "PCREVIEW  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "PCREVIEW  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "PCREVIEW  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "QAREQCHG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "QARMAFSIG ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SEACTUAL  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SEACTUAL  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SEACTUAL  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SEACTUAL  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SEACTUAL  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SEACTUAL  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SEACTUAL  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SEBASELINE", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SEBASELINE", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SEBASELINE", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SEBASELINE", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SEBASELINE", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SEBASELINE", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SEBASELINE", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SESUBCUS  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SESUBCUS  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SESUBCUS  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SESUBCUS  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SESUBCUS  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SESUBCUS  ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SESUBCUS  ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SUPERSIG  ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "TOOLBOX   ", "115122772", " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "UPDTDINFO ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "UPDTDINFO ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "UPDTDINFO ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "UPDTDINFO ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "UPDTDINFO ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "UPDTDINFO ", "115122772", "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "UPDTDINFO ", "115122772", "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "UPDTDINFO ", "115122772", "S") go








select distinct 'insert into du03_authwc'
		+ ' (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) '
		+ 'values'
		+ ' ("' + wc_cd + '", ' + '"' + (select  aimd_org from da03_site) + '", ' + '"' + rtrim(tsk_id) + '", ' 
				+ '"' + ssn + '", ' + '"' + prime_pc_ind +  '")'
			+ char(13) + char(10) 
			+ 'go'
from	du03_authwc
where	ssn like '115122772'
go

-- delete from du03_authwc
where ssn like '115122772'
and wc_cd not in (select distinct wc_cd from da05_workcenter
		  where org_cd like (select aimd_org from da03_site)
			)

select distinct 'insert into du03_authwc'
		+ ' (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) '
		+ 'values'
		+ ' ("' + wc_cd + '", ' + '"' + (select  aimd_org from da03_site) + '", ' + '"' + rtrim(tsk_id) + '", ' 
				+ '"' + ssn + '", ' + '"' + prime_pc_ind +  '")'
			+ char(13) + char(10) 
			+ 'go'
from	du03_authwc
where	ssn like '115122772'
and wc_cd in (select distinct wc_cd from da05_workcenter
				where org_cd like (select aimd_org from da03_site)
			)
go