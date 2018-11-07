<?php
defined("CATALOG") or die("Access denied");
require_once $_SERVER['DOCUMENT_ROOT'] . "/models/authCookie_model.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/models/auth_model.php";
//echo $_SERVER['DOCUMENT_ROOT'] . "/models/authCookie_model.php";
//Редирект если пользователь авторизован

if(isset($_POST['login']) && isset($_POST['pass'])){
    if(isset($_SESSION['auth'])) return false;
    //$response = $_POST["captcha"];
    $res_protect = protect_auth($_POST["captcha"]);
    $login = $_POST["login"];
    $pass = $_POST["pass"];
    $auth = auth($login, $pass, $res_protect);
}

if(isset($_SESSION['auth']) && isset($_POST['event_user'])){
    $event_user = $_POST['event_user'];
    $session_auth = $_SESSION['auth'];
    //var_dump($event_user);exit();
    $logout_res = logout_res($event_user, $_SESSION['auth']);
}

//Авторизация через facebook
//ссылка для авторизации
//$path = URL_AUTH ."?"."client_id=".CLIENT_ID."&redirect_uri=".urlencode(REDIRECT)."&response_type=code&scope=email";
//if(isset($_GET['code'])){
//    $result = get_token($_GET['code']);
//    //var_dump($result);
//    if($result){
//        $fb_info = get_data($result);
//        if($fb_info > false){
//            //пробуем авторизовать пользователя
//            oauthSocialFacebook($fb_info['id']);
//        }
//    }
//}








