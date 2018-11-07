<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match)) header("Location: /admin");
$pages_id = (int)$match['pages_id'];

$get_one_orders_admin = get_one_orders_admin($pages_id);
$get_one_orders_product_info = get_one_orders_product_info($pages_id);

//debug_arr($get_one_orders_admin);
//debug_arr($get_one_orders_product_info);



require_once TMP_ADM . $view .'.php';