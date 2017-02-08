component output="false" accessors="true"{

    property name="Email" type="String";
    property name="Password" type="String";

    function init(String email,String password){

        setEmail(email);
        setPassword(password);
        return (this);
    }


}