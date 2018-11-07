<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "controllers/auth_controller.php";
require_once "models/{$view}_model.php";
if(isset($_SESSION['auth'])) header("Location: /profile");
$title_header .= 'Login';
$description_header .= strip_tags(str_replace("\"","&quot;", 'Login'));
$keywords_header .= strip_tags(str_replace("\"","&quot;", 'Login'));
require_once "views/{$view}.php";