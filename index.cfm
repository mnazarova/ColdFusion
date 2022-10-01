<!---<cflocation url="---errorList.cfm" addToken="false" statusCode="301">--->

<cfdump var="#url#" label="URL Scope" />

<cfif !isDefined("form.FIELDNAMES")>
    <cfset form.FIELDNAMES = "error_id" />
</cfif>

<cfquery datasource="DB" name="errors">
    SELECT error_id, date, short_description, s.name as STATUSNAME, u.name as urgencyName,
    c.name as criticalnessName, usr.surname || ' ' || usr.name as userName
    FROM error
    JOIN status s on error.status_id = s.status_id
    JOIN urgency u on error.urgency_id = u.urgency_id
    JOIN criticalness c on error.criticalness_id = c.criticalness_id
    JOIN usercf usr on error.user_id = usr.user_id
    ORDER BY #form.FIELDNAMES#
</cfquery>
<!---<cfdump var="#errors#" label="URL Scope" />--->

<div class="p-0 my-3 card col-lg-11 mx-auto border-info">

    <div class="font-weight-bold h4 text-center mt-5">Список ошибок</div>

<cfif errors.recordcount GT 0>
        <cfform id="errorListForm" name="errorListForm" method="POST">
        <table class="my-3 table table-hover table-responsive-xl table-striped">
            <thead>
            <tr>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="error_id" name="error_id">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        №
                    </button>
                    <!---<input class="btn btn-outline-secondary" type="submit" id="date" name="date" value="Дата">--->
                </th>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="date" name="date">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        Дата изменения
                    </button>
                    <!---<input class="btn btn-outline-secondary" type="submit" id="date" name="date" value="Дата">--->
                </th>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="short_description" name="short_description">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        Короткое описание
                    </button>
                    <!---<input class="btn btn-link" type="submit" id="short_description" name="short_description" value="Короткое описание">--->
                </th>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="userName" name="userName">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        Пользователь
                    </button>
                    <!---<input class="btn btn-outline-secondary" type="submit" id="userName" name="userName" value="Пользователь">--->
                </th>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="statusName" name="statusName">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        Статус
                    </button>
                    <!---<input class="btn btn-outline-secondary" type="submit" id="statusName" name="statusName" value="Статус">--->
                </th>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="urgencyName" name="urgencyName">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        Срочность
                    </button>
                    <!---<input class="btn btn-outline-secondary" type="submit" id="urgencyName" name="urgencyName" value="Срочность">--->
                </th>
                <th class="text-center border-white">
                    <button class="btn btn-outline-secondary btn-sm" type="submit" id="criticalnessName" name="criticalnessName">
                        <i class="fa fa-sort" aria-hidden="true"></i>
                        Критичность
                    </button>
                    <!---<input class="btn btn-outline-secondary" type="submit" id="criticalnessName" name="criticalnessName" value="Критичность">--->
                </th>
                <th class="text-center border-white"></th>
            </tr>
            </thead>

        <tbody>
        <cfoutput query="errors">
            <tr>
            <td class="text-center border-info">#errors.error_id#</td>
            <td class="text-center border-info">#dateFormat(errors.date,"dd.mm.yyyy")#</td>
            <td class="text-center border-info">#errors.short_description#</td>
            <td class="text-center border-info">#errors.userName#</td>
            <td class="text-center border-info">#errors.statusName#</td>
            <td class="text-center border-info">#errors.urgencyName#</td>
            <td class="text-center border-info">#errors.criticalnessName#</td>
            <td class="text-center border-info">
                    <a class="btn btn-md btn-info text-white"
                       type="button"
                    href="cardOfError.cfm?error_id=#errors.error_id#"
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
                    На данный момент не создано ни одной ошибки.<br>
                    Для добавления ошибки перейдите на страницу "<a class="" href="cardOfError.cfm">Ввод новой ошибки</a>".
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