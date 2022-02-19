<?php
session_start();
if (isset($_SESSION["nama"])) {
    header("location: index.php");
}
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Halaman Login</title>
    <link rel="stylesheet" href="css_login.css">
</head>

<body>
    <form name=" login" action="#" method="post">
    <section class = "tampil">
        <span></span>
        <h1>ADMINISTRATOR</h1>
        <form>
            <input placeholder='User Name' type='text' name="username">
            <input placeholder='Password' type='password' name="password">
        </form>
        <button name= "login">Log In</button>
    </section>
    </div>
    </form>
    </div>
    <?php
    $username = isset($_POST["username"]) ? $_POST["username"] : "";
    $password = isset($_POST["password"]) ? $_POST["password"] : "";

    if (isset($_POST["login"])) {

        if ($username == 'Nova' && $password == 'Nova') {
            session_start();
            $_SESSION["nama"] = $username;
            header("location: index.php");
        } else {
            echo '<script>swal("Login Gagal!", "Username atau Password Yang Anda Masukan Salah", "error")</script>';
        }
    }
    ?>
</body>