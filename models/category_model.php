<?php
defined("CATALOG") or die("Access denied");

/**
 * Получение ативной категории
 **/
function get_category_active($id_category){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM category WHERE id = $id_category");
    if($result){
        $row = mysqli_fetch_assoc($result);
    }else{
        echo "Ошибка получения категории";
    }
    return $row;
}

/**
 * Обновление кол-во просмотра категорий
 **/
function getCountViewCategory($id){
    $category_id = (int)$id;
    if(!isset($_SESSION['count_category_id'])) $_SESSION['count_category_id'] = '0';
    if($category_id != $_SESSION['count_category_id']){
        $res = findOneParam('category', 'id', $category_id);
        $new_count = $res['category_views'] + 1;
        $resUpdate = Model_Driver::get_instance()->update('category', ['category_views'], [$new_count], ['id'=>$category_id]);
        if(!$resUpdate) {
            my_log('Error update category_views in category;');
            exit;
        }
        return $_SESSION['count_category_id'] = $res['id'];
    }
}

/**
 * Получение товаров
 **/
function get_products($ids, $start_pos, $perpage, $warehouse_id){
    global $link;
    //$query = "SELECT `rel_warehouse_product`.*, `products`.* FROM `rel_warehouse_product` LEFT JOIN `products` ON `rel_warehouse_product`.product_id = `products`.id WHERE `rel_warehouse_product`.warehouse_id ={$warehouse_id} AND `products`.mark_view='1' AND category_id IN($ids) ORDER BY title LIMIT $start_pos, $perpage";
    if($ids){
        $query = "SELECT `rwp`.id AS rel_warehouse_id, `rwp`.product_id, `rwp`.warehouse_price,`rwp`.warehouse_tax, `rwp`.warehouse_discount, `rwp`.warehouse_stock, `rwp`.warehouse_count,  `products`.* FROM `rel_warehouse_product` AS rwp LEFT JOIN `products` ON `rwp`.product_id = `products`.id WHERE `rwp`.warehouse_id ={$warehouse_id} AND `products`.mark_view='1' AND category_id IN($ids) ORDER BY title LIMIT $start_pos, $perpage";
        //$query = "SELECT * FROM products WHERE mark_view = '1' AND category_id IN($ids) ORDER BY title LIMIT $start_pos, $perpage";
    }else{
        $query = "SELECT `rwp`.id AS rel_warehouse_id, `rwp`.product_id, `rwp`.warehouse_price,`rwp`.warehouse_tax, `rwp`.warehouse_discount, `rwp`.warehouse_stock, `rwp`.warehouse_count,  `products`.* FROM `rel_warehouse_product` AS rwp LEFT JOIN `products` ON `rwp`.product_id = `products`.id WHERE `rwp`.warehouse_id ={$warehouse_id} AND `products`.mark_view='1' AND ORDER BY title LIMIT $start_pos, $perpage";
    }
    //echo $query;
    $res = mysqli_query($link, $query);
    if(!$res) return false;
    $products = array();
    while($row = mysqli_fetch_assoc($res)){
        $products[] = $row;
    }
    return $products;
}

/**
 * Кол-во товаров
 **/
function count_goods($ids, $warehouse_id){
    global $link;
    if( !$ids ){
        $query = "SELECT COUNT(*) FROM (SELECT `rwp`.id AS rel_warehouse_id, `rwp`.product_id, `rwp`.warehouse_price,`rwp`.warehouse_tax, `rwp`.warehouse_discount, `rwp`.warehouse_stock, `rwp`.warehouse_count,  `products`.* FROM `rel_warehouse_product` AS rwp LEFT JOIN `products` ON `rwp`.product_id = `products`.id WHERE `rwp`.warehouse_id ={$warehouse_id} AND `products`.mark_view='1') AS all_products";
    }else{
        $query = "SELECT COUNT(*) FROM (SELECT `rwp`.id AS rel_warehouse_id, `rwp`.product_id, `rwp`.warehouse_price,`rwp`.warehouse_tax, `rwp`.warehouse_discount, `rwp`.warehouse_stock, `rwp`.warehouse_count,  `products`.* FROM `rel_warehouse_product` AS rwp LEFT JOIN `products` ON `rwp`.product_id = `products`.id WHERE `rwp`.warehouse_id ={$warehouse_id} AND `products`.mark_view='1' AND category_id IN($ids)) AS all_products";
    }
    $res = mysqli_query($link, $query);
    $count_goods = mysqli_fetch_row($res);
    return $count_goods[0];
}

/**
 *  подгрузка контента при нажатии на кнопку подгрузки товара
 **/
function page_product_response($num_page_product, $ids){
    global $link;
    $query = "SELECT * FROM products  WHERE mark_view = '1' AND category_id IN($ids) LIMIT $num_page_product, ".PERPAGE." ";
    $result = mysqli_query($link,$query);
    if(!$result) return false;
    $arr=[];
    while($row = mysqli_fetch_assoc($result)){
       $arr[]=$row;
    }
    return $arr;
}

