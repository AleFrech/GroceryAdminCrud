<cfcomponent output="false">

    <cffunction access="public" returntype="query" name="GetProducts">
        <cfquery name="Products">
           Select Products.ID, Products.Name ,Products.OutOfStock,Products.ImageUrl,
                    Products.Quantity, Products.Price, Department.Name AS 'Department'
           From Products Inner Join Department On Products.DepartmentId = Department.ID
        </cfquery>
        <cfreturn Products>
    </cffunction>


    <cffunction access="public" returntype="query" name="GetProductsByDepartment">
        <cfargument required="true" type="numeric" name="depId">
        <cfquery name="Products">
           Select Products.ID, Products.Name ,Products.OutOfStock,Products.ImageUrl,
                    Products.Quantity, Products.Price, Department.Name AS 'Department'
           From Products Inner Join Department On Products.DepartmentId = Department.ID
           where Products.DepartmentId=#arguments.depId#
        </cfquery>
        <cfreturn Products>
    </cffunction>


    <cffunction access="public" returntype="boolean" name="AddProduct">
        <cfargument required="true" type="component" name="model">
        <cfquery name="productsInsertion">
           Insert Into Products (Products.Name ,Products.OutOfStock,
                    Products.Quantity, Products.Price, Products.DepartmentId,Products.ImageUrl)

           Values('#arguments.model.getName()#',#arguments.model.getOutofStock()#,#arguments.model.getQuantity()#,
                    #arguments.model.getPrice()#,#arguments.model.getDepartmentId()#,'#arguments.model.getImageUrl()#')

        </cfquery>
        <cfreturn true>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="DeleteProduct">
        <cfargument required="true" type="numeric" name="id">
        <cfquery name="product">
             Delete From Products
             where Products.ID=#arguments.id#
        </cfquery>
        <cfreturn true>
    </cffunction>


    <cffunction access="public" returntype="query" name="GetProduct">
        <cfargument required="true" type="numeric" name="id">
        <cfquery name="product">
             Select Products.ID, Products.Name ,Products.OutOfStock,Products.ImageUrl,
                    Products.Quantity, Products.Price, Products.DepartmentId
             From Products
             where Products.ID=#arguments.id#
        </cfquery>
        <cfreturn product>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="UpdateProduct">
        <cfargument required="true" type="numeric" name="id">
        <cfargument required="true" type="component" name="model">

        <cfset arguments.model.setOutofStock(arguments.model.getQuantity()eq 0 ? true:false)>

        <cfquery name="product">
             Update Products
             Set Name='#arguments.model.getName()#',Quantity=#arguments.model.getQuantity()#,
                        Price=#arguments.model.getPrice()#,DepartmentId=#arguments.model.getDepartmentId()#,
                        OutofStock=#arguments.model.getOutofStock()#,ImageUrl='#arguments.model.getImageUrl()#'
             Where ID=#arguments.id#
        </cfquery>
        <cfreturn true>
    </cffunction>


</cfcomponent>