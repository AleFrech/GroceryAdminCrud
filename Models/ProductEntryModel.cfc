component output="false" accessors="true"{

    property name ="Name" type="String";
    property name ="Price" type="numeric";
    property name ="DepartmentId" type="numeric";
    property name ="OutOfStock" type="boolean";
    property name ="Quantity" type="numeric";
    property name="ImageUrl" type="string";


    function init(any form){

        setName(form.name);
        setPrice(form.price);
        setDepartmentId(form.departmentId);
        setOutOfStock(false);
        setQuantity(form.quantity);
        setImageUrl(form.imageUrl);
        return( this );
    }

}