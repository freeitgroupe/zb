<?php
defined("CATALOG") or die("Access denied");

//все заказы пользователя
function all_orders_user($email, $filter, $direction){
    $obj_db = Model_Driver::get_instance();
    $query="SELECT `orders`.*, `order_status`.title AS param_status_title, `order_status`.param_status FROM `orders` LEFT JOIN `order_status` ON `orders`.status=`order_status`.param_status WHERE `orders`.email='{$email}'";
    if(!empty($filter)){
        if($direction == 2){
            $direction = 'DESC';
        }else{
            $direction = 'ASC';
        }
        $query .= " ORDER BY ".$filter." ".$direction;
    }
    $result = $obj_db->sqlQuery($query);
    if(!$result) return false;
    return $result;
}

//Ожидают обработки заказы или в работе статус 0
function orders_wait($all_orders_user_items){
    if(!$all_orders_user_items) return false;
    $arr=[];
    for($i=0, $count=count($all_orders_user_items); $i<$count; $i++){
        if($all_orders_user_items[$i]['status'] == 0){
            $arr []= $all_orders_user_items[$i];
        }
    }
    return $arr;
}

//Обработанные(Оформлен) статус 1
function orders_confirm($all_orders_user_items){
    if(!$all_orders_user_items) return false;
    $arr=[];
    for($i=0, $count=count($all_orders_user_items); $i<$count; $i++){
        if($all_orders_user_items[$i]['status'] == 1){
            $arr []= $all_orders_user_items[$i];
        }
    }
    return $arr;
}

//Отправленные статус 2
function orders_confirm_sent($all_orders_user_items){
    if(!$all_orders_user_items) return false;
    $arr=[];
    for($i=0, $count=count($all_orders_user_items); $i<$count; $i++){
        if($all_orders_user_items[$i]['status'] == 2){
            $arr []= $all_orders_user_items[$i];
        }
    }
    return $arr;
}

//Доставленные статус 3
function orders_confirm_delivered($all_orders_user_items){
    if(!$all_orders_user_items) return false;

    $arr=[];

    for($i=0, $count=count($all_orders_user_items); $i<$count; $i++){
        if($all_orders_user_items[$i]['status'] == 3){
            $arr []= $all_orders_user_items[$i];
        }
    }
    return $arr;
}

//Отмененные статус 4
function orders_abort($all_orders_user_items){
    if(!$all_orders_user_items) return false;
    $arr=[];
    for($i=0, $count=count($all_orders_user_items); $i<$count; $i++){
        if($all_orders_user_items[$i]['status'] == 4){
            $arr []= $all_orders_user_items[$i];
        }
    }
    return $arr;
}

//предзаказ статус 5
function orders_pre_order( $all_orders_user_items){
    if(!$all_orders_user_items) return false;
    $arr=[];
    for($i=0, $count=count($all_orders_user_items); $i<$count; $i++){
        if($all_orders_user_items[$i]['status'] == 5){
            $arr []= $all_orders_user_items[$i];
        }
    }
    return $arr;
}

