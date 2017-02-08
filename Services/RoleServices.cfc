<cfcomponent output="false">

    <cffunction access="public" returntype="query" name="GetRoles">
        <cfquery name="roles">
           Select Roles.ID, Roles.Role
           From Roles
           Order By Roles.ID
        </cfquery>
        <cfreturn roles>
    </cffunction>

</cfcomponent>



