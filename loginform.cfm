<html>
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
</html>


<!---<H2>Please Log In</H2>
<cfoutput>
    <form action="#CGI.script_name#?#CGI.query_string#" method="Post">
    <table>
        <tr>
            <td>user name:</td>
            <td><input type="text" name="j_username"></td>
        </tr>
        <tr>
            <td>password:</td>
            <td><input type="password" name="j_password"></td>
        </tr>
    </table>
    <br>
    <input type="submit" value="Log In">
</form>
</cfoutput>--->