<!---<cfif cgi.request_method IS "get" AND structKeyExists(form, "add_user_form_submit")>
    999
    <cfscript>added = false; writeDump(form); writeDump(added);
            token = rand();
    </cfscript>
<!---<cfscript>cgi.request_method = "get";</cfscript>--->
</cfif>
<cfdump var="#cgi.request_method#" label="URL Scope" />
<cfdump var="#cgi#" label="URL Scope" />
<cfdump var="#Request#" label="URL Scope" />
<cfscript>
    token = rand();
</cfscript>

<cfoutput>
<cfif cgi.request_method IS "get" and IsDefined("addUserForm")>
    <cfdump var="#addUserForm#"><br>
</cfif>
</cfoutput>--->

<!---<cfquery name="userInfo" datasource="DB">
    SELECT *
    FROM usercf
    WHERE login = <cfqueryparam cfsqltype="cf_sql_integer" value="#addUserForm.login#" />
</cfquery>
<cfdump var="#addUserForm#" label="URL Scope" />--->

<cfif cgi.request_method IS "post" AND structKeyExists(form, "add_user_form_submit")>
    <cfquery name="checkLogin" dataSource="DB">
        SELECT *
        FROM usercf
        WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
    </cfquery>
    <cfoutput>
    <cfif checkLogin.recordcount IS 1>
        <div class="m-0 alert alert-danger text-center">
            <b>Новая учётная запись не была создана, логин #form.login# уже используется.</b>
        </div>
    <!---<script> alert("Новая учётная запись не была создана, логин #form.login# уже используется."); </script>--->
    <cfelse>
        <cfinsert datasource="DB" tablename="usercf" formFields="login,name,surname,password" />
        <cfquery name="user" dataSource="DB">
            INSERT INTO user_role (role_id, user_id)
            VALUES ( -- role = user
                1, (
                    SELECT user_id
                    FROM usercf
                    WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
                )
            )
        </cfquery>
        <div class="m-0 alert alert-primary text-center">
            <b>Успешно создана новая учётная запись с логином #form.login#.
                Чтобы отредактировать запись, перейдите на страницу
                <a href="userList.cfm">Список пользователей</a>.
            </b>
        </div>
        <!---<script>
            alert("<b>Успешно создана новая учётная запись с логином #form.login#.\n"+
            "                Чтобы отредактировать запись, перейдите на страницу\n"+
            "                <a href=\"userList.cfm\">Список пользователей</a>.\n"+
            "            </b>");
        </script>--->
    </cfif>
    </cfoutput>
</cfif>

<div class="p-0 my-5 mx-auto card bg-light border-primary col-sm-8 col-md-7 col-lg-5">

    <!---<cfif cgi.request_method IS "post" AND structKeyExists(form, "add_user_form_submit")>
        <cfdump var="#form#" label="URL Scope" />
        777
            <div class="m-0 alert alert-primary text-center">
                <b>Успешно создана новая учётная запись. Добавить ещё одного?</b>
            </div>
    </cfif>--->





    <div class="mt-3 text-center h4">
        <b>Создание новой учётной записи</b>
    </div>
    <hr>

    <div class="px-3">
    <cfform id="addUserForm" name="addUserForm" method="POST" > <!---action="addUserAction.cfm"--->
        <div class="form-row">
            <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelLogin">Логин</label>
                <input type="text"
                       class="form-control border-dark"
                       name="login"
                       id="login"
                       placeholder="введите логин"
                       required>
            </div>

            <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelPassword">Пароль</label>
                <input type="password"
                       class="form-control border-dark"
                       name="password"
                       id="password"
                       placeholder="введите пароль"
                       required>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelName">Имя</label>
                <input type="text"
                       class="form-control border-dark"
                       name="name"
                       id="name"
                       placeholder="введите имя">
            </div>

            <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelSurname">Фамилия</label>
                <input type="text"
                       class="form-control border-dark"
                       name="surname"
                       id="surname"
                       placeholder="введите фамилию">
            </div>
        </div>

        <!---<div class="form-row">
            <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelPassword">Пароль</label>
                <input type="password"
                       class="form-control border-dark"
                       name="password"
                       id="password"
                       placeholder="введите пароль"
                       required>
            </div>

            <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelConfirmPassword">Подтвердить пароль</label>
                <input type="password"
                       class="form-control border-dark"
                       name="confirmPassword"
                       id="confirmPassword"
                       placeholder="подтвердите пароль"
                       required>
            </div>
        </div>--->

        <!---<cfoutput>
            <input type="hidden" name="token" value="#token#" />
            <input type="hidden" name="lastToken" value="#token#" />
        </cfoutput>--->

        <div class="form-group mt-3">
            <input class="btn btn-outline-primary btn-block" type="submit" value="Добавить пользователя"
                   id="add_user_form_submit" name="add_user_form_submit" onclick="">
            <input class="btn btn-outline-danger btn-block" type="reset" value="Очистить форму">
        </div>

    </cfform>
    </div>

