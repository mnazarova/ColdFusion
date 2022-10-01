<cfif isDefined("url.error_id")>
    <cfquery name="errorInfo" datasource="DB">
        SELECT *
        FROM error
        WHERE error_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.error_id#" />
    </cfquery>
    <cfquery datasource="DB" name="errorHistory">
        SELECT h.date, h.comment, h.error_id, h.status_id,
            s.name as statusName, usr.surname || ' ' || usr.name as userName
        FROM history h
        JOIN status s on h.status_id = s.status_id
        JOIN usercf usr on h.user_id = usr.user_id
        WHERE h.error_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#url.error_id#" />
    </cfquery>


    <cfif errorInfo.recordcount IS 1>

        <cfquery datasource="DB" name="urgencyOptions">
            SELECT * FROM urgency
            WHERE urgency_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#errorInfo.urgency_id#" />
        </cfquery>
        <cfquery datasource="DB" name="criticalnessOptions">
            SELECT * FROM criticalness
            WHERE criticalness_id = <cfqueryparam cfsqltype="cf_sql_integer" value="#errorInfo.criticalness_id#" />
        </cfquery>
        <CFSTOREDPROC result="res" DATASOURCE="DB" PROCEDURE="GetOptionsByStatusId">
            <cfprocresult name="statusOptions">
            <cfprocparam cfsqltype="cf_sql_integer" value="#errorInfo.status_id#">
        </CFSTOREDPROC>


        <div class="p-0 my-3 card col-md-10 mx-auto border-info">
            <div class="font-weight-bold h4 text-center mt-5">История ошибки<!--- № #errorHistory.error_id#---></div>
            <table class="my-3 table table-hover table-responsive-sm table-striped">
                <thead>
                <tr>
                    <th class="text-center border-white">Дата</th>
                    <th class="text-center border-white">Комментарий</th>
                    <th class="text-center border-white">Пользователь</th>
                    <th class="text-center border-white">Статус</th>
                </tr>
                </thead>

                <cfoutput query="errorHistory">
                <tbody>
                        <tr>
                        <td class="text-center border-info">#dateFormat(errorHistory.date,"dd.mm.yyyy")#</td>
                        <td class="text-center border-info">#errorHistory.comment#</td>
                        <td class="text-center border-info">#errorHistory.userName#</td>
                        <td class="text-center border-info">#errorHistory.statusName#</td>
                        </tr>
                </tbody>
                </cfoutput>
            </table>
        </div>



        <div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-8 col-md-7 col-lg-5">
            <div class="mt-5 text-center h3">
                <b>Редактировать информацию об ошибке</b>
            </div>
            <hr>

            <cfoutput>
            <cfform id="editErrorForm" name="editErrorForm" method="POST" action = "editErrorAction.cfm">

                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label class="font-weight-bold" for="labelShortDescription">Короткое описание</label>
                        <input type="text"
                               class="form-control border-dark"
                               name="short_description"
                               id="labelShortDescription"
                               placeholder="введите короткое описание"
                               value="#errorInfo.short_description#"
                               readonly
                               required>
                    </div>

                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelStatus">Статус</label>
                <cfselect id="labelStatus"
                        class="form-control border-dark"
                        query ="statusOptions"
                        display ="name"
                        value ="status_id"
                        name="status_id"
                        selected="#errorInfo.status_id#"
                        required = "Yes"
                        queryPosition="Below">
                </cfselect>
                </div>
                </div>

                <div class="form-row">
                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelUrgency">Срочность</label>
                <cfselect id="labelUrgency"
                        class="form-control border-dark"
                        query ="urgencyOptions"
                        display ="name"
                        value ="urgency_id"
                        name="urgency_id"
                        selected="#errorInfo.urgency_id#"
                        required = "Yes"
                        queryPosition="Below"
                        readonly="true">
                </cfselect>
                </div>

                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelCriticalness">Критичность</label>
                <cfselect id="labelCriticalness"
                        class="form-control border-dark"
                        query ="criticalnessOptions"
                        display ="name"
                        value ="criticalness_id"
                        name="criticalness_id"
                        selected="#errorInfo.criticalness_id#"
                        required = "Yes"
                        queryPosition="Below"
                        readonly="true">
                </cfselect>
                </div>
                </div>

                    <div class="form-row">
                        <div class="form-group col-md">
                            <label class="font-weight-bold" for="labelLongName">Подробное описание</label>
                            <textarea class="form-control border-dark"
                                      name="long_description"
                                      id="labelLongName"
                                      rows="5"
                                      readonly>#errorInfo.long_description#</textarea>
                        </div>
                    </div>

                    <div id="commentDiv" class="form-row" style="display: none;">
                        <div class="form-group col-md">
                            <label class="font-weight-bold" for="labelComment">Комментарий</label>
                            <textarea class="form-control border-dark"
                                      name="comment"
                                      id="labelComment"
                                      rows="5"></textarea>
                        </div>
                    </div>


                <cfoutput><input name="login" type="hidden" value="#getauthuser()#"></cfoutput>
                <input name="error_id" type="hidden" value="#errorInfo.error_id#">


                    <div class="form-group mt-3">
                        <input class="btn btn-outline-primary btn-block" type="submit" value="Сохранить"
                               id="edit_error_form_submit" name="edit_error_form_submit">
                    </div>

            </cfform>
            </cfoutput>
        </div>

    <cfelse>
        <div class="p-0 m-5 card border-dark">
            <h3 class="text-center alert alert-warning m-0 py-5">
            <b class="text-justify">
                Внимание!<br> Запись ошибки с идентификатором
                <cfoutput>#url.error_id#</cfoutput> не найдена.<br>
                Измените запрос или обратитесь к администратору.
            </b>
            </h3>
        </div>
    </cfif>

