<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//количество категорий с дополнительными свойствами
//Список категорий
$category = get_category();
$category_tree = map_tree($category);
$category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree.php', $tab='', ['create_category'=>'new']);

//Список категорий с дополнительными свойствами
$CategoryWithAdditionalAttr = CategoryWithAdditionalAttr();
//debug_arr($CategoryWithAdditionalAttr);
$ReturnNeArrFromJson = ReturnNeArrFromJson($CategoryWithAdditionalAttr);
//debug_arr($ReturnNeArrFromJson);

require_once TMP_ADM . $view .'.php';