<cfif session.User.RoleId eq 2>
    <cfabort>
</cfif>

<cfinvoke component="Controllers.DepartmentController" method="GetProductsDepartments" returnvariable="departments">
<cfinvoke component="Controllers.RoleController" method="GetRoles" returnvariable="roles">
<cfset EditMode=isDefined("Url.employeeId")>
<cfif EditMode>
        <cfinvoke component="Controllers.EmployeeController" method="GetEmployee" employeeId=#Url.employeeId#
                returnvariable="employee">


    <cfset Name=#employee.Name#>
    <cfset Salary=#employee.Salary#>
    <cfset StartingDate=#employee.StartingDate#>
    <cfset Email=#employee.Email#>
    <cfset Password=#employee.Password#>
    <cfset DepartmentId=#employee.DepartmentId#>
    <cfset RoleId=#employee.RoleId#>
    <cfset action="../Controllers/EmployeeController.cfc?method=update">
    <cfset ButtonText="Update">

<cfelse>

    <cfset Name="">
    <cfset Salary="">
    <cfset StartingDate="">
    <cfset Email="">
    <cfset Password="">
    <cfset DepartmentId="">
    <cfset RoleId="">
    <cfset action="../Controllers/EmployeeController.cfc?method=add">
    <cfset ButtonText="Add">

</cfif>



<div class="container">
    <div class="col-md-5 col-md-offset-3">
        <div class="form-area">
            <cfform  action=#action# method="post" role="form">
                <br style="clear:both">
                    <cfif editmode>
                            <h3 style="margin-bottom: 25px; text-align: center;">Update Employee</h3>
                    <cfelse>
                            <h3 style="margin-bottom: 25px; text-align: center;">Add Employee</h3>
                    </cfif>

                <div class="form-group">
                <cfif editmode>
                      <cfinput type="hidden" class="form-control" name="id"  value=#Url.employeeId#
                        required="yes"  validateat="onSubmit,onServer">
                </cfif>

                </div>
                <div class="form-group">
                             <cfinput type="text" class="form-control" name="name" placeholder="Name" value=#Variables.Name#
                        required="yes"  validateat="onSubmit,onServer">
                    
                </div>
                <div class="form-group">
                              <cfinput type="text" class="form-control" name="email" placeholder="Email" value=#Variables.Email#
                        required="yes" validate="email" validateat="onSubmit,onServer">           
                </div>
                <div class="form-group">
                           <cfinput type="password" class="form-control" name="password" placeholder="Password" value=#Variables.Password#
                        required="yes"  validateat="onSubmit,onServer">
                </div>

                <div class="form-group">

                <cfinput type="text" class="form-control" name="salary" placeholder="Salary" value=#Variables.Salary#
                        required="yes" validate="float" validateat="onSubmit,OnServer" >
                </div>


                <div class="form-group">
                <cfselect name="departmentId"
                              query="departments"
                              value="ID"
                              display="Name"
                              selected="#Variables.DepartmentId#">
                    </cfselect>
                </div>

                <div class="form-group">
                <cfselect name="roleId"
                              query="roles"
                              value="ID"
                              display="Role"
                              selected="#Variables.RoleId#">
                    </cfselect>
                </div>


                <div class="form-group">
                <cfif not editmode>
                        <cfinput type="datefield" class="form-control" name="startingDate" placeholder="StartingDate" value=#Variables.StartingDate#
                            required="yes" validate="date" validateat="onSubmit,onServer">
                </cfif>
                  <cfinput name="button" class="btn btn-primary   btn-gradient-blue pull-right" type="submit" value=#Variables.ButtonText#>

                </div>
                </div>
            </cfform>
        </div>
    </div>
</div>