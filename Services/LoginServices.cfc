<cfcomponent output="false">

    <cffunction access="public" returntype="query" name="GetUserCredentials">
        <cfargument required="true" type="component" name="model">
        <cfquery name="UserInfo" maxrows="1">
            SELECT ID,Name,Email,Password,DepartmentId,RoleId,Salt
             From Users
             Where Email='#arguments.model.getEmail()#'
        </cfquery>
        <cfreturn UserInfo >
    </cffunction>

</cfcomponent>



