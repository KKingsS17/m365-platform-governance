function Get-TeamsInventory {

    [CmdletBinding()]
    param (
        $Context
    )

    $Teams = $Context.TeamsDataset

    Write-PlatformLog -Message "Collecting Teams inventory"

    $Inventory = foreach ($Team in $Teams) {

        [PSCustomObject]@{
            TeamName              = $Team.DisplayName
            TeamId                = $Team.Id
            Visibility            = $Team.Visibility
            CreatedDateTime       = $Team.CreatedDateTime
            MailNickname          = $Team.MailNickname
            Description           = $Team.Description
            Classification        = $Team.Classification
            ResourceProvisioning  = "Team"
        }
    }

    return $Inventory
}
