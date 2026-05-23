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

    $Html = $ReportData | ConvertTo-Html `
        -Title "Microsoft 365 Governance Report" `
        -PreContent @"
<h1>M365 Governance Assessment</h1>

<h2>Executive Summary</h2>

<p>
This report contains governance findings identified during automated Microsoft 365 platform validation.
</p>
"@

    $Html | Out-File $Path

    Write-PlatformLog -Message "HTML governance report exported to $Path"

    return $Path
}
