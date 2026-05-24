function Export-GovernanceTrend {

    [CmdletBinding()]
    param (
        [object]$Scorecard
    )

    $Path = ".\reports\governance-trend.csv"

    $Entry = [PSCustomObject]@{
        Timestamp        = Get-Date
        GovernanceScore  = $Scorecard.GovernanceScore
        TotalFindings    = $Scorecard.TotalFindings
        HighSeverity     = $Scorecard.HighSeverity
        MediumSeverity   = $Scorecard.MediumSeverity
        LowSeverity      = $Scorecard.LowSeverity
    }

    $Entry | Export-Csv `
        -Path $Path `
        -Append `
        -NoTypeInformation `
        -Force

    Write-PlatformLog -Message "Governance trend data exported"
}
