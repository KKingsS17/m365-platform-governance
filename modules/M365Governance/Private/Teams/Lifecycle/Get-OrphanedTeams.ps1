function Get-OrphanedTeams {

    [CmdletBinding()]
    param (
        $Teams
    )

    Write-PlatformLog -Message "Running orphaned Teams validation"

    $Findings = @()

    foreach ($Team in $Teams) {

        $Owners = Get-MgGroupOwner `
            -GroupId $Team.Id

        if (-not $Owners) {

            $Findings += [GovernanceFinding]::new(
                "Orphaned Team",
                "Teams Lifecycle",
                "High",
                "NonCompliant",
                $Team.DisplayName,
                "Team does not have assigned owners",
                "Assign at least one business owner",
                "Collaboration Platform Team"
            )
        }
    }

    return $Findings
}
