<cfcomponent output="false">

    <cffunction access="public" returntype="query" name="GetLogs">
        <cfquery name="Departments">
           Select Logs.ID, Logs.Log,Logs.TIme,Logs.Date
           From Logs
           Order By Logs.ID
        </cfquery>
        <cfreturn Departments>
    </cffunction>

    <cffunction access="public" returntype="boolean" name="AddLog">
        <cfargument required="true" type="string" name="message">
        <cfquery name="department">
           Insert into Logs(Log,Time,Date)
           Values('#arguments.message#','#timeFormat(now(),"hh:mm:ss")#','#dateFormat(now(),"yyyy/mm/dd")#')
        </cfquery>
        <cfreturn true>
    </cffunction>

</cfcomponent>