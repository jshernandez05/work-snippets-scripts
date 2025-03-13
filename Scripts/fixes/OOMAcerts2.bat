mkdir c:\users\%username%\desktop\SQ_CERT_FILES

net use f: \\MALS12IMA\C$\WINDOWS\SYSTEM32\DRIVERS\ETC /user:spawarmgr W1n$FlexW1n$Flex

copy \\MALS12IMA\c$\certs\MALS12IMA.crt c:\users\%username%\desktop\SQ_CERT_FILES

net use g: \\VMGR152\C$\WINDOWS\SYSTEM32\DRIVERS\ETC /user:spawarmgr W1n$FlexW1n$Flex

copy \\VMGR152\c$\certs\VMGR152.crt c:\users\%username%\desktop\SQ_CERT_FILES

net use i: \\VMFA242\C$\WINDOWS\SYSTEM32\DRIVERS\ETC /user:spawarmgr W1n$FlexW1n$Flex

copy \\VMFA242\c$\certs\VMFA242.crt c:\users\%username%\desktop\SQ_CERT_FILES

net use k: \\MACS4DETB\C$\WINDOWS\SYSTEM32\DRIVERS\ETC /user:spawarmgr W1n$FlexW1n$Flex

copy \\MACS4DETB\c$\certs\MACS4DETB.crt c:\users\%username%\desktop\SQ_CERT_FILES

net use l: \\138.168.126.14\C$\WINDOWS\SYSTEM32\DRIVERS\ETC /user:spawarmgr W1n$FlexW1n$Flex

copy \\138.168.126.14\c$\certs\VMFA224.crt c:\users\%username%\desktop\SQ_CERT_FILES

net use m: \\MWSS171\C$\WINDOWS\SYSTEM32\DRIVERS\ETC /user:spawarmgr W1n$FlexW1n$Flex

copy \\MWSS171\c$\certs\MWSS171.crt c:\users\%username%\desktop\SQ_CERT_FILES

 

findstr /x /c:"138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc" f:\hosts >nul ||  echo 138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc >> f:\hosts

findstr /x /c:"138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc" g:\hosts >nul ||  echo 138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc >> h:\hosts

findstr /x /c:"138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc" i:\hosts >nul ||  echo 138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc >> i:\hosts

findstr /x /c:"138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc" k:\hosts >nul ||  echo 138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc >> k:\hosts

findstr /x /c:"138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc" l:\hosts >nul ||  echo 138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc >> l:\hosts

findstr /x /c:"138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc" m:\hosts >nul ||  echo 138.168.126.9 nalc.mals12.mcdsus.mcds.usmc.mil nalc >> m:\hosts


echo "Verify NALC hosts file entry from all the drive letters,  then Press any key to disconnect all network drives"

pause

 

net use f: /delete /Y

net use g: /delete /Y

net use i: /delete /Y

net use k: /delete /Y

#net use l: /delete /Y

net use m: /delete /Y



 

 

net use f: \\MALS12IMA\j$\sybase\ini /user:spawarmgr W1n$FlexW1n$Flex

net use g: \\VMGR152\j$\sybase\ini /user:spawarmgr W1n$FlexW1n$Flex

net use i: \\VMFA242\j$\sybase\ini /user:spawarmgr W1n$FlexW1n$Flex

net use k: \\MACS4DETB\j$\sybase\ini /user:spawarmgr W1n$FlexW1n$Flex

net use l: \\138.168.126.14\j$\sybase\ini /user:spawarmgr W1n$FlexW1n$Flex

net use m: \\MWSS171\j$\sybase\ini /user:spawarmgr W1n$FlexW1n$Flex


 

powershell -Command "(gc f:\sql.ini) -replace 'nalc.mals12.mcdsus.mcds.usmc.mil,4050', 'nalc.mals12.mcdsus.mcds.usmc.mil,8302' | Out-File -encoding ASCII f:\sql.ini"

powershell -Command "(gc f:\sql.ini) -replace '138.168.126.9,4100,4050', '138.168.126.9,4100,8302' | Out-File -encoding ASCII f:\sql.ini"

powershell -Command "(gc g:\sql.ini) -replace 'nalc.mals12.mcdsus.mcds.usmc.mil,4050', 'nalc.mals12.mcdsus.mcds.usmc.mil,8302' | Out-File -encoding ASCII g:\sql.ini"

powershell -Command "(gc g:\sql.ini) -replace '138.168.126.9,4100,4050', '138.168.126.9,4100,8302' | Out-File -encoding ASCII g:\sql.ini"

powershell -Command "(gc i:\sql.ini) -replace 'nalc.mals12.mcdsus.mcds.usmc.mil,4050', 'nalc.mals12.mcdsus.mcds.usmc.mil,8302' | Out-File -encoding ASCII i:\sql.ini"

powershell -Command "(gc i:\sql.ini) -replace '138.168.126.9,4100,4050', '138.168.126.9,4100,8302' | Out-File -encoding ASCII i:\sql.ini"

powershell -Command "(gc k:\sql.ini) -replace 'nalc.mals12.mcdsus.mcds.usmc.mil,4050', 'nalc.mals12.mcdsus.mcds.usmc.mil,8302' | Out-File -encoding ASCII k:\sql.ini"

powershell -Command "(gc k:\sql.ini) -replace '138.168.126.9,4100,4050', '138.168.126.9,4100,8302' | Out-File -encoding ASCII k:\sql.ini"

powershell -Command "(gc l:\sql.ini) -replace 'nalc.mals12.mcdsus.mcds.usmc.mil,4050', 'nalc.mals12.mcdsus.mcds.usmc.mil,8302' | Out-File -encoding ASCII l:\sql.ini"

powershell -Command "(gc l:\sql.ini) -replace '138.168.126.9,4100,4050', '138.168.126.9,4100,8302' | Out-File -encoding ASCII l:\sql.ini"

powershell -Command "(gc m:\sql.ini) -replace 'nalc.mals12.mcdsus.mcds.usmc.mil,4050', 'nalc.mals12.mcdsus.mcds.usmc.mil,8302' | Out-File -encoding ASCII m:\sql.ini"

powershell -Command "(gc m:\sql.ini) -replace '138.168.126.9,4100,4050', '138.168.126.9,8302' | Out-File -encoding ASCII m:\sql.ini"

 

echo "Verify SQL.ini change from all the drive letters, then Press any key to disconnect all network drives"

pause

 

net use f: /delete /Y

net use g: /delete /Y

net use i: /delete /Y

net use k: /delete /Y

net use l: /delete /Y

net use m: /delete /Y






