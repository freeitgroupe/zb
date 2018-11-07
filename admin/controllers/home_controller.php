<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
//header("Location:" . PATH );
if(!isset($_SESSION['filter'])){createSessionData('filter',['rangeDate'=>'']);}

if($_SERVER['REQUEST_METHOD'] == 'POST' && !empty($_POST['searchButton'])){

    $time = clear_string($_POST['rangeTime']);

    //получаем время в массиве
    //$time_arr = return ['timeStart'=>'2018-02-02 00:00:00', 'timeEnd'=>'2018-02-03 00:00:00'];
    $time_arr = checkRangeFormatDate($time);

    //Массив с данными
    $res = [
        'CountAllProducts'=> CountAllProducts(),
        'CountAvailableProducts' => CountAvailableProducts(),
        'CountSoldProducts' => CountSoldProducts($time_arr['timeStart'],$time_arr['timeEnd']),
        'averageTransactionCheck' => averageTransactionCheck($time_arr['timeStart'],$time_arr['timeEnd']),
        'countCurrentOrders' => countCurrentOrders($time_arr['timeStart'],$time_arr['timeEnd']),
        'countPendingTransaction' => countPendingTransaction($time_arr['timeStart'],$time_arr['timeEnd']),
        'countRegUsers' => countRegUsers($time_arr['timeStart'],$time_arr['timeEnd']),
        //'popularSoldProducts' => popularSoldProducts($time_arr['timeStart'],$time_arr['timeEnd']),
        'CountConfirmPayAllSolidProducts' => CountConfirmPayAllSolidProducts($time_arr['timeStart'],$time_arr['timeEnd']),
        'CountProcessedPayAllSolidProducts' => CountProcessedPayAllSolidProducts($time_arr['timeStart'],$time_arr['timeEnd']),
        'PopularViewsProduct' => PopularViewsProduct(),
        'PopularViewsCategory' => PopularViewsCategory(),
        'countProcessedCart' => countProcessedCart(),
    ];
    //debug_arr($res);
    //debug_arr($_POST);exit;
}

require_once TMP_ADM . $view .'.php';
