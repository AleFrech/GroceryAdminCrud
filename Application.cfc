<cfcomponent output="false">
    <cfset this.DataSource="crud">
    <cfset this.sessionManagement=true>
    <cfset session.NotificationDeleted="no">
    <cfset application.CompanyName="Central Supply">

    <cffunction name="onRequestStart" returntype="boolean" output="true">
        <cfinclude template="Views/Header.cfm">
       <cfif not isDefined("session.User") and cgi.script_name neq "/Views/Login.cfm"  and GetDirectoryFromPath(cgi.script_name) neq "/Controllers/">
            <cflocation url="/Views/Login.cfm" addtoken="false">
        </cfif>
        <cfreturn true>
    </cffunction>

    <cffunction name="onRequestEnd" returntype="void" output="true">
        <cfinclude template="Views/Footer.cfm">
    </cffunction>

    <cffunction name="onError" returnType="void">
        <cfargument name="Exception" required=true/>
        <cfargument name="EventName" type="String" required=true/>
        <cfoutput>
            <h2>An unexpected error occurred.</h2>
            <h3>#Arguments.Exception.Message#</h3>
        <p>Error details:<br>
            <cfdump var=#Arguments.Exception#></p>
        </cfoutput>
    </cffunction>

</cfcomponent>