# Input bindings are passed in via param block.
param($Timer)

Write-Host "--------------SHOWTIME-------------"
Get-Module

Write-Host "========> $env:PSModulePath <========="
$Result = Get-Running | Select-Object Name, ResourceGroupName, @{label = "SubscriptionId"; expression = { $_.Id.Split('/')[2] } }, PowerState

Write-Host "--------------ENDTIME-------------"
Get-Module

Write-Host "THIS IS THE OUTPUT"
$Result