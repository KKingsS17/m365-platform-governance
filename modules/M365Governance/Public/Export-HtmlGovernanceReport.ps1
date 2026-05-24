function Export-HtmlGovernanceReport {

    [CmdletBinding()]
    param (
        [array]$Findings
    )

    $Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"

    $Path = ".\reports\GovernanceReport-$Timestamp.html"

    $ReportData = $Findings | Select-Object `
        Control,
        Category,
        Severity,
        Status,
        Resource,
        Message,
        Recommendation,
        OperationalOwner,
        Timestamp

    $Scorecard = Get-GovernanceScorecard -Findings $Findings

    $Html = $ReportData | ConvertTo-Html `
        -Title "Microsoft 365 Governance Report" `
        -PreContent @"
<h1>M365 Governance Assessment</h1>

<h2>Executive Summary</h2>

<p><strong>Governance Score:</strong> $($Scorecard.GovernanceScore)</p>

<ul>
<li>Total Findings: $($Scorecard.TotalFindings)</li>
<li>High Severity: $($Scorecard.HighSeverity)</li>
<li>Medium Severity: $($Scorecard.MediumSeverity)</li>
<li>Low Severity: $($Scorecard.LowSeverity)</li>
</ul>
"@

    $Html | Out-File $Path

    Write-PlatformLog -Message "HTML governance report exported to $Path"

    return $Path
}
