<cfinvoke component="Controllers.DepartmentController" method="GetEmployeesByDepartment" id=#Url.departmentId#
        returnvariable="employees">

<div class="container">

    <div class="row col-md-12 col-md-offset-0 custyle">
            <table class="table table-striped custab text-center">
            <thead>
            <cfif session.User.RoleId eq 1>
                <a href="EmployeeEdit.cfm" class="btn btn-primary btn-xs btn-gradient-blue pull-right" ><b>+</b> Add Employee</a>
            </cfif>

            <tr>
                <th class="text-center" >Name</th>
                <th class="text-center">Salary</th>
                <th class="text-center">StartingDate</th>
                <th class="text-center">Email</th>
                <th class="text-center">Department</th>
                <th class="text-center">Role</th>
                <th class="text-center">Action</th>
            </tr>
            </thead>
            <cfoutput query="employees">
                    <tr>
                    <td>#Name#</td>
                <td>$ #Salary#</td>
                <td>#StartingDate#</td>
                <td>#Email#</td>
                <td>#Department#</td>
                <td>#Role#</td>
                <td>
                    <cfif session.User.RoleId eq 1>
                            <a class="btn btn-info btn-xs btn-gradient-blue" href="EmployeeEdit.cfm?employeeId=#ID#"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                    </cfif>
                    <cfif  session.User.RoleId eq 1>
                            <a href="../Controllers/EmployeeController.cfc?method=delete&id=#ID#" class="btn btn-danger  btn-xs btn-gradient-red"><span class="glyphicon glyphicon-remove"></span> Delete</a>
                    </cfif>

                    </td>
                    </tr>
            </cfoutput>
            </table>
    </div>
</div>

