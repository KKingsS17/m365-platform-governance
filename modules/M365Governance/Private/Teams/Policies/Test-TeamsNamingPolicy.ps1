function Test-TeamsNamingPolicy {

    [CmdletBinding()]
    param (
        $Context
    )

    $Teams = $Context.TeamsDataset
    $Config = $Context.TenantConfig

    Write-PlatformLog -Message "Running Teams naming policy validation"

    $Findings = @()

    foreach ($Team in $Teams) {

        if ($Team.DisplayName -notmatch "^$($Config.GovernanceStandards.NamingConventionPrefix)") {

            $Findings += [GovernanceFinding]::new(
                "Teams Naming Policy",
                "Teams Governance",
                "Medium",
                "NonCompliant",
                $Team.DisplayName,
                "Team naming convention violation detected",
                "Rename Team according to governance standards",
                "Collaboration Engineering Team"
            )
        }
    }

    return $Findings
}
