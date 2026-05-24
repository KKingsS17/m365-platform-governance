function Test-TeamsGovernance {

    param (
        $Config
    )

    Write-PlatformLog -Message "Running Teams governance validation"

    $Findings = @()

    $Teams = Get-MgGroup -Filter "resourceProvisioningOptions/Any(x:x eq 'Team')"

    foreach ($Team in $Teams) {

        if (-not $Team.Owners) {

            $Findings += [GovernanceFinding]::new(
                "Teams Owner Validation",
                "Teams Governance",
                "High",
                "NonCompliant",
                $Team.DisplayName,
                "Team does not have assigned owners",
                "Assign at least one business and one technical owner",
                "M365 Platform Team"
            )
        }
    }

    return $Findings
}
