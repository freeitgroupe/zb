<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//достаем комментарии
$data = get_comments_admin();
if(!$data['res']){$get_comments_admin = $data['mess'];}
$get_comments_admin = $data['res'];
//debug_arr($get_comments_admin);
require_once TMP_ADM . $view .'.php';