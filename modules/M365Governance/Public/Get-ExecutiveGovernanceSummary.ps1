function Get-ExecutiveGovernanceSummary {

    [CmdletBinding()]
    param (
        [object]$Scorecard
    )

    return @"
M365 Governance Executive Summary

Governance Score: $($Scorecard.GovernanceScore)

Total Findings: $($Scorecard.TotalFindings)

High Severity Findings: $($Scorecard.HighSeverity)
Medium Severity Findings: $($Scorecard.MediumSeverity)
Low Severity Findings: $($Scorecard.LowSeverity)

Overall Governance Posture:
$(if ($Scorecard.GovernanceScore -ge 85) {
    "Strong"
}
elseif ($Scorecard.GovernanceScore -ge 70) {
    "Moderate"
}
else {
    "Needs Improvement"
})
"@
}
