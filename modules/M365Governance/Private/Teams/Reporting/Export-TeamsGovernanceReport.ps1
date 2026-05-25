function Export-TeamsGovernanceReport {

    [CmdletBinding()]
    param (
        $Context
    )

    $Path = ".\reports\teams-governance-report.csv"

    $Context.Findings | Export-Csv `
        -Path $Path `
        -NoTypeInformation `
        -Force

    Write-PlatformLog `
        -Message "Teams governance report exported" `
        -ExecutionId $Context.ExecutionId
}
