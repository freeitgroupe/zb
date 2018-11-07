<?php
defined('CATALOG') or die("Access denied");
//Информация о поставщике по id
function getDataSupplier($supplierId){
    $res = Model_Driver::get_instance()->select(['*'], 'suppliers', ['supplier_id'=>$supplierId]);
    if(!$res){return false;}
    return $res[0];
}
//Информация о продуктах поставщика
function getDataProductsSupplier($supplierId){
    $query = "SELECT rel_suppliers_products.product_id, rel_suppliers_products.supplier_id as rel_supplier_id, suppliers.* FROM rel_suppliers_products INNER JOIN suppliers ON rel_suppliers_products.supplier_id=suppliers.supplier_id AND suppliers.supplier_id=$supplierId AND suppliers.visible='1'";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if(!$res) return false;
    if($res == NULL) return 'Empty';
    $products_id=[];
    foreach ($res as $item){
        $products_id[] = $item['product_id'];
    }
    $query = "SELECT id, title, article, price, alias FROM products WHERE id IN(" .implode(',',$products_id) .")";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    return $res;
}

//Обновление данных о поставщике
function editSupplierRes($id, $arr){
    //$id - аргумент для определения выборки в бд
    //$arr - Массив обрабатываемых данных
    $err = [];
    $id = (int)$id;
    $title = clear_string($arr['title']);
    if(strlen($title) < 3 || strlen($title) > 100){
        $err[] = "For the page title, the number of characters from 3 to 100!";
    }
    if(count($err)) {
        $_SESSION['message']['error'] = implode('</br>', $err);
        return false;
    }

    $resUpdate = editDataInTable('suppliers', ['title'=>$arr['title'], 'description'=>$arr['description'], 'meta_d'=>$arr['meta_d'],'meta_k'=>$arr['meta_k'],'state'=>$arr['state'],'city'=>$arr['city'],'zip_code'=>$arr['zip_code'], 'email'=>$arr['email'], 'phone'=>$arr['phone'],'visible'=>$arr['visible']],['supplier_id'=>$id],['=']);
    if(!$resUpdate){
        $_SESSION['message']['error'] ='Error update!</br>';
        return false;
    }
    //Формируем alias,
    $alias = get_alias('suppliers', 'alias', $title, $id, 'edit', 'supplier_id');
    //Записываем алиас
    $res_alias = Model_Driver::get_instance()->update('suppliers', ['alias'],[$alias],['supplier_id'=>$id]);
    //debug_arr($res_alias);
    //exit;
    if(!$res_alias){
        $_SESSION['message']['error'] = 'Error updating alias!';
        return false;
    }
    $_SESSION['message']['success'] = "Success!";
    return true;
}

//Обновление данных о поставщике
function newSupplierRes($arr){
    //$id - аргумент для определения выборки в бд
    //$arr - Массив обрабатываемых данных
    $err = [];
    $title = clear_string($arr['title']);
    if(strlen($title) < 3 || strlen($title) > 100){
        $err[] = "For the page title, the number of characters from 3 to 100!";
    }
    if(count($err)) {
        $_SESSION['message']['error'] = implode('</br>', $err);
        return false;
    }
    $resUpdate = addDataToTable('suppliers', ['title'=>$arr['title'], 'description'=>$arr['description'], 'meta_d'=>$arr['meta_d'],'meta_k'=>$arr['meta_k'],'state'=>$arr['state'],'city'=>$arr['city'],'zip_code'=>$arr['zip_code'], 'email'=>$arr['email'], 'phone'=>$arr['phone'],'visible'=>$arr['visible']]);
    if(!$resUpdate){
        $_SESSION['message']['error'] ='Error update!</br>';
        return false;
    }
    $maxId = maxParamInTable('suppliers', 'supplier_id');
    if(!$maxId){
        $_SESSION['message']['error'] = 'Error max id!';
        return false;
    }
    //Формируем alias,
    $alias = get_alias('suppliers', 'alias', $title, $maxId);
    //Записываем алиас
    $resUpdateAlias = editDataInTable('suppliers', ['alias'=>$alias],['supplier_id'=>$maxId], ['=']);
    if(!$resUpdateAlias){
        $_SESSION['message']['error'] = 'Error updating alias!';
        return false;
    }
    $_SESSION['message']['success'] = "Success!";
    return true;
}

