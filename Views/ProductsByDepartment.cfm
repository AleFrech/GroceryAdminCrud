<cfinvoke component="Controllers.DepartmentController" method="GetProductsByDepartment" id=#Url.departmentId#
        returnvariable="Products">

<div class="container">
    <!--- <cfdump var="#Products#" abort/> --->
    <div class="row col-md-12 col-md-offset-1 custyle">

    
            <h3><cfoutput>#Products.Department# Departments</cfoutput></h3>
      
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
                    <div class="pricetext">$ <cfdump var="#Products.Price#" abort="false"/><!--- <cfoutput>#Products.Price#</cfoutput> ---></div>
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
