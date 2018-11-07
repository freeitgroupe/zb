<?php
defined("CATALOG") or die("Access denied");
require_once "main_controller.php";
require_once "models/{$view}_model.php";


$page_alias = $match['page_alias'];
$page = get_one_pages($page_alias);
if($page){
    $title_header .= $page['title'];
    $description_header .= strip_tags(str_replace("\"","&quot;", $page['meta_d']));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", $page['meta_k']));
    //$image_header .= substr(PATH, 0, -1) . CAT_IMG . $getInfoCategory['image'];
    $breadcrumbsPage = "<a href='/'>Home</a> / " . $page['title'];
    require_once "views/{$view}.php";
}else{
    require_once 'views/404.php';
}
