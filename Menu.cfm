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
    <!---<script type="text/javascript" src="C:\ColdFusion2021\cfusion\wwwroot\cf_scripts\scripts\ajax\yui\yahoo-dom-event"></script>--->

<!---<script src="http://code.jquery.com/jquery-1.11.0.js"></script>--->
<!---<cfajaxproxy cfc="DAO" jsclassname="DAOProxy">--->
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
                        <a class="nav-link" href="index.cfm">
                            <i class="fa fa-list-alt"></i>
                            Список ошибок
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="addUser.cfm">
                            <i class="fa fa-user-plus"></i>
                            Создание нового пользователя
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="userList.cfm">
                            <i class="fa fa-users"></i>
                            Список пользователей
                        </a>
                    </li>

                    <!---<li class="nav-item">

                            <i class="nav-link fa fa-sign-out"></i>
                            <input class="nav-link" type="submit" Name="Logout" value="Выйти">
                            <!---<a class="nav-link" href="logoutForm.cfm">
                                <i class="fa fa-sign-out"></i>
                                Выйти
                            </a>--->
                    </li>--->

                    <!---<li class="nav-item"><h4>|</h4></li>--->

                    <li class="nav-item">
                        <form method="Post">

                        <input class="btn btn-outline-secondary" type="submit" Name="Logout" value="Выйти">
                        </form>
                    </li>

                </ul>
            </div>

        </div>
    </nav>

    <script src="https://use.fontawesome.com/7328c42f01.js"></script>

</body>
</html>