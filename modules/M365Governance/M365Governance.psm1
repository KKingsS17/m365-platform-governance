# Import Classes
Get-ChildItem -Path "$PSScriptRoot\Classes\*.ps1" | ForEach-Object {
    . $_.FullName
}

# Import Public Functions
Get-ChildItem -Path "$PSScriptRoot\Public\*.ps1" | ForEach-Object {
    . $_.FullName
}

# Import Private Functions
Get-ChildItem -Path "$PSScriptRoot\Private\*.ps1" -Recurse | ForEach-Object {
    . $_.FullName
}

# Export Public Functions
Export-ModuleMember -Function @(
    'Connect-M365Platform',
    'Get-TenantBaseline',
    'Invoke-GovernanceAudit',
    'Export-GovernanceReport',
    'Write-PlatformLog',
    'Export-HtmlGovernanceReport',
    'Get-GovernanceMetrics',
    'Invoke-PlatformRemediation',
    'Get-GovernanceScorecard',
    'Get-TechnicalDebtReport',
    'Export-GovernanceTrend',
    'Get-ExecutiveGovernanceSummary'
)
