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
                    <cfquery name="user_id_query" dataSource="DB">
                        SELECT user_id
                        FROM usercf
                        WHERE
                        login = '#cflogin.name#'
                    AND password = '#cflogin.password#'
                    </cfquery>
                    <cfquery name="roles_query" dataSource="DB">
                        SELECT name as roles
                        FROM role r
                        WHERE role_id IN (
                        SELECT role_id
                        FROM user_role
                        WHERE user_id = #user_id_query.user_id#
                        )
                    </cfquery>
<!---<cfdump var="#roles_query#" label="URL Scope" />--->
                    <cfif roles_query.roles NEQ "">
                        <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#"
                                roles="#trim(roles_query.roles)#">
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


<!---<cfdump var="#url#" label="URL Scope" />--->

<!---<cfdump var="#cgi#" label="URL Scope" />--->
<!---<cfdump var="#Request#" label="URL Scope">--->

<!---<cfapplication>
  <cfset This.name = "Test">
  <cfset This.Sessionmanagement="True">
  <cfset This.loginstorage="session">
  <cffunction name="OnRequestStart">
      <cfargument name = "request" required="true"/>
      <cfif IsDefined("Form.logout") or IsDefined("URL.logout")>
          1
          <cflogout>
      </cfif>
      <cflogin>
          <cfif NOT IsDefined("cflogin")>
              2
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
                  3
                  <cfquery name="loginQuery" dataSource="cfdocexamples">
                      SELECT user_id, role
                      FROM usercf
                      WHERE
                      name = '#cflogin.name#'
                  AND password = '#cflogin.password#'
                  </cfquery>
                  4
                  <cfif loginQuery.role NEQ ""> <!---loginQuery.recordcount IS 1>--->
                      <cfloginuser name="#cflogin.name#" Password = "#cflogin.password#"
                              roles = "#role#">
                      5
                  <cfelse>
                      <cfoutput>
                          <H2>Your login information is not valid.<br>
                              Please Try again</H2>
                      </cfoutput>
                      <cfinclude template="loginform.cfm">
                      <cfabort>
                  </cfif>
              </cfif>
          </cfif>
      </cflogin>
      6
      <cfif GetAuthUser() NEQ "">
          7
          <cfoutput>
              <cfinclude template="logoutForm.cfm">
              <!---<form action="errorList.cfm" method="Post">
                  <input type="submit" Name="Logout" value="Logout">
              </form>--->
          </cfoutput>
      </cfif>
  </cffunction>
</cfapplication>--->















<!---<cfapplication name="Orders">
  <cfif NOT IsAuthenticated()>
  <!--- The user is not authenticated --->
      <cfset showlogin="No">
      <cfif IsDefined("form.username") AND IsDefined("form.password")>
  <!--- The login form was submitted. Try authenticating --->
          <cftry>
              <cfauthenticate securityContext="Orders"
                      username="#form.username#"
                      password="#form.password#"
                      setCookie="YES">

                      </cfauthenticate>
              <cfcatch type="security">
  <!--- Security error in login occurred. Show login again --->
                  <h3>Invalid Login</h3>
                  <cfset showLogin="Yes">
              </cfcatch>
          </cftry>
      <cfelse>
  <!--- The login was not detected. Show login again--->
          <cfset showlogin="Yes">
      </cfif>
  <!--- Show the login form --->
      <cfif showlogin>
  <!--- Recreate the url used to call the requested page --->
          <cfset url="#cgi.script_name#">
          <cfif cgi.query_string IS NOT "">
              <cfset url=url & "?#cgi.query_string#">
          </cfif>
  <!--- The login form.
      Submitting the form re-requests the originally requested page
      using the recreated url --->
          <cfoutput>
              <form action="#url#" method="Post">
              <table>
                  <tr>
                      <td>username:</td>
                      <td><input type="text" name="username"></td>
                  </tr>
                  <tr>
                      <td>password:</td>
                      <td><input type="password" name="password"></td>
                  </tr>
              </table>
              <input type="submit" value="Login">
          </form>
          </cfoutput>
          <cfabort>
      </cfif>
  </cfif>--->





