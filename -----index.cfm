<!---<cfquery datasource="DB" name="errors">
    SELECT *, s.name as statusName, u.name as urgencyName,
    c.name as criticalnessName, usr.surname || ' ' || usr.name as userName
    FROM error
    JOIN status s on error.status_id = s.status_id
    JOIN urgency u on error.urgency_id = u.urgency_id
    JOIN criticalness c on error.criticalness_id = c.criticalness_id
    JOIN usercf usr on error.user_id = usr.user_id;</cfquery>

<!---<cfset sortBy = "Дата, Короткое описание, Пользователь, Статус, Срочность, Критичность">--->
<cfset sortBy = [
    {id = 0, name = "Дата"},
    {id = 1, name = "Короткое описание"},
    {id = 2, name = "Пользователь"},
    {id = 3, name = "Статус"},
    {id = 4, name = "Срочность"},
    {id = 5, name = "Критичность"}
]>
<!---<cfdump var="#sortBy#" label="URL Scope" />--->

<!---<script>
    var sortBy = [
        'Дата',
        'Короткое описание',
        'Пользователь',
        'Статус',
        'Срочность',
        'Критичность'
    ];
    console.log(sortBy)
</script>--->

<cfif cgi.request_method IS "post">
    <cfdump var="#form#" label="URL Scope" />
    <cfdump var="#form.FIELDNAMES#" label="URL Scope" />
    <cfif structKeyExists(form, "date")>
        Hello
    </cfif>
    <cfquery datasource="DB" name="errors">
        SELECT error_id, date, short_description, s.name as STATUSNAME, u.name as urgencyName,
        c.name as criticalnessName, usr.surname || ' ' || usr.name as userName
        FROM error
        JOIN status s on error.status_id = s.status_id
        JOIN urgency u on error.urgency_id = u.urgency_id
        JOIN criticalness c on error.criticalness_id = c.criticalness_id
        JOIN usercf usr on error.user_id = usr.user_id
        ORDER BY #form.FIELDNAMES# DESC
    </cfquery>
    <cfdump var="#errors#" label="URL Scope" />

<!---<cfquery name="checkLogin" dataSource="DB">
    SELECT *
    FROM usercf
    WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
</cfquery>
<cfoutput>
    <cfif checkLogin.recordcount IS 1>
        <div class="m-0 alert alert-danger text-center">
        <b>Новая учётная запись не была создана, логин #form.login# уже используется.</b>
    </div>
    <cfelse>
        <cfinsert datasource="DB" tablename="usercf" formFields="login,name,surname,password" />
        <div class="m-0 alert alert-primary text-center">
        <b>Успешно создана новая учётная запись с логином #form.login#.
        Чтобы отредактировать запись, перейдите на страницу
        <a href="userList.cfm">Список пользователей</a>.
    </b>
    </div>
    </cfif>
</cfoutput>--->
</cfif>

<div class="p-0 my-3 card col-md-10 mx-auto border-info">

    <div class="font-weight-bold h4 text-center mt-5">Список ошибок</div>

<cfif errors.recordcount GT 0>

    <!---<cfset names = queryNew("") />
    <cfset firstNames = ["Al", "Rudi", "Summer", "Dirk", "James", "Loren", "Hiram"] />
    <cfset lastNames = ["Giordino", "Gunn", "Moran", "Pitt", "Sandecker", "Smith", "Yeager"] />
    <cfset queryAddColumn(names,"firstName","varchar",firstNames) />
    <cfset queryAddColumn(names,"lastName","varchar",lastNames) />--->

    <!---<cfset gridsortcolumn="user_id">
    <cfset gridstartdirection="DESC">
    <cfset query = "SELECT date, short_description, user_id, status_id, urgency_id, criticalness_id FROM error" >
    <cfif gridsortcolumn neq "" or gridstartdirection neq "">
        <cfset query=query & " order by #gridsortcolumn# #gridstartdirection#">
    </cfif>
    <cfquery name="team" datasource="DB">
        <cfoutput>#query#</cfoutput>
    </cfquery>

    <cfset pagedQuery = queryConvertForGrid(team,1,5) />

    <cfdump var="#pagedQuery#">--->



