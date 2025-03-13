/********************************/
/*  Insert User Tasks & AuthWC  */
/********************************/
-- find login_id
-- change login_id in the where statement
-- then run the remainder of the script from declare to the end

declare @id char(9)
select @id = ssn from du05_personnel where login_id like 'hernanjs'

-----------------------------------------------------------------------------------------------------

/********************************/
/*  Insert User Tasks	        */
/********************************/

insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ACR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ADHEXP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ADHNORM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ALLORGS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ALTCONNSN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ALTNSNCLR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ALTREPNSN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AMSUDISUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AMSUTURNIN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ANLRS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AOM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ASDSITE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AUTOAMSU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPLOCUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPOCMP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPRCPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPREPPTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPSUM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPTRNSPS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "AWPTRNSRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BASELINE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BASICMAF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BTCHMENU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BTCHPRCADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BTCHPRCUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BUNO", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "BUNOSWAP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CAGEPNADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CDIMAFSIG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CHGWC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CHGWORKPRI", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CIV-ART", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CREATEINTF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CRITITMSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CTGRQN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "CUSTRFSL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DAP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DAREVIEW", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DBERROR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DELETENOTE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DFSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DIFMRTN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DIFMSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DIRRQN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DMATDLRS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DUP1348", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "DUPOOLCD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ENGCOSTACC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ENGINE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "EQPDISCRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "EQPOPCAPRP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "EQPSTATCHG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "EXBTCHPROC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "EXSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "FGCUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "FUNDCODE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "FXALWANAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "G-ICRL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "HCNCONTROL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "HPNMPM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "HZRQNCTG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ICRLRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "IMASITE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INDIRMATAU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INDMATDLRS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INDRQN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INPROCDEL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INPROCINSP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INTER", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INTFCNTRL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INTIMARTN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INTREC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INVRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "INVSTAMON", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "IOCANNB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "IOURPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "IOUSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "IOUSUM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ISRPNSANAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ISSSLCT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "JONTBL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "LISSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "LOADCERT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "LRSIGNOFF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "LSCREVERSL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "LSCUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "LSCUPQTYOV", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MAFCANCEL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MAFCONTG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MAINTICRL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MATRECEIPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MATRQMTAU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MNTXTRCT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MNYVALSUMM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MRILADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MSIRQNCLR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MSTRPHKIT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "MTLTI", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "NSNADD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "NSNSPI", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "NSNUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "OFEQCANNIB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "OFTRVALUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "OMAP3", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "OMRR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ONEQCANNIB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ORGCODE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ORGW/C", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PASSWRD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PCAPPROVAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PCREVIEW", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBDMD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBEFFISS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBISSUE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBMANAGER", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBOHNDADJ", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBPKPORD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBPKPRCD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBPKPSITE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBPKPTRF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBPKUPRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBPKUPSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBREPLEN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBRESCRN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PEBTECCST", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PERSNL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PHKITINV", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PHKITORD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PHSE3", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PKDEPL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PKPCPTRF", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PKSTKUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PKSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PKUPCAGEPN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PKWHSELOC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PRJCODE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "PRODRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "QAREQCHG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "QARMAFSIG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "REPNSNUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "REPORTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "REPPKADUPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RESCNCON", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RESCNREP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RFIINVPST", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RFISTKUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "ROBPOD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RPBLSTKREQ", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RPTADM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RPTMENU", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNFOLUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNPOD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNREORD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNREV", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNROB", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNSTAUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RQNSTOW", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RSUPLOGON", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "RTNSBPKSP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SAGUIDE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SCRNACCESS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SEACTUAL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SEBASELINE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SEINVGAIN", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SEINVLOSS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SESUBCUS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SHML", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SITEVALTBL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SPSTKUP", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SQGRPTASK", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "STKREPMGMT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SUBSTKUPD", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SUPEFFIND", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SUPERSIG", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SUPSRVY", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "SYSTBL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TDINIT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TEC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TECHDIR", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TOOLBOX", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TRANSPURGE", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TRNARNDTM", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "TSTBNCHSTS", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "UNLOCKCERT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "UPDTDINFO", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "WKLDRPT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "WRHSRFSL", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "WRINIT", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "WUC", "Y") go
insert into du10_person_task (ssn, tsk_id, per_tsk_on_off_fg) values (@id, "XFRSBPKSP", "Y") go


