<!DOCTYPE HTML>
<html>
<head>
    <title>Security test page</title>
</head>
<body>
<cfoutput>
    <h2>Welcome #GetAuthUser()#!</h2>
</cfoutput>
ALL Logged-in Users see this message.<br>
<br>
<cfscript>
    if (IsUserInRole("user"))
        WriteOutput("user members see this message.<br><br>");
    if (IsUserInRole("admin"))
        WriteOutput("admin members see this message.<br><br>");

    if (IsUserInRole("Human Resources"))
        WriteOutput("Human Resources members see this message.<br><br>");
    else
        WriteOutput("Documentation members see this message.<br><br>");
    if (IsUserInRole("Sales"))
        WriteOutput("Sales members see this message.<br><br>");
    if (IsUserInRole("Manager"))
        WriteOutput("Managers see this message.<br><br>");
    if (IsUserInRole("Employee"))
        WriteOutput("Employees see this message.<br><br>");
    if (IsUserInRole("Contractor"))
        WriteOutput("Contractors see this message.<br><br>");
</cfscript>
</body>
</html>