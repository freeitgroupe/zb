<?php
define("CATALOG", TRUE);
error_reporting(E_ALL);
require_once "include/db_connect.php";
ini_set('session.save_path',SESSION_PATH);
session_start();
//var_dump($_SERVER["DOCUMENT_ROOT"]);
//Формирование токена
if (empty($_SESSION['csrf_token'])) {
    $_SESSION['csrf_token'] = bin2hex(openssl_random_pseudo_bytes(16));
}
//
////проверка токена при пост запросах
//if (isset($_POST['csrf_token']) && $_POST['csrf_token'] !== $_SESSION['csrf_token']) {
//    // POST data is not valid.
//   // return false;
//}

$url = str_replace("/", '', $_SERVER['REQUEST_URI']);

$url = substr( $_SERVER['REQUEST_URI'], 1);

$routes = array(
    //array('url' => '#.*#', 'view' => 'profile'),
    array('url' => '#^$|^\?#', 'view' => 'index'),
    array('url' => '#^product/?(?P<prod_alias>[a-z0-9-_]+)#i', 'view' => 'product'),
    array('url' => '#^stock-product/?(?P<stock_alias>[a-z0-9-_]+)#i', 'view' => 'productstock'),
    array('url' => '#^suppliers/?(?P<pages_alias>[a-z0-9-_]+)#i', 'view' => 'suppliers'),
    array('url' => '#^category/?(?P<cat_alias>[a-z0-9-_]+)#i', 'view' => 'category'),
    array('url' => '#^page/(?P<page_alias>[a-z0-9-_]+)#i', 'view' => 'page'),
    array('url' => '#^registration/?#i', 'view' => 'registration'),
    array('url' => '#^login/?#i', 'view' => 'login'),
    array('url' => '#^forget/?#i', 'view' => 'remindPass'),
    array('url' => '#^recovery/(?P<recovery>[a-z0-9-]+)#i', 'view' => 'recovery'),
    array('url' => '#^search/?#i', 'view' => 'search'),
    array('url' => '#^cartajax/?#i', 'view' => 'cartajax'),
    array('url' => '#^cart/?#i', 'view' => 'cart'),
    array('url' => '#^checkout/?#i', 'view' => 'checkout'),
    array('url' => '#^checkout_delivery/?#i', 'view' => 'checkout'),
    array('url' => '#^checkout_pay/?#i', 'view' => 'checkout'),
    array('url' => '#^confirm/?#i', 'view' => 'confirm'),
    array('url' => '#^technical/?#i', 'view' => 'technical'),
    array('url' => '#^profile/?#i', 'view' => 'profile'),
    array('url' => '#^orders/?#i', 'view' => 'orders'),
    array('url' => '#^detail-orders/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'ordersdetail'),
    array('url' => '#^wish-list/?#i', 'view' => 'wishuser'),
    array('url' => '#^orders/?#i', 'view' => 'orders'),
    array('url' => '#^pay-success/?#i', 'view' => 'paysuccess'),
    array('url' => '#^pay-cancel/?#i', 'view' => 'paycancel'),
    array('url' => '#^pay-ipn/?#i', 'view' => 'payipn'),
    array('url' => '#^goauth/?(?P<code>[a-z0-9-_ = \?]+)#i', 'view' => 'goauth'),
    array('url' => '#^manager/?#i', 'view' => 'manager'),
);

foreach ($routes as $route){
    //var_dump($route);
    if(preg_match($route['url'], $url, $match)){
        $view = $route['view'];
        break;
    }
}

if(empty($match) ){
    include 'views/404.php';
    exit;
}
//phpinfo();
//require_once "controllers/auth_controller.php";
//require_once "controllers/remindPass_controller.php";

//приветствие юзера при в шапке сайта
$user_greeting='<p class="info-for-user">Hello!<a href="/login" id="auth-info">Sign In</a></p>';
$user_header='<p><a href="/registration">Create account</a></p>';

if(isset($_SESSION['auth_email']))
{
    $user_greeting = '<p class="info-for-user">'.$_SESSION['auth_email'].'</p>';
    $user_header='<p><a href="/logout" id="logout" data-event-user="logout">LogOut</a></p>';
    $user_header .='<p><a href="/profile/" >Profile</a></p>';
}

//var_dump($match);
//extract($match);
//var_dump($_COOKIE['reg_buyer']);
//session_destroy();
//require_once "controllers/remindPass_controller.php";
include "controllers/{$view}_controller.php";
exit;
