component output="false"{

    public query function GetRoles()
    {
        rolesServices = createObject("component", "Services.RoleServices");
        return rolesServices.GetRoles();
    }
}