<cfif IsUserInRole("admin")>
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
        <cfelse>
            <cfset form.password = hash(password)>
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
        </cfif>
        </cfoutput>
    </cfif>

    <div class="p-0 my-5 mx-auto card bg-light border-primary col-sm-8 col-md-7 col-lg-5">


        <div class="mt-3 text-center h4">
            <b>Создание новой учётной записи</b>
        </div>
        <hr>

        <div class="px-3">
        <cfform id="addUserForm" name="addUserForm" method="POST">
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
                           placeholder="введите имя"
                           required>
                </div>

                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelSurname">Фамилия</label>
                    <input type="text"
                           class="form-control border-dark"
                           name="surname"
                           id="surname"
                           placeholder="введите фамилию"
                           required>
                </div>
            </div>

            <div class="form-group mt-3">
                <input class="btn btn-outline-primary btn-block" type="submit" value="Добавить пользователя"
                       id="add_user_form_submit" name="add_user_form_submit" onclick="">
                <input class="btn btn-outline-danger btn-block" type="reset" value="Очистить форму">
            </div>

        </cfform>
        </div>

    </div>

<cfelse>

    <div class="p-0 m-5 card border-dark">
        <h3 class="text-center alert alert-warning m-0 py-5">
            <b class="text-justify">
                Внимание! <br>
                У Вас недостаточно прав для просмотра данной страницы.
            </b>
        </h3>
    </div>

</cfif>
