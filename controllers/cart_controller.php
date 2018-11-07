<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
require_once "controllers/confirm_controller.php";
//require_once "models/confirm_model.php";

$title_header .= 'Your order';
$description_header .= strip_tags(str_replace("\"","&quot;", 'Cart'));
$keywords_header .= strip_tags(str_replace("\"","&quot;", 'Cart'));
//$image_header .= substr(PATH, 0, -1) . CAT_IMG . $getInfoCategory['image'];

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

    //var_dump( $param_action);exit;
    if($id > 0) {
        $order_list_recalc = order_list_recalc($id, $param_action, $quantity);
    }

}

$payment_id = maxParamInTable('payments','payment_id');
//debug_arr($payment_id);

include 'libs/breadcrumbs.php';
$breadcrumbs .='<a href="#">Cart</a>';
require_once "views/{$view}.php";

//debug_arr($order_list_user);



