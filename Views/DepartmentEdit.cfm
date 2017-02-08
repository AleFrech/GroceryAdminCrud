<cfif session.User.RoleId eq 2>
    <cfabort>
</cfif>

<cfset EditMode=isDefined("Url.departmentId")>

<cfif EditMode>
        <cfinvoke component="Controllers.DepartmentController" method="GetDepartment" id=#Url.departmentId#
                returnvariable="department">

    <cfset Name=#department.Name#>
    <cfset ImageUrl=#department.ImageUrl#>
    <cfset action="../Controllers/DepartmentController.cfc?method=update">
    <cfset ButtonText="Update">

<cfelse>

    <cfset Name="">
    <cfset ImageUrl="">
    <cfset action="../Controllers/DepartmentController.cfc?method=add">
    <cfset ButtonText="Add">

</cfif>



<div class="container">
    <div class="col-md-5 col-md-offset-3">
        <div class="form-area">
            <cfform  action=#action# method="post" role="form">
                <br style="clear:both">
                    <cfif editmode>
                            <h3 style="margin-bottom: 25px; text-align: center;">Update Department</h3>
                    <cfelse>
                            <h3 style="margin-bottom: 25px; text-align: center;">Add Department</h3>
                    </cfif>

                <div class="form-group">
                <cfif editmode>
                      <cfinput type="hidden" class="form-control" name="id"  value=#Url.departmentId#
                        required="yes"  validateat="onSubmit,onServer">
                </cfif>

                </div>
                <div class="form-group">
                    <cfinput type="text" class="form-control" name="name" placeholder="Name" value=#Variables.Name#
                        required="yes"  validateat="onSubmit,onServer">
                </div>
                <div class="form-group">
                    <cfinput type="text" class="form-control" name="imageUrl" placeholder="Image Url" value=#Variables.ImageUrl#
                        required="yes"  validateat="onSubmit,onServer">
                </div>
                     <cfinput name="button" class="btn btn-primary    btn-gradient-blue pull-right" type="submit" value=#Variables.ButtonText#>
                </div>
            </cfform>
        </div>
    </div>
</div>