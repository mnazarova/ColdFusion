<!---<cfdump var="#url#" label="URL Scope" />--->

<!---<cfquery name="qArt" datasource="DB">
SELECT *
FROM usercf
WHERE user_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.user_id#" />
</cfquery>--->
<!---<cfdump var="#qArt#" />--->

<cfif cgi.request_method IS "post" AND structKeyExists(form, "edit_user_form_submit")>
    <!---<cfdump var="#form#" label="URL Scope" />--->

    <!--- TO DO CHECK --->
    <cfupdate datasource="DB" tablename="usercf" formFields="user_id,name,surname" />

    <cfoutput>
        <div class="px-3 my-5 mx-auto card bg-light border-info col-sm-8 col-md-7 col-lg-5">
            <div class="mt-5 text-center h5">
                <b>Информация о пользователе с ID=#form.user_id# сохранена.</b>
            </div>
            <hr>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelName">Имя</label>
                    <input type="text"
                           class="form-control border-dark"
                           name="name"
                           id="name"
                           value="#form.name#"
                           disabled>
                </div>

                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelSurname">Фамилия</label>
                    <input type="text"
                           class="form-control border-dark"
                           name="surname"
                           id="surname"
                           value="#form.surname#"
                           disabled>
                </div>
            </div>

            <div class="form-group mt-3">
                <a class="btn btn-outline-info"
                   type="button"
                   href="userList.cfm"
                   title="Перейти к списку пользователей">
                    <i class="fa fa-arrow-left"></i>
                    &nbsp К списку пользователей
                </a>
            </div>
        </div>
    </cfoutput>

</cfif>