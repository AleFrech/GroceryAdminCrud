<cfinvoke component="Controllers.EmployeeController" method="GetEmployee" employeeId= #session.User.ID#
                returnvariable="employee">

<cfinvoke component="Controllers.DepartmentController" method="GetDepartment" id=#employee.DepartmentId#
                returnvariable="department">

<div class="container">
    <div class="row">
        <div class=" col-md-offset-3 col-xs-12  col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="../Resources/profile.png" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4><cfoutput>#employee.Name#</cfoutput></h4>
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i><cfoutput> #employee.Email#</cfoutput>
                            <br />
                            <i class="glyphicon glyphicon-list-alt"></i><cfoutput> #department.Name#</cfoutput> Department
                            <br />
                            <i class="glyphicon glyphicon-star-empty"></i><cfoutput> #employee.StartingDate#</cfoutput>
                        <div class="btn-group">
                             <a href="ChangePassword.cfm" class="btn btn-default btn-sm btn-gradient-blue">Change Password</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
