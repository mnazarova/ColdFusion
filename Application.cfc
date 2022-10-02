<cfcomponent>
    <cfset This.name = "Orders">
    <cfset This.Sessionmanagement="True">
    <cfset This.loginstorage="session">
    <cffunction name="OnRequestStart">
        <cfargument name = "request" required="true"/>
        <cfif IsDefined("Form.logout")>
            <cflogout>
        </cfif>
        <cflogin>
            <cfif NOT IsDefined("cflogin")>
                <cfinclude template="loginform.cfm">
                <cfabort>
            <cfelse>
                    <cfset password = hash(#cflogin.password#)>
                    <cfquery name="roles_query" dataSource="DB">
                        SELECT name
                        FROM role r
                        WHERE role_id IN (
                            SELECT role_id
                            FROM user_role
                            WHERE user_id = (
                                SELECT user_id
                                FROM usercf
                                WHERE
                                    login = '#cflogin.name#'
                                AND password = '#password#'
                            )
                        )
                    </cfquery>
                    <cfscript>
                        var count = #roles_query.recordcount#;
                        var roles = #roles_query.name[count--]#;
                        for(;count>0;)
                            roles = roles.concat(",#roles_query.name[count--]#");
                    </cfscript>
                    <cfif roles NEQ "">
                        <cfloginuser name="#cflogin.name#" Password = "#password#"
                                roles="#trim(roles)#">
                    <cfelse>
                        <div class="bg-danger text-white text-center pb-1 mb-3">
                            Вы ввели неверное имя и/или пароль. Попробуйте снова!
                        </div>
                        <cfinclude template="loginform.cfm">
                        <cfabort>
                    </cfif>
            </cfif>
        </cflogin>
        <cfif GetAuthUser() NEQ "">
            <cfinclude template="Menu.cfm">
        </cfif>
    </cffunction>
</cfcomponent>