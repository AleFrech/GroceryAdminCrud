component output="false" {

    remote function Login(Form form){
        loginModel=createObject("component","Models.LoginModel");
        loginModel.init(form.Email,form.Password);

        loginService=createObject("component","Services.LoginServices");
        UserInfo=loginService.GetUserCredentials(loginModel);

        if(UserInfo.Password neq hash(loginModel.getPassword() & UserInfo.Salt,"MD5")) {
            location("../Views/Login.cfm?failure=2042");
        }

        session.User = structNew();
        session.User.ID = UserInfo.Id;
        session.User.Name = UserInfo.Name;
        session.User.Email = UserInfo.Email;
        session.User.RoleId = UserInfo.RoleId;
        session.User.DepartmentId=UserInfo.DepartmentId;
        session.User.Password = UserInfo.Password;

        location("../index.cfm");
    }
}


