component output="false"{

    logServices=createObject("component","Services.LogsServices");

    public query function GetProducts(){
        productsServices=createObject("component","Services.ProductServices");
        products=productsServices.GetProducts();
        return products;
    }

    public query function GetProduct(required numeric productId){
        productsServices=createObject("component","Services.ProductServices");
        product=productsServices.GetProduct(productId);
        return product;
    }

    remote function add(Form form){
        productModel=createObject("component","Models.ProductEntryModel");
        productModel.init(form);

        productsServices=createObject("component","Services.ProductServices");
        productsServices.AddProduct(productModel);
        logServices.AddLog("Table Products Altered : Added Product Name:"& productModel.getName());
        session.Notification = structNew();
        session.Notification.Added = "yes";
        location("../Views/Products.cfm");
    }

    remote function delete(numeric id){
        productsServices=createObject("component","Services.ProductServices");
        logServices.AddLog("Table Products Altered : Deleted Product Id: "& id);
        productsServices.DeleteProduct(id);
        session.Notification = structNew();
        session.Notification.Deleted = "yes";
        location("../Views/Products.cfm");
    }

    remote function update(Form form){
        productModel=createObject("component","Models.ProductEntryModel");
        productModel.init(form);
        productsServices=createObject("component","Services.ProductServices");
        productsServices.UpdateProduct(form.id,productModel);
        logServices.AddLog("Table Products Altered : Updated Product Id: "& form.id);
        session.Notification = structNew();
        session.Notification.Edited = "yes";
        location("../Views/Products.cfm");
    }
}
