function Invoke-GovernanceAudit {

    [CmdletBinding()]
    param (
        [string]$ConfigPath = ".\config\tenant-baseline.json"
    )

    Write-PlatformLog -Message "Starting governance audit"

    $Config = Get-TenantBaseline -ConfigPath $ConfigPath

    $Findings = @()

    $Findings += Test-TeamsGovernance -Config $Config
    $Findings += Test-GuestAccessGovernance -Config $Config
    $Findings += Test-GroupLifecycleGovernance -Config $Config
    $Findings += Test-GovernanceDrift -Config $Config

    Write-PlatformLog -Message "Governance audit completed"

    return $Findings
}
