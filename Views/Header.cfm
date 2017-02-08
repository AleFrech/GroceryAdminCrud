<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<html>
<head>
    <link rel="icon" href="../Resources/icon.png" type="image/x-icon">
<title><cfoutput>#application.CompanyName#</cfoutput></title>
    <link rel="stylesheet" type="text/css" href="/CSS/header1.css">
    <link rel="stylesheet" type="text/css" href="/CSS/Home.css">
    <link rel="stylesheet" type="text/css" href="/CSS/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="/CSS/EditForm.css">
    <link rel="stylesheet" type="text/css" href="/CSS/DropDownProfile.css">

<link rel="stylesheet" type="text/css" href="/CSS/products.css">

    <script src = "../JS/ActiveBar.js" type = "text/javascript"></script>
    <style>

</style>
</head>

<body>

<div class="container">
    <!-- Topper w/ logo -->
    <div class="row hidden-xs topper">
        <div class="col-xs-7 col-sm-7">
            <a><img am-TopLogo alt="SECUREVIEW"  src="../Resources/icon.png" class="img-responsive"></a>
        </div>
        <div class="col-xs-5 col-xs-offset-1 col-sm-5 col-sm-offset-0 text-right ">
        </div>
    </div> <!-- End Topper -->
</div>
<nav class="navbar navbar-default navbar-inverse" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/Views/Products.cfm"><cfoutput>#application.CompanyName#</cfoutput></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    <ul class="nav navbar-nav js-nav-add-active-class">
        <li><a href="/Views/Products.cfm">Products</a></li>
         <cfif isDefined("session.User") >
            <cfif session.User.RoleId eq 1>
                <li><a href="/Views/Departments.cfm">Departments</a></li>
                <li><a href="/Views/Employees.cfm">Employees</a></li>
                    <li><a href="/Views/Logs.cfm">Logs</a></li>
            </cfif>
           
        </cfif>
    </ul>
            <ul class="nav navbar-nav navbar-right">
                <cfif isDefined("session.User")>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown"><cfoutput>#session.User.Email#</cfoutput>
                            <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <div class="navbar-content">
                                        <div class="row">
                                            <div class="col-md-5">
                                                <img src="../Resources/profile.png"
                                                     alt="Alternate Text" class="img-responsive" />
                                            </div>
                                            <div class="col-md-7">
                                                <span><cfoutput>#session.User.Name#</cfoutput></span>
                                                <p class="text-muted small">
                                                        <cfoutput>#session.User.Email#</cfoutput></p>
                                                <div class="divider">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="navbar-footer">
                                        <div class="navbar-footer-content">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <a href="ProfileView.cfm" class="btn btn-default btn-sm btn-gradient-blue"> <span class="glyphicon glyphicon-cog"></span> Profile Settings</a>
                                                </div>
                                                <div class="col-md-6">
                                                    <a href="/Controllers/LogoutController.cfc?method=logout" class="btn btn-default btn-sm btn-sm btn-gradient-red pull-right"><span class="glyphicon glyphicon-log-out"></span>Log Out</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </li>
                </cfif>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>