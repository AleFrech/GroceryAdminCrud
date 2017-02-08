<cfif session.User.RoleId eq 1>
        <cfinvoke component="Controllers.ProductController" method="GetProducts" returnvariable="products">
   <cfelse>
        <cfinvoke component="Controllers.DepartmentController" method="GetProductsByDepartment" id=#session.User.DepartmentId# returnvariable="products">
</cfif>

<div class="container">
    <!--- <cfdump var="#Products#" abort/> --->
    <div class="row col-md-12 col-md-offset-1 custyle">

        <cfif session.User.RoleId eq 2>
            <h3><cfoutput>#Products.Department# Departments</cfoutput></h3>
        <cfelse>
             <h3>Products</h3>
         </cfif>

        <table class="table table-striped custab text-center">
           <div>
           <a href="ProductEdit.cfm" class="btn btn-primary btn-xs btn-gradient-blue" ><b>+</b> Add Products</a>
        </div>
        </table>
         <cfoutput query="products">
            <div class="col-md-2 column productbox" >
                <cfif Products.OutofStock >
                     <img src="http://www.livarea.com/sites/default/files/styles/large/public/field/image/soldout.png" class="image img-responsive">

                <cfelse>
                   <img src="#Products.ImageUrl#" class="image img-responsive">
                </cfif>

                <div class="producttitle">#Products.Name#</div>
                <div class="productprice">
                    <div class="pricetext">$ #Products.Price#</div>
                </div>
                 <div class="productprice">
                    <div >
                       <a class="btn btn-info btn-xs btn-gradient-blue" href="ProductEdit.cfm?productId=#Products.ID#"><span class="glyphicon glyphicon-edit"></span> Edit</a>
                        <a href="../Controllers/ProductController.cfc?method=delete&id=#Products.ID#" class="btn btn-danger  btn-xs btn-gradient-red"><span class="glyphicon glyphicon-remove"></span> Delete</a>
                    </div>
                </div>
            </div>
        </cfoutput>
    </div>
</div>





<div class="modal fade" id="productDeleteModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Warning!</h4>
        </div>
        <div class="modal-body">
            <p>Are You Sure You Want To Delete This Product</p>
        </div>
        <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary"></button>
        </div>
      </div>
    </div>
  </div>
</div>




<div class="modal fade" id="productNotificationModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Succes!</h4>
        </div>
        <div class="modal-body">
            <cfif isDefined("session.Notification.Deleted")>
                <p>Product Deleted</p>
            <cfelseif isDefined("session.Notification.Edited")>
                <p>Product Edited</p>
            <cfelseif isDefined("session.Notification.Added")>
                <p>Product Added</p>
            </cfif>
        </div>
      </div>
    </div>
  </div>
</div>

<cfif isDefined("session.Notification")>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#productNotificationModal").modal();
            window.setTimeout(function() {
              $("#productNotificationModal").modal("hide");
            }, 2500);
        });
    </script>
     <cfscript>
        structDelete(session,"Notification");
     </cfscript>
</cfif>
