
<cfinvoke component="Controllers.DepartmentController" method="GetProductsDepartments" returnvariable="departments">
<cfset EditMode=isDefined("Url.productId")>
<cfif EditMode>
        <cfinvoke component="Controllers.ProductController" method="GetProduct" productId=#Url.productId#
                returnvariable="product">

    <cfset Name=#product.Name#>
    <cfset Price=#product.Price#>
    <cfset Quantity=#product.Quantity#>
    <cfset DepartmentId=#product.DepartmentId#>
    <cfset ImageUrl=#product.ImageUrl#>
    <cfset action="../Controllers/ProductController.cfc?method=update">
    <cfset ButtonText="Update">

<cfelse>

    <cfset Name="">
    <cfset Price="">
    <cfset Quantity="">
    <cfset DepartmentId = "">
    <cfset ImageUrl="">
    <cfset action="../Controllers/ProductController.cfc?method=add">
    <cfset ButtonText="Add">

</cfif>

<cfif session.User.RoleId eq 2>
    <cfset DepartmentId = session.User.DepartmentId>
</cfif>


<div class="container">
    <div class="col-md-5 col-md-offset-3">
        <div class="form-area">
            <cfform  action=#action# method="post" role="form">
                <br style="clear:both">
                    <cfif editmode>
                            <h3 style="margin-bottom: 25px; text-align: center;">Update Product</h3>
                    <cfelse>
                            <h3 style="margin-bottom: 25px; text-align: center;">Add Product</h3>
                    </cfif>

                <div class="form-group">
                <cfif editmode>
                      <cfinput type="hidden" class="form-control" name="id"  value=#Url.productId#
                        required="yes"  validateat="onSubmit,onServer">
                </cfif>

                </div>

                <div class="form-group">
                    <cfinput type="text" class="form-control" name="name" placeholder="Name" value=#Variables.Name#
                        required="yes"  validateat="onSubmit,onServer">
                </div>
                <div class="form-group">
                    <cfinput type="text" class="form-control" name="quantity" placeholder="Quantity" value=#Variables.Quantity#
                        required="yes" validate="integer" validateat="onSubmit,onServer">
                </div>
                <div class="form-group">
                    <cfinput type="text" class="form-control" name="price" placeholder="Price" value=#Variables.Price#
                        required="yes" validate="float" validateat="onSubmit,OnServer">
                </div>
                <div class="form-group">
                    <cfinput type="text" class="form-control" name="imageUrl" placeholder="Image Url" value=#Variables.ImageUrl#
                        required="yes">
                </div>
                <cfif session.User.RoleId eq 2>
                    <div class="form-group">
                         <cfinput type="hidden" class="form-control" name="departmentId"  value=#Variables.DepartmentId#
                        required="yes"  validateat="onSubmit,onServer">
                <cfelse>   
                        <cfselect name="departmentId"
                              query="departments"
                              value="ID"
                              display="Name"
                              selected="#Variables.DepartmentId#">
                        </cfselect>

                         <cfinput name="button" class="btn btn-primary  btn-gradient-blue pull-right" type="submit" value=#Variables.ButtonText#>
                    </div>
                </cfif>

            </cfform>
        </div>
    </div>
</div>