<cfif session.User.RoleId eq 2>
    <cfabort>
    </cfif>

    <cfinvoke component="Controllers.DepartmentController" method="GetDepartments" returnvariable="departments">
        <div class="container">

            <div class="row col-md-10 col-md-offset-1 custyle">
                <table class="table table-striped custab text-center">
                            <a href="DepartmentEdit.cfm" class="btn btn-primary btn-xs btn-gradient-blue " ><b>+</b> Add Department</a>
                </table>
                <cfoutput query="departments">
                <div class="item  col-4 col-lg-4">
                    <div class="thumbnail">
                        <img class="group ist-group-image" src="#ImageUrl#" style="height: 167px; width:400" />
                        <div class="caption">
                            <h4 class="group inner list-group-item-heading">#Name#</h4>
                                <cfif ID is not 1>
                                    <a class="btn btn-info btn-xs btn-gradient-green" href="ProductsByDepartment.cfm?departmentId=#ID#"><span class="glyphicon glyphicon-grain"></span>Products</a>
                                </cfif>
                                <a class="btn btn-info btn-xs btn-gradient-red" href="EmployeesByDepartment.cfm?departmentId=#ID#"><span class="glyphicon glyphicon-user"></span> Employees</a>
                                <cfif  session.User.RoleId eq 1>
                                    <a class="btn btn-info btn-xs btn-gradient-blue" href="DepartmentEdit.cfm?departmentId=#ID#"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                                </cfif>
                            </div>
                        </div>
                    </div>
                </cfoutput>
            </div>
            
        </div>
      

      <div class="modal fade" id="departmentNotificationModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Succes!</h4>
        </div>
        <div class="modal-body">
            <cfif isDefined("session.Notification.Deleted")>
                <p>Department Deleted</p>
            <cfelseif isDefined("session.Notification.Edited")>
                <p>Department Edited</p>
            <cfelseif isDefined("session.Notification.Added")>
                <p>Department Added</p>
            </cfif>       
        </div>
      </div>
    </div>
  </div>
</div>

<cfif isDefined("session.Notification")>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#departmentNotificationModal").modal();
            window.setTimeout(function() {
              $("#departmentNotificationModal").modal("hide");
            }, 2500);
        });
    </script>
     <cfscript>
        structDelete(session,"Notification");
     </cfscript> 
</cfif>
