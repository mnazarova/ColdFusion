<!---delete--->
<cfif cgi.request_method IS "post" AND structKeyExists(form, "add_user_form_submit")>
    <cfquery name="checkLogin" dataSource="DB">
        SELECT *
        FROM usercf
        WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
    </cfquery>
    <cfif checkLogin.recordcount IS 1>
        <div class="m-0 alert alert-danger text-center">
            <b>Новая учётная запись не была создана, введённый логин уже используется.</b>
        </div>
        <cfabort>
    </cfif>


    <!---<cfif !isDefined(#form.token#)>--->
        <cfinsert datasource="DB" tablename="usercf" formFields="login,name,surname,password" />
        <div class="m-0 alert alert-primary text-center">
            <b>Успешно создана новая учётная запись.</b>
        </div>
        <cfquery name="user" dataSource="DB">
            SELECT user_id as id
            FROM usercf
            WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
        </cfquery>
        <cfset form.user_id = #user.id#>
        <cfset form.role_id = 1> <!--- user --->
    <cfdump var="#form#" label="URL Scope" />
        <cfinsert datasource="DB" tablename="usercf" formFields="user_id,role_id" />

        <!---
            <cfquery name="user" dataSource="DB">
            INSERT INTO user_role (role_id, user_id)
            VALUES (
                1, (
                    SELECT user_id
                    FROM usercf
                    WHERE login = <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#form.login#" />
                )
            )
            </cfquery>
        --->
        <script>
            alert("123");
            //lastToken = form.token;
            // form.token = rand(); writeDump(form.token);
            /*console.log("12")
            $scope = setTimeout(function(){
                alert("I am setTimeout");
            },100000); //delay is in milliseconds
            $scope();*/
            /*function f(x) {
                alert(x);
            }

            // создаём обёртки
            let f1000 = delay(f, 1000);
            let f1500 = delay(f, 1500);

            f1000("test"); // показывает "test" после 1000 мс
            f1500("test"); // показывает "test" после 1500 мс*/
            //deleteClientVariable(#form.token#);
            //writeDump(lastToken);
        </script>
        <cfdump var="#form#" label="URL Scope" />
        <!---<cflocation url="addUser.cfm" addToken="false" statusCode="301">--->
    <!---</cfif>--->
</cfif>



<!---<cfif cgi.request_method IS "post" AND structKeyExists(form, "add_user_form_submit")>--->
<!---<cfdump var="#form#" label="URL Scope" />--->

<!--- TO DO CHECK --->
    <!---<cfinsert datasource="DB" tablename="usercf" formFields="name,surname,password" />

    <cfoutput>
        <div class="px-3 my-5 mx-auto card bg-light border-info col-sm-8 col-md-7 col-lg-5">
        <div class="mt-5 text-center h5">
        <b>Успешно созадана новая учётная запись.</b>
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
    </cfoutput>--->

<!---</cfif>--->