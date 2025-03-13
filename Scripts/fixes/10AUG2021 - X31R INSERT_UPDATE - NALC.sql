INSERT INTO di03_outgoing_intfc
(doc_id, key_1, key_3, data_1, data_3, xfr_fg, xmit_ind, match_del_fg, rpt_fg, rqst_dttm, intfc_cd, rpt_r60450_ind, rpt_r60550_ind)
values
("X31", "0233GD50", "Y",
"202121600121999X31   14810011741710SREA00001R570820233GD50RY      7L 3BAK003   5G              000000000N                YRC02E         Y2121500001                  714",
"GDYN10000000000AYLF00000000052948GD500233Y                                                                        0FB9231709  AYLF4611G  K5294GE1           N14",
"Y",
"Y",
"N",
"N",
"Aug  4 2021  12:12AM",
"I",
"N",
"Y")


UPDATE di03_outgoing_intfc set   
doc_id = "X31",
key_1 = "0233GD50",
key_3 = "Y",
data_1 = "202121600121999X31   14810011741710SREA00001R570820233GD50RY      7L 3BAK003   5G              000000000N                YRC02E         Y2121500001                  714",
data_3 = "GDYN10000000000AYLF00000000052948GD500233Y                                                                        0FB9231709  AYLF4611G  K5294GE1           N14",     
xfr_fg = "Y",
xmit_ind = "Y",
match_del_fg = "N",
rpt_fg = "N",
rqst_dttm = "Aug  4 2021  12:12AM",
intfc_cd = "I",
rpt_r60450_ind = "N",
rpt_r60550_ind = "Y",
WHERE	di03_outgoing_intfc.key_1 = '0233GD50' 
GO