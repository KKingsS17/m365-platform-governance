function Test-GroupLifecycleGovernance {

    param (
        $Config
    )

    Write-PlatformLog -Message "Running group lifecycle validation"

    $Findings = @()

    $Groups = Get-MgGroup -All

    foreach ($Group in $Groups) {

        if ($Group.CreatedDateTime -lt (Get-Date).AddDays(-90)) {

            $Findings += [GovernanceFinding]::new(
                "Group Lifecycle Review",
                "Lifecycle Management",
                "Low",
                "Review",
                $Group.DisplayName,
                "Group exceeds lifecycle review threshold"
            )
        }
    }

    return $Findings
}
