component output="false"{

    logServices=createObject("component","Services.LogsServices");

    public query function GetEmployees(){
        employeesServices=createObject("component","Services.EmployeeServices");
        return employeesServices.GetEmployees();
    }

    public query function GetEmployee(required numeric employeeId){
        employeesServices=createObject("component","Services.EmployeeServices");
        return employeesServices.GetEmployee(employeeId);
    }

    remote function add(Form form){
        if(session.User.RoleId eq 2){
            abort;
        }
        employeeModel=createObject("component","Models.UserEntryModel");
        employeeModel.init(form);
        salt=createUUID();
        employeeModel.setPassword(hash(employeeModel.getPassword() & salt,"MD5"));
        employeesServices=createObject("component","Services.EmployeeServices");
        employeesServices.AddEmployee(employeeModel,salt);
        logServices.AddLog("Table Employees Altered : Added Employee Name: "& employeeModel.getName());
        session.Notification = structNew();
        session.Notification.Added = "yes";
        location("../Views/Employees.cfm");

    }

    remote function ChangePassword(Form form){
        salt=createUUID();
        newpassword=hash(form.password & salt,"MD5");
        employeesServices=createObject("component","Services.EmployeeServices");
        employeesServices.ChangePassword(form.id,newpassword,salt);
        location("../Views/Products.cfm");
    }

    remote function delete(numeric id){
        if(session.User.RoleId eq 2){
            abort;
        }
        employeesServices=createObject("component","Services.EmployeeServices");
        employeesServices.DeleteEmployee(#arguments.id#);
        logServices.AddLog("Table Employees Altered : Deleted Employee Id: "& #arguments.id#);
        session.Notification = structNew();
        session.Notification.Deleted = "yes";
        location("../Views/Employees.cfm");
    }

    remote function update(Form form){
        if(session.User.RoleId eq 2){
            abort;
        }
        employeeModel=createObject("component","Models.UserEntryModel");
        employeeModel.init(#Form#);
        employeesServices=createObject("component","Services.EmployeeServices");
        employeesServices.UpdateEmployee(#Form.id#,employeeModel);
        logServices.AddLog("Table Employees Altered : Deleted Employee Id: "& #Form.id#);
        session.Notification = structNew();
        session.Notification.Edited = "yes";
        location("../Views/Employees.cfm");
    }

}