<cfelse>

    <cfquery datasource="DB" name="urgencyOptions">SELECT * FROM urgency;</cfquery>
    <cfquery datasource="DB" name="criticalnessOptions">SELECT * FROM criticalness;</cfquery>
    <cfquery datasource="DB" name="statusOptions">SELECT * FROM status s WHERE s.name = 'Новая';</cfquery>

    <div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-8 col-md-7 col-lg-5">
        <div class="mt-5 text-center h3">
            <b>Ввод новой ошибки</b>
        </div>
        <hr>

        <cfform id="addErrorForm" name="addErrorForm" method="POST" action = "addErrorAction.cfm"> <!---action="#CGI.SCRIPT_NAME#" --->

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelShortDescription">Короткое описание</label>
                    <input type="text"
                           class="form-control border-dark"
                           name="short_description"
                           id="labelShortDescription"
                           placeholder="введите короткое описание"
                           required>
                </div>

                <div class="form-group col-md-6">
                    <label class="font-weight-bold" for="labelStatus">Статус</label>
                    <cfselect id="labelStatus"
                            class="form-control border-dark"
                            query ="statusOptions"
                            display ="name"
                            value ="status_id"
                            name="status_id"
                            required = "Yes"
                            queryPosition="Below">
                    </cfselect>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelUrgency">Срочность</label>
                    <cfselect id="labelUrgency"
                            class="form-control border-dark"
                            query ="urgencyOptions"
                            display ="name"
                            value ="urgency_id"
                            name="urgency_id"
                            required = "Yes"
                            queryPosition="Below">
                    </cfselect>
                </div>

                <div class="form-group col-md-6">
                <label class="font-weight-bold" for="labelCriticalness">Критичность</label>
                    <cfselect id="labelCriticalness"
                            class="form-control border-dark"
                            query ="criticalnessOptions"
                            display ="name"
                            value ="criticalness_id"
                            name="criticalness_id"
                            required = "Yes"
                            queryPosition="Below">
                    </cfselect>
                </div>
            </div>

            <div class="form-row">
                <div class="form-group col-md">
                    <label class="font-weight-bold" for="labelLongName">Подробное описание</label>
                    <textarea class="form-control border-dark"
                              name="long_description"
                              id="labelLongName" rows="5"></textarea>
                </div>
            </div>

            <cfoutput><input name="login" type="hidden" value="#getauthuser()#"></cfoutput>


            <div class="form-group mt-3">
                <input class="btn btn-outline-primary btn-block" type="submit" value="Добавить запись"
                       id="btn_form_submit" name="btn_form_submit">
            </div>

        </cfform>
    </div>

</cfif>

<script>
    $(function(){
        $status_name = $( "#labelStatus option:selected" ).text(); // начальный статус
        $oldForm = Object.assign($('form#editErrorForm')[0]);

        $('#labelStatus').on('change', function () {
            var option = $( "#labelStatus option:selected" ).text(); // текущий (выбранный) статус
            if ($status_name == option){
                $('#commentDiv').slideToggle(300);
                $('#labelComment').prop('required', false); // required убран
                return;
            }
            if ($('#commentDiv').is(':hidden')) {
                $('#commentDiv').slideToggle(300);
                $('#labelComment').prop('required', true); // required установлен
            }
        });

        $(document).on( "click", "#edit_error_form_submit", function(e) {

            var option = $( "#labelStatus option:selected" ).text(); // текущий (выбранный) статус
            if ($status_name == option){
                alert("Для сохранения необходимо изменить статус ошибки");
                e.preventDefault();
                return;
            }

            if ($("#labelComment").val() == "") {
                alert("Для сохранения необходимо заполнить поле 'Комментарий'");
                e.preventDefault();
            }
        });
    });
</script>