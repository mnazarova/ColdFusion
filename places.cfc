<!---
<script>
    alert("123!");
</script>
<cffunction name="getData" access="remote" output="true">
    <cfargument name="page">
    <cfargument name="pageSize">
    <!---<cfargument name="gridsortcolumn" default="user_id">--->
    <cfargument name="gridstartdirection" default="ASC">
    <cfset query = "SELECT date, short_description, user_id, status_id, urgency_id, criticalness_id
FROM error " >
    <cfif gridsortcolumn neq "" or gridstartdirection neq "">
        <cfset query=query & " order by #gridsortcolumn#
#gridstartdirection#">
    </cfif>
    <cfquery name="team" datasource="DB">
        <cfoutput>#query#</cfoutput>
    </cfquery>
    <cfreturn QueryConvertForGrid(team, page, pageSize)>
</cffunction>
--->
<!---
<cffunction name="getData" access="remote" output="false">
    <cfargument name="page">
    <cfargument name="pageSize">
    <cfargument name="gridsortcolumn">
    <cfargument name="gridstartdirection">
    <cfset query = "SELECT name FROM status" >
    <cfif gridsortcolumn neq "" or gridstartdirection neq "">
        <cfset query=query & " order by #gridsortcolumn# #gridstartdirection#">
    </cfif>
    <cfquery name="team" datasource="cfdocexamples">
        <cfoutput>#query#</cfoutput>
    </cfquery>
    <cfreturn queryConvertForGrid(team, page, pageSize)>
</cffunction>--->