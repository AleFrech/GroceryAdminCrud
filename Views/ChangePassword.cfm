<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<div class="form-gap"></div>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="text-center">
                        <h3><i class="fa fa-lock fa-4x"></i></h3>
                        <h2 class="text-center">ChangePassword</h2>
                        <p>You can change your password here.</p>
                        <div class="panel-body">

                            <cfform id="register-form" role="form" autocomplete="off" action="../Controllers/EmployeeController.cfc?method=ChangePassword" class="form" method="post">
                                <cfinput name="id" type="hidden" value=#session.User.ID#>
                                <div class="form-group">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                                        <input  id ="pwd" name="password" type="password" class="form-control">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock color-blue"></i></span>
                                        <input  id ="cpwd" name="confirmpassword" type="password" class="form-control">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <input name="recover-submit" class="btn btn-lg  btn-gradient-blue btn-primary btn-block" value="Reset Password" type="submit">
                                </div>
                            </cfform>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<body>
<script type="text/javascript" src="../JS/ConfirmPassword.js"></script>
</body>
