<!---<cffunction name="getData" access="remote" output="false">--->
    <!---<cfargument name="page">--->
    <!---<cfargument name="pageSize">--->
    <cfset gridsortcolumn="user_id">
    <cfset query = "SELECT name FROM status" >
    <cfif 1>
        <cfset query=query & " order by #gridsortcolumn# ASC">
    </cfif>
    <cfquery name="team" datasource="cfdocexamples">
        <cfoutput>#query#</cfoutput>
    </cfquery>
<cfdump var="#team#">
    <cfreturn queryConvertForGrid(team, 1, 5)>
<!---</cffunction>--->
<!---{"COLUMNS":["TEAM"],"DATA":[["Dallas Cowboys"],["NY Giants"],["Philadelphia Eagles"],["Washington Redskins"]]}--->
<!---<cfif cgi.request_method IS "post">
<div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-8 col-md-7 col-lg-5">

    <div class="mt-5 text-center h3">
        <b>Ввод новой ошибки</b>
    </div>
    <hr>
    <script>
        alert("!!!!!!");
    </script>
</div>
</cfif>--->