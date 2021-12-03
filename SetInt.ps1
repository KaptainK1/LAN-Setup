param ([UInt32]$zeroTierInt, [Int32]$ethernetInt)

Write-Output $zeroTierInt
Write-Output $ethernetInt

Set-NetIPInterface -InterfaceIndex $zeroTierInt -InterfaceMetric 80
Set-NetIPInterface -InterfaceIndex $ethernetInt -InterfaceMetric 100
Get-NetIPInterface