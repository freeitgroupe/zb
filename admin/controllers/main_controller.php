<?php
defined("CATALOG") or die("Access denied");
require_once "../include/db_connect.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/models/main_model.php";
require_once "models/main_model.php";

if (isset($_SESSION['auth']) != 'yes_auth' && isset($_COOKIE["rememberme"])){
    $cookie = $_COOKIE["rememberme"];
    $auth_cookie = auth_cookie($cookie);
}

if(isset($_SESSION['auth']) && isset($_POST['event_user'])){
    $event_user = $_POST['event_user'];
    $session_auth = $_SESSION['auth'];
    //var_dump($event_user);exit();
    $logout_res = logout_res($event_user, $_SESSION['auth']);
}


//Специальные акционные и другие метки для товара
$special_meta = special_meta();

//Метки наличия товара
$special_meta_available = special_meta_available();

//debug_arr($special_meta);
$states_of_usa = states_of_usa();
//debug_arr($states_of_usa);
//время проведения акций
checkTimeForStock();

//определение локации пользователя
//$geoLocationUsers = geoLocationUsers();

//Меню для админ панели
$menu_admin = menu_admin();
$menu_admin_tree = map_tree($menu_admin);
$menu_admin_str = data_tree_to_string($menu_admin_tree, TMP_ADM . 'tpl/menu_admin_tree.php', $tab=0);
//debug_arr(active_url());
