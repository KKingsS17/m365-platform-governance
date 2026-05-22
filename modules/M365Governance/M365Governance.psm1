function Connect-M365Platform {
    [CmdletBinding()]
    param ()

    Connect-MgGraph -Scopes "Directory.Read.All", "Group.Read.All"
}

Export-ModuleMember -Function Connect-M365Platform
