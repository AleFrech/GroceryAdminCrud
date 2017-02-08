<cfinvoke component="Services.LogsServices" method="GetLogs" returnvariable="logs">
<cfdocument format="PDF">
    <cfoutput>
        <cfdocumentitem type="header">
            <h1 style="text-align:center;">Logs</h1>
        </cfdocumentitem>
    </cfoutput>

    <table class="table table-striped custab text-center">
    <thead>
    <tr>
        <th class="text-center" >Log</th>
        <th class="text-center">   Time</th>
        <th class="text-center">   Date</th>
    </tr>
    </thead>
    <cfoutput query="logs">
        <p>
        <tr>
        <td>#Log#</td>
        <td>   #Time#</td>
        <td>   #Date#</td>
        </tr>
        </p>

    </cfoutput>
    </table>
    <cfoutput>
        <cfdocumentitem type="footer">
            <h1 style="text-align:center;">Page #cfdocument.currentPageNumber# of #cfdocument.totalPageCount#</h1>
        </cfdocumentitem>
    </cfoutput>
</cfdocument>