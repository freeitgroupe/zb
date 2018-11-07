<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/cart_model.php";

//При POST запросах на заполнение формы используем даннный контроллер
require_once "controllers/confirm_controller.php";
//require_once "models/confirm_model.php";

if((key_exists('param', $_POST) && key_exists('param_action', $_POST)) || key_exists('param_quantity', $_POST)){
    $param ='';
    $param_action='';
    $param_quantity='';
    $quantity='';
    $param = json_decode($_POST['param']);
    $param_action = json_decode($_POST['param_action']);
    if(key_exists('param_quantity', $_POST)){
        $param_quantity = json_decode($_POST['param_quantity']);
        $quantity = $param_quantity->{'quantity'};
    }
    $id = (int)$param->{'id'};
    $param_action = $param_action->{'action'};
    if($id > 0) {
        $order_list_recalc = order_list_recalc($id, $param_action, $quantity);
    }
}

if(key_exists('param_res', $_POST)){
    $order_list_user = order_list();
    $total_sum_order = array_pop($order_list_user);
}
//debug_arr($_SESSION);
$title_header .= 'Checkout';
$description_header .= strip_tags(str_replace("\"","&quot;", 'Checkout'));
$keywords_header .= strip_tags(str_replace("\"","&quot;", 'Checkout'));
include 'libs/breadcrumbs.php';
$breadcrumbs .='<a href="#">Checkout</a>';
require_once "views/{$view}.php";

//debug_arr($order_list_user);