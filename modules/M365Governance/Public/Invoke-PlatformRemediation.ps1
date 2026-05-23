function Invoke-PlatformRemediation {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        [array]$Findings
    )

    Test-RemediationSafety

    Write-PlatformLog -Message "Starting platform remediation workflow"

    Invoke-NamingConventionRemediation `
        -Findings $Findings `
        -WhatIf:$WhatIfPreference

    Write-PlatformLog -Message "Platform remediation workflow completed"
}
