<?php
defined("CATALOG") or die("Access denied");
// хлебные крошки
// return true (array not empty) || return false
//debug_arr($id);
if(!isset($id)){$id =false;}
$breadcrumbs_array = breadcrumbs($category, $id);
//debug_arr($breadcrumbs_array);
if($breadcrumbs_array){
    $breadcrumbs = "<a href='/'>Home</a> / ";
    foreach($breadcrumbs_array as $id => $title){
        $breadcrumbs .= "<a href='/category/{$id}'>{$title}</a> / ";
    }
    if(!isset($get_one_product)){
        $breadcrumbs = rtrim($breadcrumbs, " / ");
        $breadcrumbs = preg_replace("#(.+)?<a.+>(.+)</a>$#", "$1$2", $breadcrumbs);
    } else{
        $breadcrumbs .= $get_one_product['title'];
    }
}else{
    $breadcrumbs = "<a href='" .PATH. "'>Home</a> / ";
}
