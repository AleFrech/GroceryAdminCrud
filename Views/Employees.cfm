<cfif session.User.RoleId eq 2>
    <cfabort>
</cfif>
<cfinvoke component="Controllers.EmployeeController" method="GetEmployees" returnvariable="employees">
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
                                <cfif  session.User.RoleId eq 1 and session.User.Id neq ID>
                                        <a href="../Controllers/EmployeeController.cfc?method=delete&id=#ID#" class="btn btn-danger  btn-xs btn-gradient-red"><span class="glyphicon glyphicon-remove"></span> Delete</a>
                                </cfif>

                             </td>
                        </tr>
                </cfoutput>
        </table>
    </div>
</div>

<div class="modal fade" id="employeeNotificationModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Succes!</h4>
        </div>
        <div class="modal-body">
            <cfif isDefined("session.Notification.Deleted")>
                <p>Employee Deleted</p>
            <cfelseif isDefined("session.Notification.Edited")>
                <p>Employee Edited</p>
            <cfelseif isDefined("session.Notification.Added")>
                <p>Employee Added</p>
            </cfif>       
        </div>
      </div>
    </div>
  </div>
</div>

<cfif isDefined("session.Notification")>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#employeeNotificationModal").modal();
            window.setTimeout(function() {
              $("#employeeNotificationModal").modal("hide");
            }, 2500);
        });
    </script>
     <cfscript>
        structDelete(session,"Notification");
     </cfscript> 
</cfif>

