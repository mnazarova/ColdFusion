<cfscript>
    if (IsUserInRole("user"))
        WriteOutput("user members see this message.<br><br>");
    if (IsUserInRole("admin"))
        WriteOutput("admin members see this message.<br><br>");
    else
        WriteOutput("else see this message.<br><br>");

</cfscript>

<!---<cfdump var="#loginQuery#" label="URL Scope" />--->


<cfquery datasource="DB" name="errors">SELECT * FROM error;</cfquery>


<div class="p-0 my-3 card col-md-10 mx-auto border-info">

    <div class="font-weight-bold h4 text-center mt-5">Список ошибок</div>

    <cfif errors.recordcount GT 0>
        <table class="my-5 table table-hover table-responsive-sm table-striped">
            <thead>
            <tr>
                <th class="text-center border-white">Идентификатор</th>
                <th class="text-center border-white">Дата</th>
                <th class="text-center border-white">Короткое описание</th>
                <th class="text-center border-white">Пользователь</th>
                <th class="text-center border-white">Статус</th>
                <th class="text-center border-white">Срочность</th>
                <th class="text-center border-white">Критичность</th>
                <th class="text-center border-white"></th>
            </tr>
            </thead>

            <tbody>
            <cfoutput query="errors">
                <tr>
                    <td class="text-center border-info">#errors.error_id#</td>
                    <td class="text-center border-info">#errors.date#</td>
                    <td class="text-center border-info">#errors.short_description#</td>
                    <td class="text-center border-info">#errors.user_id#</td>
                    <td class="text-center border-info">#errors.status_id#</td>
                    <td class="text-center border-info">#errors.urgency_id#</td>
                    <td class="text-center border-info">#errors.criticalness_id#</td>
                    <!---<cfif></cfif>--->
                    <!---#errors.surname#?#errors.surname#:-</td>--->
                        <td class="text-center border-info">
                                <a class="btn btn-md btn-info text-white"
                                   type="button"
                                href="editUser.cfm?user_id=#errors.error_id#"
                                   title="Перейти к редактированию ошибки">
                        <i class="fa fa-share-square"></i>
                        Редактировать
                    </a>

                    </td>
                </tr>
            </cfoutput>
            </tbody>
        </table>
    <cfelse>

        <div class="mt-4">
            <h4 class="text-center alert alert-info m-0 py-5">
                <b class="text-justify">
                    В системе не зарегистрировано ни одной ошибки.
                </b>
            </h4>
        </div>

    </cfif>


</div>


<!---
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тестовое задание</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="mx-auto">

            <div class="navbar" id="nav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" active="active" href="cardOfError.cfm">
                            <i class="fa fa-hand-o-right"></i>
                            Ввод новой ошибки
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" active="active" href="errorList.cfm">
                            <i class="fa fa-list-alt"></i>
                            Список ошибок
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" active="active" href="/">
                            <i class="fa fa-hand-o-right"></i>
                            Создание нового пользователя
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" active="active" href="userList.cfm">
                            <i class="fa fa-list-alt"></i>
                            Список пользователей
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="index.cfm">
                            <i class="fa fa-sign-out"></i>
                            Выйти
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </nav>
--->

    <!---<cfquery datasource="DB" name="tmp">
        SELECT * FROM usercf;
    </cfquery>--->

    <!---<cfoutput>
        #tmp.columnlist#
        #tmp.recordcount#
        #tmp.currentrow#
    </cfoutput>--->
    <!---<cfoutput query="tmp">
        #tmp.name#
        #tmp.password#
        #tmp.surname#
    </cfoutput>--->


    <!---<cfset mylist="1,2,3,4,5,6,7,8,9">
    <cfloop list="#mylist#" item="it" delimiters=",">
        <cfoutput>#it#</cfoutput>
    </cfloop>
--->
<!---<script src="https://use.fontawesome.com/7328c42f01.js"></script>

</body>
</html>--->

<!---<cfif users.recordcount IS 1>

<div class="my-3">
    <div class="font-weight-bold text-center m-2 p-2 alert-warning">
        На данный момент нет ни одной учётной записи.
        <br>
        <a class="text-info"
           ui-sref="arrangeCertification"
           title="Добавить аттестацию">
            <i class="fa fa-plus-circle"></i>
            Добавить аттестацию
        </a>
    </div>
</div>

<cfelse>
</cfif>--->