<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('prod_alias', $match)) header("Location: /admin");

//Список категорий
$category = get_category();
$category_tree = map_tree($category);
//информация о складах
$warehouse = find_all_from_table('warehouse');
//debug_arr($warehouse);
$availability_products = find_all_from_table('availability_products');
//debug_arr($warehouse);

//Данные о Upsell
$product_upsell = product_upsell();
//debug_arr($product_upsell);


//Информация о складах
$warehouse_info = warehouse_info();
//Информация о акциях
$product_stock_info = get_stock();
//debug_arr($product_stock_info);
//проверяем id товара на входе при запросе редактирования
if($match['prod_alias'] != 'new'){
    $product_id = '';
    $product_alias = $match['prod_alias'];
    //Поиск id продукта по алиасу
    $product_id = findOneProductId($product_alias);
    $product_id = (int)$product_id;
    
    //если алиас не найден уходим на главную старницу
    if (!$product_id)
    {
        header("Location: /admin");
        exit();
    }
    $pages_id = $product_id;
    //deleteImageGallery($pages_id, '082417_44_B8rMAvbAC.png');
    //Массив данных о продукте
    $product_info_for_edit = product_info_for_edit($pages_id);
    //id активной категории
    $product_info_id_category = $product_info_for_edit['category_id'];
    //Массив данных выбранной категории товара
    $product_info_category = product_info_category($product_info_id_category);

    //Информация о upsell product для выбранного продукта
    $product_info_upsell = findOneParam('rel_upsell_prod', 'product_id', $pages_id, true);
    //debug_arr($product_info_upsell);

    if($product_upsell != false ){
        $product_upsell_rel_prod = product_upsell_rel_prod($product_upsell, $product_info_upsell, true);
    }else{
        $product_upsell_rel_prod = false;
    }
    //var_dump($product_upsell_rel_prod);

    //Информация о поставщиках для данного продукта
    if($suppliers = suppliers()){
        $product_info_suppliers = product_info_suppliers($pages_id);
        $product_suppliers_rel_prod = product_suppliers_rel_prod($suppliers, $product_info_suppliers);
    }else{
        $product_suppliers_rel_prod = false;
    }

    //Информация о складе для выбраного продуктв продукта
    $warehouse_for_one_prod = find_one_param_table('rel_warehouse_product', 'product_id', $pages_id);
   
    //Массив дополнительных данных о товаре согласно категории товара
    $product_additional_info = false;
    if(!empty($product_info_category['additional_attribute'])){
        $product_additional_info = unserialize($product_info_category['additional_attribute']);
    }

    //информация (склады - продукт)
    $warehouse_all_info = warehouse_all_info_rel_prod($pages_id);
    if($warehouse_all_info > false)
    {
        $id_isset_warehouse = id_isset_warehouse($warehouse_all_info);
        $find_empty_warehouse = find_not_in_param_table("`warehouse`", "id", $id_isset_warehouse);
    }else{
        $find_empty_warehouse = $warehouse;
    }
    //debug_arr( $find_empty_warehouse);

    //Массив инфы о товаре
    $arr_data = [
        'product_info_for_edit'=>$product_info_for_edit,
        'product_info_category'=>$product_info_category,
        'product_upsell'=>$product_upsell_rel_prod,
        'product_suppliers'=>$product_suppliers_rel_prod,
        'product_additional_info'=>$product_additional_info,
        'product_stock_info'=>$product_stock_info,
        'availability_products'=>$availability_products,
        'warehouse_for_one_prod'=>$warehouse_for_one_prod,
        'warehouse_all_info'=>$warehouse_all_info,
        'warehouse_all_info_empty_prod'=>$find_empty_warehouse,
    ];
    //debug_arr($arr_data);

    //Формируем список категорий
    $category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_product.php', $tab='', ['active_category'=> $product_info_for_edit['category_id']]);

    //Формируем список категорий для сопутствующих товаров
    $category_menu_admin_for_rel_cat = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_product.php', $tab='', ['active_category'=> $product_info_for_edit['related_category']]);

    //Редактирование продукта
    if (isset($_POST['edit_pages_success'])) {
        //debug_arr($_POST);
        $arr_post = $_POST;
        $edit_product_res = edit_product_res($pages_id, $arr_post);
        if(!$edit_product_res)
        {
            header("Location: /admin/edit-product/" . $product_alias);
            exit();
        }
        if(isset($arr_post['suppliers_id'])){
            $resEditSuppliers = EditSuppliersForProduct($arr_post['suppliers_id'], $pages_id, 'rel_suppliers_products');
        }else{
            $resEditSuppliers = EditSuppliersForProduct(false, $pages_id, 'rel_suppliers_products');
        }

        header("Location: /admin/edit-product/" . $product_alias);
        exit();
    }

    //Редактирование информации по складу для продута
    if (isset($_POST['edit_warehouse_success'])) {
        //debug_arr($_POST); exit;
        $arr_post = $_POST;
        $edit_product_res = edit_warehouse_res($pages_id, $arr_post);
        if(!$edit_product_res)
        {
            header("Location: /admin/edit-product/" . $product_alias);
            exit();
        }
        header("Location: /admin/edit-product/" . $product_alias);
        exit();
    }

    //Удаление продукта с указанного склада
    if(isset($_POST['delete_product_from_warehouse'])) {
        //debug_arr($_POST); exit;
        $arr_post = $_POST;
        $delete_product_from_warehouse_res = delete_product_from_warehouse_res($pages_id, $arr_post);
        if(!$delete_product_from_warehouse_res)
        {
            header("Location: /admin/edit-product/" . $product_alias);
            exit();
        }
        header("Location: /admin/edit-product/" . $product_alias);
        exit();
    }
}
//удаление фото из галереи
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages' && $_POST['pageFileDel']){
    $pages_id =(int)$_POST['delete_pages_id'];
    $img_name = $_POST['pageFileDel'];
//    debug_arr($pages_id);
//    debug_arr($img_name);
//    exit;
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении!']));

    $delete_pages_res = deleteImageGallery($pages_id, $img_name);
    if(!$delete_pages_res == 'false_unlink_img')
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления фото из папки хранения!']));

    if (!$delete_pages_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

require_once TMP_ADM . $view .'.php';