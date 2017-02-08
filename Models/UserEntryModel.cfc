component output="false" accessors="true"{

    property name="Name" type="String";
    property name="Salary" type="numeric";
    property name="Email" type="String";
    property name="Password" type="String";
    property name="StartingDate" type="Date";
    property name="DepartmentId" type="numeric";
    property name="RoleId" type="numeric";


    function init(any form){

        setName(form.name);
        setEmail(form.email);
        setPassword(form.password);
        setSalary(form.salary);
        StartingDate=NOW();
        setDepartmentId(form.departmentId);
        setRoleId(form.roleId);

        return( this );
    }
}