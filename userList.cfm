<cfquery datasource="DB" name="users">
    SELECT *
    FROM usercf
    ORDER BY user_id;</cfquery>


<div class="my-3 card col-md-10 mx-auto border-info">

    <div class="font-weight-bold h4 text-center mt-5">Список учётных записей</div>

        <table class="my-5 table table-hover table-responsive-sm table-striped">
            <thead>
            <tr>
                <th class="text-center border-white">Идентификатор</th>
                <th class="text-center border-white">Логин</th>
                <th class="text-center border-white">Имя</th>
                <th class="text-center border-white">Фамилия</th>
                <th class="text-center border-white"></th>
            </tr>
            </thead>

            <tbody>
                <cfoutput query="users">
                <tr>
                    <td class="text-center border-info">#users.user_id#</td>
                    <td class="text-center border-info">#users.login#</td>
                    <td class="text-center border-info">#users.name#</td>
                    <td class="text-center border-info">#users.surname#</td>
                    <!---<cfif></cfif>--->
                    <!---#users.surname#?#users.surname#:-</td>--->
                    <td class="text-center border-info">
                        <a class="btn btn-md btn-info text-white"
                           type="button"
                           href="editUser.cfm?user_id=#users.user_id#"
                           title="Перейти к редактированию информации о пользователе">
                            <i class="fa fa-share-square"></i>
                            Редактировать
                        </a>

                    </td>
                </tr>
                </cfoutput>
            </tbody>
        </table>


</div>