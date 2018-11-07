<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Список категорий
$category = get_category();
$category_tree = map_tree($category);
//Формируем список категорий для вывода
$category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_product.php', $tab='', ['create_product'=> 'new', 'session_parent' => '']);


if(isset($_POST['sub'])){
    //var_dump($_FILES['file']);
    //debug_arr($_POST);
    //exit;
    $valid = ValidateCsv($_FILES);
    if(!$valid) {
        header("Location: /admin/product-import/");
        exit();
    }
    $import = import($_FILES['file']['tmp_name'], $_POST['category']);
    header("Location: /admin/product-import/");
    exit();
}


require_once TMP_ADM . $view .'.php';