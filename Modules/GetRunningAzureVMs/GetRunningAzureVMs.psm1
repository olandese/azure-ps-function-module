$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 )

Foreach($import in @($Public + $Private))
{
    Try
    {
        . $import.FullName
    }
    Catch
    {
        Write-Error -Message "Failed to import function $($import.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.BaseName