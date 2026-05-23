function Export-GovernanceReport {

    [CmdletBinding()]
    param (
        [array]$Findings
    )

    $Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

    $Path = ".\reports\GovernanceReport-$Timestamp.csv"

    $Findings | Export-Csv -Path $Path -NoTypeInformation

    Write-PlatformLog -Message "Governance report exported to $Path"

    return $Path
}
