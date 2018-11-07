<?php
defined("CATALOG") or die("Access denied");

//достаем информацию о заказе от пользователя
function get_one_orders_admin($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db -> select(['*'], 'orders', ['id'=>$pages_id]);
    if(!$result) return false;
    return $result[0];
}

//достаем метод платежа
function title_pay($id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db -> select(['title'], 'pay_form', ['id'=>$id]);
    if(!$result) return 'Уточните способ оплаты';
    return $result[0]['title'];
}

//достаем имя доставки
function title_delivery($id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db -> select(['title'], 'delivery', ['id'=>$id]);
    if(!$result) return 'Уточните способ доставки';
    return $result[0]['title'];
}

//достаем имя статуса пользователя
function title_type_user($id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db -> select(['title'], 'users_group', ['role'=>$id]);
    if(!$result) return 'Такой статус не найден';
    return $result[0]['title'];
}

//достаем информацию о товарах для заказа
function get_one_orders_product_info($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db -> select(['*'], 'order_items', ['order_id'=>$pages_id]);
    if(!$result) return true;
    return $result;
}


