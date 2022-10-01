<cfif cgi.request_method IS "post" AND structKeyExists(form, "btn_form_submit")>
    <cfquery name="user" dataSource="DB">
            SELECT user_id id
            FROM usercf
            WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
    </cfquery>
    <cfset form.user_id = #user.id# />
    <cfinsert datasource="DB" tablename="error"
            formFields="short_description,long_description,user_id,status_id,urgency_id,criticalness_id">
    <cfquery name="error" dataSource="DB">
            SELECT error_id id
            FROM error
            ORDER BY error_id DESC LIMIT 1
    </cfquery>
    <cfset form.error_id = #error.id# />
    <cfset form.comment = "-" />
    <cfinsert datasource="DB" tablename="history"
            formFields="user_id,status_id,error_id,comment">
    <cflocation url="cardOfError.cfm?error_id=#error.id#" addToken="false" statusCode="301">
</cfif>