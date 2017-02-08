component output="false" accessors="true"{

    property name="Name" type="String";
    property name="ImageUrl" type="String";

    function init(String name,string imageUrl){

        setName(name);
        setImageUrl(imageUrl);
        return (this);
    }
}