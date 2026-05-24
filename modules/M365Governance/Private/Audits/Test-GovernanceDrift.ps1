function Test-GovernanceDrift {

    param (
        $Config
    )

    Write-PlatformLog -Message "Running governance drift analysis"

    $Findings = @()

    $Groups = Get-MgGroup -All

    foreach ($Group in $Groups) {

        if ($Group.DisplayName -notmatch "^$($Config.GovernanceStandards.NamingConventionPrefix)") {

            $Findings += [GovernanceFinding]::new(
                "Naming Convention Drift",
                "Governance Drift",
                "Medium",
                "NonCompliant",
                $Group.DisplayName,
                "Group naming convention violation detected",
                "Rename group according to governance standards",
                "Collaboration Engineering Team"
            )
        }
    }

    return $Findings
}
