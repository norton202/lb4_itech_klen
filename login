<?php

if(!empty($_POST)){
    require ('auth.php');

    $login = $_POST['log'] ?? '';
    $password = $_POST['pas'] ?? '';

    if(checkAuth($login, $password)){
        setcookie('login', $login, 0, '/');
        setcookie('password', $password, 0, '/');
        header('Location: /index.php');
    } else{
        $check = 'Неправильный логин или пароль!';
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Вход</title>
</head>
<body>
    <?php if (isset($check)): ?>
        <span><?= $check ?></span>
    <?php endif; ?>
    <form action="login.php" method="post">
        <input type="text" name="log">
        <br>
        <input type="password" name="pas">
        <br>
        <input type="submit" value="Войти">
    </form>
</body>
</html>