<!---<cfoutput>
    <cfform>
        <cfgrid format="html" name="grdMessages" pagesize=5 sort=true
        bind="cfc:places.getData({cfgridpage},{cfgridpagesize},
        {cfgridsortcolumn},{cfgridsortdirection})" selectMode="row">
        <cfgridcolumn name="date" display=true header="123"/>
        <!---<cfgridcolumn name="short_description" display=true header="Короткое описание"/>
        <cfgridcolumn name="user_id" display=true header="Пользователь"/>
        <cfgridcolumn name="status_id" display=true header="Статус"/>
        <cfgridcolumn name="urgency_id" display=true header="Срочность"/>
        <cfgridcolumn name="criticalness_id" display=true header="Критичность"/>--->
        </cfgrid>
    </cfform>
</cfoutput>

<cfform action="bb_save.cfm" method="post" enctype="multipart/form-data" name="frmMessage" onsubmit="return checkForm(_CF_this);" >
    <cfinput type="text" size="40" name="fld_Name" id="fld_Name" bind="{grdMessages.fld_Posted_By}">
    <cfinput type="text" size="40" name="fld_Department" id="fld_Department" bind="{grdMessages.fld_Department}">
</cfform>--->
        <!---<hr>
        <div class="font-weight-bold h4 text-center mt-3">Сортировка по</div>
        <div class="form-group col-md-6">
            <label class="font-weight-bold" for="labelUrgency">Срочность</label>
        <select id="labelUrgency"
                class="form-control border-dark"
                name="urgency"
                required>
            <cfloop list="#sortBy#" item="item">
            <cfoutput>
                #trim(item)#
            </cfoutput>
            </cfloop>
        <!---<cfoutput query="urgencyOptions">
                <option>#urgencyOptions.name#</option>
        </cfoutput>--->
        </select>
        </div>--->

        <cfform id="errorListForm" name="errorListForm" method="POST">
        <table class="my-3 table table-hover table-responsive-sm table-striped">
            <thead>
            <tr>
                <!---<th class="text-center border-white">Идентификатор</th>--->
                     <!---<cfloop list="#sortBy#">--->

                    <!---</cfloop>--->
                <th class="text-center border-white">
                    <!---<div id = "sortByDate">--->
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        <input class="btn btn-outline-secondary" type="submit" id="date" name="date" value="Дата">
                        <!---<label for="labelDate">Дата</label>--->
                    <!---</div>--->
                </th>
                <th class="text-center border-white">
                    <i class="fa fa-sort" aria-hidden="true"></i>
                    <input class="btn btn-outline-secondary" type="submit" id="short_description" name="short_description" value="Короткое описание">
                </th>
                <th class="text-center border-white">
                    <i class="fa fa-sort" aria-hidden="true"></i>
                    <input class="btn btn-outline-secondary" type="submit" id="userName" name="userName" value="Пользователь">
                </th>
                <th class="text-center border-white">
                    <i class="fa fa-sort" aria-hidden="true"></i>
                    <input class="btn btn-outline-secondary" type="submit" id="statusName" name="statusName" value="Статус">
                </th>
                <th class="text-center border-white">
                    <input class="btn btn-outline-secondary" type="submit" id="urgencyName" name="urgencyName" value="Срочность">
                </th>
                <th class="text-center border-white">
                    <input class="btn btn-outline-secondary" type="submit" id="criticalnessName" name="criticalnessName" value="Критичность">
                </th>
                <th class="text-center border-white"></th>
            </tr>
            </thead>

        <tbody>
        <cfoutput query="errors">
            <tr>
            <!---<td class="text-center border-info">#errors.error_id#</td>--->
            <td class="text-center border-info">#dateFormat(errors.date,"dd.mm.yyyy")#</td>
            <td class="text-center border-info">#errors.short_description#</td>
            <td class="text-center border-info">#errors.userName#</td>
            <td class="text-center border-info">#errors.statusName#</td>
            <td class="text-center border-info">#errors.urgencyName#</td>
            <td class="text-center border-info">#errors.criticalnessName#</td>
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
        </cfform>

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



