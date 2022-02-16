using namespace System.Net

# Input bindings are passed in via param block.
param($Request)

Write-Host "--------------SHOWTIME-------------"
Get-Module

Write-Host "========> $env:PSModulePath <========="
$Result = Get-Running | Select-Object Name, ResourceGroupName, @{label = "SubscriptionId"; expression = { $_.Id.Split('/')[2] } }, PowerState

Write-Host "--------------ENDTIME-------------"
Get-Module

Push-OutputBinding -Name Response -Value (@{
        StatusCode = [HttpStatusCode]::OK
        Body       = $Result
    })
