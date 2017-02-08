<cfcomponent output="false">

    <cffunction access="public" returntype="query" name="GetEmployees">
        <cfquery name="employees">
           Select Users.ID, Users.Name ,Users.Salary,Users.StartingDate,
                  Users.Email,Users.Password  ,Department.Name AS 'Department',Roles.Role
           From Users
           Inner Join Department On Users.DepartmentId = Department.ID
           Inner join Roles on Users.RoleId=Roles.ID
        </cfquery>
        <cfreturn employees>
    </cffunction>

    <cffunction access="public" returntype="query" name="GetEmployeesByDepartment">
        <cfargument required="true" type="numeric" name="id">
        <cfquery name="employees">
           Select Users.ID, Users.Name ,Users.Salary,Users.StartingDate,
                  Users.Email,Users.Password  ,Department.Name AS 'Department',Roles.Role
           From Users
           Inner Join Department On Users.DepartmentId = Department.ID
           Inner join Roles on Users.RoleId=Roles.ID
           where Users.DepartmentId=#arguments.id#
        </cfquery>
        <cfreturn employees>
    </cffunction>


    <cffunction access="public" returntype="query" name="GetEmployee">
        <cfargument required="true" type="numeric" name="id">
        <cfquery name="employee">
             Select Users.ID, Users.Name ,Users.Salary,Users.StartingDate,
                  Users.Email,Users.Password  ,Users.DepartmentId,Users.RoleId
             From Users
             where Users.ID=#arguments.id#
        </cfquery>
        <cfreturn employee>
    </cffunction>


    <cffunction access="public" returntype="boolean" name="ChangePassword">
        <cfargument required="true" type="numeric" name="id">
        <cfargument required="true" type="string" name="password">
        <cfargument required="true" type="string" name="salt">

        <cfquery name="employee">
             Update Users
             Set Password='#arguments.password#', Salt= '#arguments.salt#'
             Where ID=#arguments.id#
        </cfquery>
        <cfreturn true>
    </cffunction>


    <cffunction access="public" returntype="boolean" name="AddEmployee">
        <cfargument required="true" type="component" name="model">
        <cfargument required="true" type="string" name="salt">
        <cfquery name="employee">
           Insert into Users(Name,Salary,StartingDate,Email,Password,DepartmentId,RoleId,Salt)
           Values('#arguments.model.getName()#',#arguments.model.getSalary()#,#arguments.model.getStartingDate()#,
                  '#arguments.model.getEmail()#','#arguments.model.getPassword()#',#arguments.model.getDepartmentId()#,
                   #arguments.model.getRoleId()#,'#arguments.salt#')

        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="DeleteEmployee">
        <cfargument required="true" type="numeric" name="id">
        <cfquery name="employee">
             Delete From Users
             where Users.ID=#arguments.id#
        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="UpdateEmployee">
        <cfargument required="true" type="numeric" name="id">
        <cfargument required="true" type="component" name="model">
        <cfquery name="employee">
             Update Users
             Set Name='#arguments.model.getName()#',Salary=#arguments.model.getSalary()#,
             StartingDate=#arguments.model.getStartingDate()#,Email='#arguments.model.getEmail()#',
             Password='#arguments.model.getPassword()#',DepartmentId=#arguments.model.getDepartmentId()#,
             RoleId= #arguments.model.getRoleId()#

             Where ID=#arguments.id#
        </cfquery>
        <cfreturn true>
    </cffunction>


</cfcomponent>