<!---<cfdump var="#url#" label="URL Scope" />--->
    <!---<cfset forAdd = true />--->
    <!---<cfif isDefined("form.submit")>--->

        <!---Hi!--->
        <!---<cfinsert datasource="DB" tablename="error" formFields="short_description,long_description" >--->

    <cfif cgi.request_method IS "post" AND structKeyExists(form, "btn_form_submit")>
        <!---<div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-8 col-md-7 col-lg-5">--->
        <cfquery name="user" dataSource="DB">
                SELECT user_id id
                FROM usercf
                WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
        </cfquery>

        <cfset form.user_id = #user.id# />

        <!---<cfquery name="insertError" dataSource="DB">
                INSERT INTO error (short_description,long_description,user_id,status_id,urgency_id,criticalness_id)
                VALUES ('#form.short_description#','#form.long_description#','#form.user_id#',
                '#form.status_id#','#form.urgency_id#','#form.criticalness_id#')
        </cfquery>--->
        <cfinsert datasource="DB" tablename="error"
                formFields="short_description,long_description,user_id,status_id,urgency_id,criticalness_id">
        <cfquery name="error" dataSource="DB">
                SELECT error_id id
                FROM error
                ORDER BY error_id DESC LIMIT 1
        </cfquery>
        <!---<script>--->
            //writeDump(cfinsert(datasource="DB", tablename="error", formFields="short_description,long_description,user_id,status_id,urgency_id,criticalness_id"));
            // alert("Добавлена новая ошибка.");
        <!---</script>--->
        <!---<cfdump var="#error.id#" label="URL Scope" />--->
        <cflocation url="cardOfError.cfm?error_id=#error.id#" addToken="false" statusCode="301">
            <!---<div class="mt-5 text-center h3">
                <b>Ввод новой ошибки</b>
            </div>
            <hr>--->


            <!---<cfset forAdd = false />--->


            <!---<cfform id="addErrorForm" name="addErrorForm" method="POST" action="addErrorAction.cfm">

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="font-weight-bold" for="labelShortName">Короткое описание</label>
                        <input type="text"
                               class="form-control border-dark"
                               name="shortName"
                               id="labelShortName"
                               placeholder="введите краткое описание"
                               required>
                    </div>

                    <div class="form-group col-md-6">
                        <label class="font-weight-bold" for="labelStatus">Статус</label>
                        <cfselect id="labelStatus"
                                class="form-control border-dark"
                                name="status"
                                <!---options="#statusOptions#"--->
                                required="true">
                            <!---<option selected>Выберите статус ошибки...</option>--->
                            <cfoutput query="statusOptions">
                                <option>#statusOptions.name#</option>
                            </cfoutput>
                        </cfselect>
                        <!---<select id="labelStatus"
                                class="form-control border-dark"
                                name="status"
                                required>
                            <!---<option selected>Выберите статус ошибки...</option>--->
                            <cfoutput query="statusOptions">
                                <option>#statusOptions.name#</option>
                            </cfoutput>
                        </select>--->
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelUrgency">Срочность</label>
                        <select id="labelUrgency"
                                class="form-control border-dark"
                                name="urgency"
                                required>
                            <!---<option selected>Выберите уровень срочности...</option>--->
                            <cfoutput query="urgencyOptions">
                                <option>#urgencyOptions.name#</option>
                            </cfoutput>
                        </select>
                    </div>

                    <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelCriticalness">Критичность</label>
                        <select id="labelCriticalness"
                                class="form-control border-dark"
                                name="criticalness"
                                required>
                            <!---<option selected>Выберите уровень критичности...</option>--->
                            <cfoutput query="criticalnessOptions">
                                <option>#criticalnessOptions.name#</option>
                            </cfoutput>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group col-md">
                        <label class="font-weight-bold" for="labelLongName">Подробное описание</label>
                        <textarea class="form-control border-dark"
                                  name="longName"
                                  id="labelLongName" rows="5">
                        </textarea>
                    </div>
                </div>

                <div class="form-group mt-3">
                    <!---<a class="btn btn-outline-primary btn-block" href="errorList.cfm">Сохранить</a>--->
                    <input class="btn btn-outline-primary btn-block" type="submit" value="Сохранить"
                           id="btn_form_submit" name="btn_form_submit">
                </div>

            </cfform>--->

        <!---</div>--->
    </cfif>