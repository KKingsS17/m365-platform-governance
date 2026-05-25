function Get-InactiveTeams {

    [CmdletBinding()]
    param (
        [int]$InactiveDays = 90,
        $Context
    )

    $Config = $Context.TenantConfig
    $Teams = $Context.TeamsDataset

    Write-PlatformLog -Message "Running inactive Teams analysis"

    $InactiveTeams = foreach ($Team in $Teams) {

        if ($Team.CreatedDateTime -lt (Get-Date).AddDays(-$InactiveDays)) {

            [PSCustomObject]@{
                TeamName        = $Team.DisplayName
                TeamId          = $Team.Id
                CreatedDateTime = $Team.CreatedDateTime
                InactiveDays    = $InactiveDays
                LifecycleState  = "ReviewRequired"
            }
        }
    }

    return $InactiveTeams
}
