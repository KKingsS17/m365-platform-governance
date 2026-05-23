function Invoke-NamingConventionRemediation {

    [CmdletBinding(SupportsShouldProcess)]
    param (
        [array]$Findings
    )

    Write-PlatformLog -Message "Starting naming convention remediation"

    foreach ($Finding in $Findings) {

        if ($Finding.Control -eq "Naming Convention Drift") {

            Write-PlatformLog `
                -Message "Remediation required for resource: $($Finding.Resource)" `
                -Level Warning

            if ($PSCmdlet.ShouldProcess($Finding.Resource, "Apply naming convention remediation")) {

                Write-PlatformLog `
                    -Message "Simulated remediation executed for $($Finding.Resource)"

                Write-RemediationLog `
                    -Resource $Finding.Resource `
                -Action "Naming convention remediation simulated"
            }
        }
    }
}
