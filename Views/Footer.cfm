<!---
 Filename: SiteFooter.cfm
 Created by: Nate Weiss (NMW)
 Please Note Included in every page by OnRequestEnd.cfm
--->

<!--- Display copyright notice at bottom of every page --->
<link rel="stylesheet" type="text/css" href="/CSS/footer.css">


<div class="copyright">
    <div class="container">
        <div class="col-md-offset-1">
            <cfoutput>
                    <p class="footer col-lg-offset-4">
                        (c) #year(now())# #application.companyName#. All rights reserved.
                </p>
            </cfoutput>
        </div>

    </div>
</div>


</body>
</html>
