Import-Module `
    "$PSScriptRoot/../../modules/M365Governance/M365Governance.psd1" `
    -Force

Connect-M365Platform

$Findings = Invoke-GovernanceAudit -Environment prod

Export-GovernanceReport -Findings $Findings

Export-HtmlGovernanceReport -Findings $Findings
