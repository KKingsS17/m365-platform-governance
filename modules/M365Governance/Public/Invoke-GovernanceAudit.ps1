function Invoke-GovernanceAudit {

    [CmdletBinding()]
    param (
        [ValidateSet('dev','test','prod')]
        [string]$Environment = 'prod'
    )

    Write-PlatformLog -Message "Starting governance audit"

    $Config = Get-TenantBaseline -Environment $Environment

    $Findings = @()

    $Findings += Test-TeamsGovernance -Config $Config
    $Findings += Test-GuestAccessGovernance -Config $Config
    $Findings += Test-GroupLifecycleGovernance -Config $Config
    $Findings += Test-GovernanceDrift -Config $Config

    Write-PlatformLog -Message "Governance audit completed"

    return $Findings
}