</div>

    <div id="data-goes-here"></div>

<!---<script>
    $(document).ready(function(){
        var daoProxy = new DAOProxy();
        var data = daoProxy.getData();
        renderData($("#data-goes-here"), data);
    });
</script>--->
<!---<script>
    renderData = function(element, data){
        data.labels.forEach(function(day,i){
            element.append("<h2>" + day + "</h2>")
                    .append(
                            (function(){
                                return "<ul>"
                                        + data.records.reduce(
                                                function(previousValue,currentValue){
                                                    return previousValue + "<li>" + currentValue.text + ": " + currentValue.values[i] + "</li>";
                                                },
                                                ""
                                        )
                                        + "</ul>"
                                        ;
                            })()
                    );
        });
    };

    $(document).ready(function(){
        $.ajax(
                "addUserAction.cfm",
                {
                    success : function(json){
                        data = JSON.parse(json);
                        renderData($("#data-goes-here"), data);
                    }
                }
        );

    });
</script>--->

<!---<cfscript>
    $("#addUserForm#").validate();
</cfscript>--->


<script>
    /*function validationManual(){
        let strErrMessage = '';
        //CHECK THAT THE PASSWORDS MATCH
        if($("#password").val() !== '' && $("#confirmPassword").val() !== '') {
            if($("#password").val() !== $("#confirmPassword").val()) {
                strErrMessage += 'Пароли не совпадают.\n';
            }
        }
        //IF THERE IS AN ERROR MESSAGE TO DISPLAY THEN
        //STOP THE FORM FROM SUBMITTING
        //AND DISPLAY THE ERROR MESSAGE
        if(strErrMessage !== '') {
            alert(strErrMessage);
        }
    }*/
    function validationJV(){
        //HERE WE SET UP THE RULES AND CALL THE VALIDATION ON THE addUserForm ELEMENT
        $( "#addUserForm" ).validate({
            rules: {
                // name: "required",
                // email: "email",
                password: "required",
                confirmPassword: {
                    equalTo: "#password"
                }
            }
        });
    }
    $(document).on( "click", "#add_user_form_submit", function(e) {
        //GET THE SELECTED RADIO BUTTON VALUE
        // var radType = $('input[name=radValidationType]:checked', '#myform').val();
        //CHOOSE THE CORRECT VALIDATION BASED ON THE RADIO BUTTON SELECTION
        // if(radType === 'manual') {
        /*console.log("123");
            validationManual();
        }
        else {*/
            validationJV();
        //}
    });

    modalWin = new CreateModalPopUpObject();
    // modalWin.SetLoadingImagePath("/dev/images/loading.gif");
    // modalWin.SetCloseButtonImagePath("/dev/images/remove.gif");

    notpaid = function() {
        modalWin.Draggable=false;
        modalWin.ShowURL('addUserAction.cfm', 320, 350, "Heading");
    };
    function HideModalWindow() {
        //modalWin.HideModalPopUp();
        window.document.forms[1].submit();
    }
</script>


<!---<cfif isDefined(notpaid)>
    <script type="text/javascript">
        notpaid();
    </script>
</cfif>--->