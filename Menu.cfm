<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тестовое задание</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.5/jquery.validate.min.js"></script>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="mx-auto">

            <div class="navbar" id="nav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="cardOfError.cfm">
                            <i class="fa fa-plus-circle"></i>
                            Ввод новой ошибки
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="errorList.cfm">
                            <i class="fa fa-list-alt"></i>
                            Список ошибок
                        </a>
                    </li>
                    <cfif IsUserInRole("admin")>
                        <li class="nav-item">
                            <a class="nav-link" href="addUser.cfm">
                                <i class="fa fa-user-plus"></i>
                                Создание нового пользователя
                            </a>
                        </li>
                    </cfif>
                    <cfif IsUserInRole("admin")>
                        <li class="nav-item">
                            <a class="nav-link" href="userList.cfm">
                                <i class="fa fa-users"></i>
                                Список пользователей
                            </a>
                        </li>
                    </cfif>

                    <li class="nav-item">
                        <form method="Post">
                        &nbsp;<input class="btn btn-outline-secondary" type="submit" Name="Logout" value="Выйти">
                        </form>
                    </li>

                </ul>
            </div>

        </div>
    </nav>

    <script src="https://use.fontawesome.com/7328c42f01.js"></script>

</body>
</html>