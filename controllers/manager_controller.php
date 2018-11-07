<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
//if(isset($_SESSION['auth'])) header("Location: /home");
//Редирект если пользователь авторизован
if(isset($_SESSION['authManager'])) header("Location: /");

if(isset($_POST['login']) && isset($_POST['pass'])){
    if(isset($_SESSION['auth'])) return false;
    //$response = $_POST["captcha"];
    $res_protect = protect_auth($_POST["captcha"]);
    $login = $_POST["login"];
    $pass = $_POST["pass"];
    $auth = authManager($login, $pass, $res_protect);
}

if(isset($_SESSION['auth']) && isset($_POST['event_user'])){
    $event_user = $_POST['event_user'];
    $session_auth = $_SESSION['auth'];
    //var_dump($event_user);exit();
    $logout_res = logoutManager($event_user, $_SESSION['authManager']);
}

$title_header .= 'Login for Manager';
$description_header .= strip_tags(str_replace("\"","&quot;", 'Login'));
$keywords_header .= strip_tags(str_replace("\"","&quot;", 'Login'));
require_once "views/{$view}.php";








