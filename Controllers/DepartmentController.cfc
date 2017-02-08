component output="false" {

        logServices=createObject("component","Services.LogsServices");

        public query function GetDepartments()
        {
            var departmentServices = createObject("component", "Services.DepartmentServices");
            return departmentServices.GetDepartments();
        }

        public query function GetProductsDepartments()
        {
            var departmentServices = createObject("component", "Services.DepartmentServices");
            return departmentServices.GetProductsDepartments();
        }

        public query function GetDepartment(required numeric id)
        {
            var departmentServices = createObject("component", "Services.DepartmentServices");
            return departmentServices.GetDepartment(id);
        }

        public query function GetProductsByDepartment(required numeric id)
        {
            var productServices = createObject("component", "Services..ProductServices");
            return productServices.GetProductsByDepartment(id);
        }

        public query function GetEmployeesByDepartment(required numeric id)
        {
            var employeeServices = createObject("component", "Services.EmployeeServices");
            return employeeServices.GetEmployeesByDepartment(id);

        }

        remote function add(Form form)
        {
            if (session.User.RoleId eq 2) {
                abort;
            }
            var departmentModel = createObject("Models.DepartmentEntryModel");
            departmentModel.init(#Form.Name#, #Form.ImageUrl#);
            var departmentServices = createObject("Services.DepartmentServices");
            departmentServices.AddDepartment(departmentModel);
            logServices.AddLog("Table Departments Altered : Added Department "& departmentModel.getName());
            session.Notification = structNew();
            session.Notification.Added = "yes";
            location("../Views/Departments.cfm");
        }

        remote function update(Form form)
        {
            if (session.User.RoleId eq 2) {
                abort;
            }
            var departmentModel = createObject("component", "Models.DepartmentEntryModel");
            departmentModel.init(#Form.Name#, #Form.ImageUrl#);
            var departmentServices = createObject("component", "Services.DepartmentServices");
            departmentServices.UpdateDepartment(#Form.id#, departmentModel);
            logServices.AddLog("Table Departments Altered : Updated Department "& #Form.id#);
            session.Notification = structNew();
            session.Notification.Edited = "yes";
            location("../Views/Departments.cfm");
        }

}
