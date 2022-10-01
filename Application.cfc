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
                <cfif cflogin.name IS "" OR cflogin.password IS "">
                    <cfoutput>
                        <h2>You must enter text in both the User Name
                            and Password fields.
                        </h2>
                    </cfoutput>
                    <cfinclude template="loginform.cfm">
                    <cfabort>
                <cfelse>
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
                                AND password = '#cflogin.password#'
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
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#"
                                roles="#trim(roles)#">
                        <!---<cflocation url="index.cfm" addToken="false" statusCode="301">--->
                    <cfelse>
                        <cfoutput>
                            <div class="bg-danger text-white text-center pb-1 mb-3">
                                Вы ввели неверное имя и/или пароль. Попробуйте снова!
                            </div>

                            <!---<H2>Your login information is not valid.<br>
                                Please Try again</H2>--->
                        </cfoutput>
                        <cfinclude template="loginform.cfm">
                        <cfabort>
                    </cfif>
                </cfif>
            </cfif>
        </cflogin>
        <cfif GetAuthUser() NEQ "">
            <cfoutput>
                <!---<form action="securitytest.cfm" method="Post">
                    <input type="submit" Name="Logout" value="Logout">
                </form>--->
                <!---<cflocation url="errorList.cfm" addToken="false" statusCode="301">--->


                <cfinclude template="Menu.cfm">

            </cfoutput>
        </cfif>
    </cffunction>
</cfcomponent>