/********************************/
/*  Insert AuthWC Tasks	        */
/********************************/

insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "AMSUTURNIN", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "ANLRS     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "AUTOAMSU  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "BASICMAF  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CDIMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CHGWC     ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CHGWC     ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CHGWC     ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CHGWC     ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CHGWC     ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CHGWC     ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "CHGWC     ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CHGWC     ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CHGWORKPRI", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CHGWORKPRI", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CHGWORKPRI", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CHGWORKPRI", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CHGWORKPRI", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CHGWORKPRI", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CHGWORKPRI", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "CIV-ART   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "DELETENOTE", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "DMATDLRS  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "EQPSTATCHG", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "EQPSTATCHG", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "EQPSTATCHG", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "EQPSTATCHG", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "EQPSTATCHG", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "EQPSTATCHG", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "EQPSTATCHG", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INDIRMATAU", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INDMATDLRS", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INPROCDEL ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "INPROCINSP", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "INPROCINSP", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "INPROCINSP", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "INPROCINSP", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "INPROCINSP", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "INPROCINSP", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "INPROCINSP", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "IOCANNB   ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "IOCANNB   ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "IOCANNB   ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "IOCANNB   ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "IOCANNB   ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "IOCANNB   ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "IOCANNB   ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "LRSIGNOFF ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "LRSIGNOFF ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "LRSIGNOFF ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "LRSIGNOFF ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "LRSIGNOFF ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "LRSIGNOFF ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "LRSIGNOFF ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "MAFCANCEL ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "MAFCANCEL ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "MAFCANCEL ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "MAFCANCEL ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "MAFCANCEL ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "MAFCANCEL ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "MAFCANCEL ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "OFEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "OFEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "OFEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "OFEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "OFEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "OFEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "OFEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "ONEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "ONEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "ONEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "ONEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "ONEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "ONEQCANNIB", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "ONEQCANNIB", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "PCAPPROVAL", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "PCAPPROVAL", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "PCAPPROVAL", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "PCAPPROVAL", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "PCAPPROVAL", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "PCAPPROVAL", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "PCAPPROVAL", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "PCREVIEW  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "PCREVIEW  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "PCREVIEW  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "PCREVIEW  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "PCREVIEW  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "PCREVIEW  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "PCREVIEW  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "QAREQCHG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "QARMAFSIG ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SEACTUAL  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SEACTUAL  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SEACTUAL  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SEACTUAL  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SEACTUAL  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SEACTUAL  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SEACTUAL  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SEBASELINE", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SEBASELINE", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SEBASELINE", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SEBASELINE", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SEBASELINE", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SEBASELINE", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SEBASELINE", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SESUBCUS  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SESUBCUS  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SESUBCUS  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SESUBCUS  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SESUBCUS  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SESUBCUS  ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SESUBCUS  ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "SUPERSIG  ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("CLA", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "TOOLBOX   ", @id, " ") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("020", "GN1", "UPDTDINFO ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("021", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("024", "GN1", "UPDTDINFO ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("026", "GN1", "UPDTDINFO ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("027", "GN1", "UPDTDINFO ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("028", "GN1", "UPDTDINFO ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("029", "GN1", "UPDTDINFO ", @id, "Y") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("02N", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("030", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("040", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("04C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("050", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("05H", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("400", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("411", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("412", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("414", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41F", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41H", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41L", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41N", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("41R", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("430", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("431", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("440", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("450", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("460", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("500", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51E", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51F", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("51X", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("520", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("530", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("550", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("600", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("60C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("610", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("61X", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("620", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62E", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62F", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("62X", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("640", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("64D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("650", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65G", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("65H", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("660", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("670", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("67E", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("690", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69H", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69L", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("69Q", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("700", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("710", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("71D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("730", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("731", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("735", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("800", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("81C", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("820", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("900", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("90A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("910", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("91B", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("920", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92A", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("92D", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("930", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("940", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("990", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("ALM", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("IMA", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X10", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X43", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X50", "GN1", "UPDTDINFO ", @id, "S") go
insert into du03_authwc (wc_cd, org_cd, tsk_id, ssn, prime_pc_ind) values ("X59", "GN1", "UPDTDINFO ", @id, "S") go


