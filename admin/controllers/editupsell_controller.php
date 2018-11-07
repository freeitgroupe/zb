<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match)) header("Location: /admin/upsell/");
$pages_id = (int)$match['pages_id'];
$res = findOneParam('upsell', 'id', $pages_id);
if(!$res) header("Location: /admin/upsell/");
$OneProductForUpsell = OneProductForUpsell((int)$match['pages_id']);
//добавляем upsell в базу
if(isset($_POST['upsell_confirm'])){
    $arr_post = $_POST;
    // debug_arr($arr_post);exit;
    $res = EditProductsForUpsell($arr_post,$pages_id);
    if(!$res){
        header("Location: /admin/upsell/$pages_id");
        exit();
    }else{
        header("Location: /admin/upsell/");
        exit();
    }
}


require_once TMP_ADM . $view .'.php';