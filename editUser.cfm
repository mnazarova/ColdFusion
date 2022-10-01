<cfif IsUserInRole("admin")>

    <!---<cfdump var="#url#" label="URL Scope" />--->
    <cfif cgi.request_method IS "get" AND isDefined("url.user_id")>
        <cfquery name="userInfo" datasource="DB">
        SELECT *
        FROM usercf
        WHERE user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.user_id#" />
        </cfquery>
    </cfif>

    <cfoutput>
    <cfif userInfo.recordcount IS 1>

        <div class="px-3 my-5 mx-auto card bg-light border-primary col-sm-8 col-md-7 col-lg-5">
            <div class="mt-5 text-center h5">
                <b>Редактирование информации о пользователе <br> под учётной записью №#userInfo.user_id#</b>
            </div>
            <hr>

            <cfform id="editUserForm" name="editUserForm" method="POST" action="editUserAction.cfm">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="font-weight-bold" for="labelName">Имя</label>
                        <input type="text"
                               class="form-control border-dark"
                               name="name"
                               id="name"
                               placeholder="введите имя"
                               value="#userInfo.name#"
                               required>
                    </div>

                    <div class="form-group col-md-6">
                        <label class="font-weight-bold" for="labelSurname">Фамилия</label>
                        <input type="text"
                               class="form-control border-dark"
                               name="surname"
                               id="surname"
                               placeholder="введите фамилию"
                               value="#userInfo.surname#"
                               required>
                    </div>
                </div>

                <input name="user_id" type="hidden" value="#userInfo.user_id#">

                <div class="form-group mt-3">
                    <input class="btn btn-outline-primary btn-block" type="submit" value="Сохранить изменения"
                           id="edit_user_form_submit" name="edit_user_form_submit">
                </div>
            </cfform>

        </div>

    <cfelse>

        <div class="p-0 m-5 card border-dark">
            <h3 class="text-center alert alert-warning m-0 py-5">
                    <b class="text-justify">
                    Внимание! <br>
                    Учётная запись с идентификатором #url.user_id# не найдена. <br>
                    Измените запрос или обратитесь к администратору.
                </b>
            </h3>
        </div>

    </cfif>
    </cfoutput>

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