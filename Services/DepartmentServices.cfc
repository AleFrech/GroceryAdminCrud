<cfcomponent output="false">

    <cffunction access="public" returntype="query" name="GetDepartments">
        <cfquery name="Departments">
           Select Department.ID, Department.Name,Department.ImageUrl
           From Department
           Order By Department.ID
        </cfquery>
        <cfreturn Departments>
    </cffunction>

    <cffunction access="public" returntype="query" name="GetProductsDepartments">
        <cfquery name="Departments">
           Select Department.ID, Department.Name,Department.ImageUrl
           From Department
           where Department.ID != 1
           Order By Department.ID
        </cfquery>
        <cfreturn Departments>
    </cffunction>


    <cffunction access="public" returntype="query" name="GetDepartment">
        <cfargument required="true" type="numeric" name="id">
        <cfquery name="department">
           Select Department.ID, Department.Name,Department.ImageUrl
           From Department
           where Department.ID=#arguments.id#
        </cfquery>
        <cfreturn department>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="UpdateDepartment">
        <cfargument required="true" type="numeric" name="id">
        <cfargument required="true" type="component" name="model">
        <cfquery name="department">
             Update Department
             Set Name='#arguments.model.getName()#',ImageUrl='#arguments.model.getImageUrl()#'
             Where ID=#arguments.id#
        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="AddDepartment">
        <cfargument required="true" type="component" name="model">
        <cfquery name="department">
           Insert into Department(Name,ImageUrl)
           Values('#arguments.model.getName()#','#arguments.model.getImageUrl()#')
        </cfquery>
        <cfreturn true>
    </cffunction>

</cfcomponent>



