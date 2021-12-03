$zIntMetric = 80
$eIntMetric = 100

$zInt = Get-NetIPInterface | Where-Object {$_.InterfaceAlias -Match "ZeroTier*"}
$zNum = $zInt.Get(0).ifIndex
Write-Output $zNum

$eNum
$eInt = Get-NetIPInterface | Where-Object {$_.InterfaceAlias -Match "Ethernet"}
if($eInt -eq $null) {
    $wInt = Get-NetIPInterface | Where-Object {$_.InterfaceAlias -Match "Wi-Fi*"}
    $eNum = $wInt.Get(0).ifIndex
} else {
    $eNum = $eInt.Get(0).ifIndex
    Write-Output $eNum
}


Set-NetIPInterface -InterfaceIndex $zNum -InterfaceMetric $zIntMetric
Set-NetIPInterface -InterfaceIndex $eNum -InterfaceMetric $eIntMetric
Get-NetIPInterface