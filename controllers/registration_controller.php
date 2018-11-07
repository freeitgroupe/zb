<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

$title_header .= 'Registration';
$description_header .= strip_tags(str_replace("\"","&quot;", 'Registration'));
$keywords_header .= strip_tags(str_replace("\"","&quot;", 'Registration'));


if(isset($_POST['reg_email']) && isset($_POST['reg_pass']) && isset($_POST['reg_pass_again'])){
    $email = clear_string($_POST['reg_email']);
    $pass = strtolower(clear_string($_POST['reg_pass']));
    $pass_again = strtolower(clear_string($_POST['reg_pass_again']));
    $registration_user = registration_user($email, $pass,$pass_again);
}

// if(isset($_POST['reg_email'])){
//    $email = clear_string($_POST['reg_email']);//проверяем запрос
//    $validate_email = validate_email($email);
//}

require_once "views/{$view}.php";
