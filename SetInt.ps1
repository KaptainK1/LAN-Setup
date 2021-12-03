$zIntMetric = 80
$eIntMetric = 100

$zInt = Get-NetIPInterface | Where-Object {$_.InterfaceAlias -Match "ZeroTier*"}
$zNum = $zInt.Get(0).ifIndex
Write-Output $zNum

$eInt = Get-NetIPInterface | Where-Object {$_.InterfaceAlias -Match "Ethernet"}
$eNum = $eInt.Get(0).ifIndex
Write-Output $eNum

Set-NetIPInterface -InterfaceIndex $zNum -InterfaceMetric $zIntMetric
Set-NetIPInterface -InterfaceIndex $eNum -InterfaceMetric $eIntMetric
Get-NetIPInterface