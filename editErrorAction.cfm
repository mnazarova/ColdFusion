<cfif cgi.request_method IS "post" AND structKeyExists(form, "edit_error_form_submit")>
    <cfquery name="user" dataSource="DB">
            SELECT user_id id
            FROM usercf
            WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
    </cfquery>
    <cfset form.user_id = #user.id# />
    <cfupdate datasource="DB" tablename="error"
    formFields="error_id,date,short_description,long_description,user_id,status_id,urgency_id,criticalness_id" />

    <cfinsert datasource="DB" tablename="history"
        formFields="status_id,comment,user_id,error_id">

    <cfdump var="#form#" label="URL Scope" />
    <cflocation url="cardOfError.cfm?error_id=#form.error_id#" addToken="false" statusCode="301">

</cfif>