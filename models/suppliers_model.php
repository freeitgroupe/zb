<?php defined("CATALOG") or die("Access denied");

//Информация о продуктах поставщика
function getArrProductsSupplier($supplierId){
    $query = "SELECT rel_suppliers_products.product_id, rel_suppliers_products.supplier_id as rel_supplier_id, suppliers.* FROM rel_suppliers_products INNER JOIN suppliers ON rel_suppliers_products.supplier_id=suppliers.supplier_id AND suppliers.supplier_id=$supplierId AND suppliers.visible='1'";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if(!$res) return false;
    if($res == NULL) return 'Empty';
    $products_id=[];
    foreach ($res as $item){
        $products_id[] = $item['product_id'];
    }
    //$query = "SELECT id, title, article, price, alias FROM products WHERE id IN(" .implode(',',$products_id) .")";
    return $products_id;
}

function countProductsForSupplier($supplierId){
    $query = "SELECT COUNT(*) FROM (SELECT rel_suppliers_products.product_id, rel_suppliers_products.supplier_id as rel_supplier_id, suppliers.* FROM rel_suppliers_products INNER JOIN suppliers ON rel_suppliers_products.supplier_id=suppliers.supplier_id AND suppliers.supplier_id=$supplierId AND suppliers.visible='1') as prevSqlQuery";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    return $res[0]['COUNT(*)'];
}

