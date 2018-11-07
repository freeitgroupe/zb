<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('prod_alias', $match)) header("Location: /admin");

//Список категорий
$category = get_category();
$category_tree = map_tree($category);
//информация о складах
$warehouse = find_all_from_table('warehouse');
//статусы для продукта
$availability_products = find_all_from_table('availability_products');
//debug_arr($warehouse);
//Данные о Upsell
$product_upsell = product_upsell();
//Информация о акциях
$product_stock_info = get_stock();
//Информация о доступных поставщиках
$suppliers = suppliers();
//debug_arr($suppliers);

//debug_arr($product_stock_info);
//проверяем id товара на входе при запросе редактирования
//при добавлении нового продукта
$pages_id = $match['prod_alias'];
if($pages_id == 'new'){
    if(!isset($_SESSION['data'])) {
        $_SESSION['data'] = array();
        $_SESSION['data']['title'] ='';
        $_SESSION['data']['article'] ='';
        $_SESSION['data']['position'] ='';
        $_SESSION['data']['meta_k'] ='';
        $_SESSION['data']['category_id'] ='';
        $_SESSION['data']['package'] ='';
        $_SESSION['data']['notice'] ='';
        $_SESSION['data']['meta_d'] ='';
        $_SESSION['data']['related_category'] ='';
        $_SESSION['data']['mark_hit'] ='';
        $_SESSION['data']['fast_delivery'] ='';
        $_SESSION['data']['perfect_delivery'] ='';
        $_SESSION['data']['warranty_months'] ='';
        $_SESSION['data']['exchange_prod'] ='';
        $_SESSION['data']['mark_expert'] ='';
        $_SESSION['data']['mark_stock'] ='';
        $_SESSION['data']['mark_discontinued'] ='';
        $_SESSION['data']['mark_view'] = '';
        $_SESSION['data']['mark_available'] ='';
        $_SESSION['data']['color'] ='';
        $_SESSION['data']['link_video'] ='';
        $_SESSION['data']['watermark'] ='';
        $_SESSION['data']['product_upsell']='';
        $_SESSION['data']['price']='';
    }

    //Массив инфы о товаре
    $arr_data =
    [
        'product_info_for_edit'=>[],
        'product_upsell'=>$product_upsell,
        'product_stock_info'=>$product_stock_info,
        'availability_products'=>$availability_products,
        'warehouse_all_info_empty_prod'=>$warehouse,
        'new_prod'=>true,
    ];
    //var_dump($_SESSION['data']);
    $_SESSION['data']['product_upsell']=$arr_data['product_upsell'];

    //Формируем список категорий для продукта
    $category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_product.php', $tab='', ['create_product'=> 'new', 'session_parent' => $_SESSION['data']['category_id'] ]);

    //Формируем список категорий для сопутствующих товаров
    $category_menu_admin_for_rel_cat = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_product.php', $tab='', ['active_category'=>  $_SESSION['data']['related_category']]);
    ///================================///
    //обработка запроса надобавлеие товара
    //debug_arr($warehouse);
    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        //debug_arr($arr_post); exit;
        $new_product_res = new_product_res($arr_post);
        if (!$new_product_res) {
            header("Location: /admin/add-product/new");
            exit();
        }
        if(isset($arr_post['suppliers_id'])){
            $maxRowTable = maxParamInTable('products', 'id');
            AddSuppliersForProduct($arr_post['suppliers_id'], $maxRowTable, 'rel_suppliers_products');
        }

        header("Location: /admin/product-options/");
        exit();
    }

    require_once TMP_ADM . $view .'.php';
}
else{header("Location: /admin/product-options/");}

