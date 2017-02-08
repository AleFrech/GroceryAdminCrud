<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>

<div class="container" style="margin-top:50px;margin-left: 33%">
    <div class="col-md-4" >
        <div class="panel panel-default">
            <div class="panel-heading"><h3 class="panel-title"><strong>Sign In </strong></h3></div>
            <div class="panel-body">
               
                <cfform  action="../Controllers/LoginController.cfc?method=Login" role="form" method="post" onsubmit="return(logvalidate())">
                        <fieldset>
                        <div class="form-group">
                            <label for="exampleInputEmail1"> Email</label>
                        <cfinput id="Email" class="form-control"  name="Email" type="text" validate="email" message="Must be a validate email"
                                                    required="yes"  validateat="onSubmit,onServer">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password <a></a></label>
                        <cfinput id="Password" class="form-control"  name="Password" type="password"
                                                    required="yes" validateat="onSubmit,onServer">


                        <font color='red'> 
                            <cfif isDefined("Url.failure")>
                                 <label >Invalid Username or Password<a></a></label>
                            </cfif>
                          
                        </font>
                        </div>
                            <input class="btn btn-sm btn-default btn-gradient-blue" type="submit" value="Sign In">
                        </fieldset>
                </cfform>
            </div>
        </div>
    </div>
</div>