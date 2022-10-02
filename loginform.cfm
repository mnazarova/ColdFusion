<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Тестовое задание</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
</head>
    <body>

        <div class="px-3 my-5 mx-auto card bg-light border-dark col-sm-6 col-md-5 col-lg-3">
            <div class="mt-5 text-center h3">
                <b>Вход в систему</b>
            </div>
            <hr>

                <form method="Post">
                    <div class="form-group">
                        <label for="j_username">Имя</label>
                        <input type="text"
                               class="form-control border-dark"
                               name="j_username"
                               id="j_username"
                               placeholder="введите имя"
                               required>
                    </div>
                    <div class="form-group">
                        <label for="j_password">Пароль</label>
                        <input type="password"
                               class="form-control border-dark"
                               name="j_password"
                               id="j_password"
                               placeholder="введите пароль"
                               autocomplete="on"
                               required>
                    </div>

                    <div class="form-group mt-5">
                        <input class="btn btn-outline-info btn-block" type="submit" value="Войти">
                    </div>
                </form>

        </div>

    </body>
</html>
