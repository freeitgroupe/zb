<?php
define("CATALOG", TRUE);
error_reporting(E_ALL);
require_once "../include/db_connect.php";
ini_set('session.save_path',SESSION_PATH);
session_start();

$app_path = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['PHP_SELF'];

//вырезаем index.php с конца строки
 $app_path = preg_replace('#[^/]+$#', '', $app_path);

//опредяляем путь к админке и записываем в константу
define("PATH_ADMIN", $app_path);

//путь к админке
$url = 'http://' . $_SERVER['HTTP_HOST'] . $_SERVER['REQUEST_URI'];
//print_r($_SERVER['REQUEST_URI']);
//получаем запрашиваемый url
$url = str_replace(PATH_ADMIN, '', $url);
//var_dump($url);
$site_url = rtrim(str_replace('admin','', PATH_ADMIN), '/');
define('SITE', $site_url);

$routes=[
    ['url'=>'#^$|^\?#', 'view'=>'home'],
    ['url'=>'#^home/?#', 'view'=>'home'],
    ['url'=>'#^login/?#', 'view'=>'login'],      
    ['url'=>'#^static-pages/?(?P<pages_id>\d+)?#i', 'view'=>'staticpages'],
    ['url'=>'#^edit-static-pages/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editpages'],
    ['url'=>'#^warehouse/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'warehouse'],
    ['url'=>'#^edit-warehouse/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editwarehouse'],   
    ['url'=>'#^category-options/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'categorynews'],
    ['url'=>'#^edit-category-news/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editcategorynews'],
    ['url'=>'#^category-product-options/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'categoryproducts'],
    ['url'=>'#^edit-category-product/?(?P<prod_alias>[a-z0-9-_]+)?#i', 'view'=>'editcategoryproducts'],
    ['url'=>'#^product-options/?#i', 'view'=>'product'],
    ['url'=>'#^product-import/?#i', 'view'=>'importproducts'],
    ['url'=>'#^upsell/?#i', 'view'=>'upsell'],
    ['url'=>'#^edit-upsell/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editupsell'],
    ['url'=>'#^category-fields/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'categoryfields'],
    ['url'=>'#^edit-category-fields/?(?P<cat_alias>[a-z0-9-_]+)?#i', 'view'=>'editcategoryfields'],
	['url'=>'#^edit-upsell/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editupsell'],
    ['url'=>'#^edit-product/?(?P<prod_alias>[a-z0-9-_]+)#i', 'view' => 'editproduct'],
	['url'=>'#^add-product/?(?P<prod_alias>[a-z0-9-_]+)#i', 'view' => 'addproduct'],
    ['url'=>'#^orders-options/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'orders'],
    ['url'=>'#^orders-options-detail/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'detailorder'],
    ['url'=>'#^edit-order/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editorder'],
    ['url'=>'#^stock/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'stock'],
    ['url'=>'#^edit-stock/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editstock'],
    ['url'=>'#^comments/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'comments'],
    ['url'=>'#^users/?#i', 'view'=>'users'],
    ['url'=>'#^edit-users/?(?P<pages_id>[a-z0-9_-]+)?#i', 'view'=>'editusers'],
    ['url'=>'#^team/?#i', 'view'=>'team'],
    ['url'=>'#^edit-team/?(?P<pages_id>[a-z0-9]+)?#i', 'view'=>'editteam'],
    ['url'=>'#^settings-statictext/?#i', 'view'=>'statictext'],
    ['url'=>'#^settings/?#i', 'view'=>'settings'],
    ['url'=>'#^export/?#i', 'view'=>'export'],
    ['url'=>'#^suppliers/?#i', 'view'=>'suppliers'],
    ['url'=>'#^edit-suppliers/?(?P<pages_alias>[a-z0-9-_]+)?#i', 'view'=>'editsuppliers'],
    ['url'=>'#^discount/?#i', 'view'=>'discount'],
    ['url'=>'#^edit-discount/?(?P<pages_alias>[a-z0-9-_]+)?#i', 'view'=>'editdiscount'],
];
foreach ($routes as $route){
    //var_dump($route);exit;
    if(preg_match($route['url'], $url, $match)){
        $view = $route['view'];
        break;
    }
}

if(empty($match) ){
    header("HTTP/1.1 404 Not Found");
    require_once TMP_ADM . '404.php';
    exit;
}

//var_dump($_SESSION);
//exit;

//админ роль 2
//менеджер заказов роль 3
//менеджер контента роль 4
if(!isset($_SESSION['auth_role']) || $_SESSION['auth_role'] != '2'){
    header("Location: /");
    exit;
}else{
    //print_r($_SESSION['auth_role']);
    include "controllers/{$view}_controller.php";
    include "../controllers/auth_controller.php";
}
exit;