<script>
/*
    function buildResultsTable(resp) {
        var tmp_html = $("<tr />");
        var j = 0;
        console.log("qwertyui");
    }
    $(document).on( "click", "#sortByDate", function(e) {
        $.ajax({
            url: './formTest.cfm',         // Куда отправить запрос
            method: 'GET',             // Метод запроса (post или get)
            dataType: 'text',          // Тип данных в ответе (xml, json, script, html).
            // data: {text: 'Текст'},     // Данные передаваемые в массиве
            success: function (resp, textStatus, jqXHR) {
                console.log(resp);
                buildResultsTable(resp);
            },
            error: function (jqXHR, textStatus, errorThrown)
            {
                alert(errorThrown);
            }
            success: function(data){   /!* функция которая будет выполнена после успешного запроса.  *!/
                alert("777");
                alert(data);
            },
            error: function(data) {
                alert("---");
                alert(data);
            }
        });
        alert("123");
        //GET THE SELECTED RADIO BUTTON VALUE
        // var radType = $('input[name=radValidationType]:checked', '#myform').val();
        //CHOOSE THE CORRECT VALIDATION BASED ON THE RADIO BUTTON SELECTION
        // if(radType === 'manual') {
        console.log("123");
            validationManual();
        }
        else {
        //validationJV();
        //}
    });*/
</script>


<!---<cfscript>
    writeDump(getuserroles());
    //writeDump(getauthuser());
    writeDump(" 1 ");
    //writeDump(getuserroles());
    writeDump(" 2 ");
    writeDump(isuserloggedin());
    writeDump(" 3 ");
    writeDump(cgi);
    if (IsUserInRole("user"))
        WriteOutput("user members see this message.<br><br>");
    if (IsUserInRole("admin"))
        WriteOutput("admin members see this message.<br><br>");
    else
        WriteOutput("else see this message.<br><br>");

</cfscript>--->

<!---<cfdump var="#loginQuery#" label="URL Scope" />--->

<!---<cfdump var="#url#" label="URL Scope" />--->

<!---<cfdump var="#cgi#" label="URL Scope" />--->
<!---<cfdump var="#Request#" label="URL Scope">--->

<!---<cfif IsUserInRole("user")>--->

<!---<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тестовое задание</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
<!---<script src="http://code.jquery.com/jquery-1.11.0.js"></script>--->
<!---<cfajaxproxy cfc="DAO" jsclassname="DAOProxy">--->
</head>
<body>

    <div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-6 col-md-5 col-lg-3">
        <div class="mt-5 text-center h3">
            <b>Вход в систему</b>
        </div>
        <hr>

    <cfoutput>
        <form action="#CGI.script_name#?#CGI.query_string#" method="Post">
            <div class="form-group">
                <label for="labelName">Имя</label>
                <input type="text"
                       class="form-control border-dark"
                       name="j_username"
                       id="labelName"
                       placeholder="введите имя"
                       required>
            </div>
            <div class="form-group">
                <label for="labelPassword">Пароль</label>
                <input type="password"
                       class="form-control border-dark"
                       name="j_password"
                       id="labelPassword"
                       placeholder="введите пароль"
                       autocomplete="on"
                       required>
            </div>

            <div class="form-group mt-5">
                <input class="btn btn-outline-info btn-block" type="submit" value="Войти">
            </div>
        </form>
    </cfoutput>

    </div>
<!---</cfif>--->


</body>
</html>--->



<!---<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тестовое задание</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
<body>--->


        <!---<div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-6 col-md-5 col-lg-3">
            <div class="mt-5 text-center h3">
                <b>Вход в систему</b>
            </div>
            <hr>

            <div th:if="${param.error}" class="bg-danger text-white text-center pb-1 mb-3">
                Вы ввели неверное имя и/или пароль. Попробуйте снова!
            </div>

            <form th:action="@{/login}" method="post">
                <div class="form-group">
                    <label for="labelName">Имя</label>
                    <input type="text"
                           class="form-control border-dark"
                           ng-model="auth.login"
                           name="username"
                           id="labelName"
                           placeholder="введите имя"
                           required>
                </div>
                <div class="form-group">
                    <label for="labelPassword">Пароль</label>
                    <input type="password"
                           class="form-control border-dark"
                           ng-model="auth.password"
                           name="password"
                           id="labelPassword"
                           placeholder="введите пароль"
                           autocomplete="on"
                           required>
                </div>

                <div class="form-group mt-5">
                    <a class="btn btn-outline-info btn-block" href="errorList.cfm">Войти</a>
                </div>
            </form>

        </div>--->

<!---</body>--->

<!---<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>--->

<!---<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--->
<!---<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>--->

<!---</html>--->--->