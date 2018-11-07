<?php
defined("CATALOG") or die("Access denied");

//подробная информация о заказе пользователя
function all_orders_user_items($email, $pages_id, $filter, $direction){
    global $link;
    $query = "SELECT order_items.*, orders.*,products.id, products.title AS title_product, products.image, products.alias, order_status.title AS title_order_status, order_status.param_status FROM order_items INNER JOIN (SELECT * FROM orders WHERE email = '{$email}')orders ON order_items.order_id = orders.id INNER JOIN products ON order_items.product_id = products.id LEFT JOIN order_status ON orders.status = order_status.param_status WHERE order_id={$pages_id}";

    if($filter){
        if(!empty($filter)){
            if($direction == 2){
                $direction = 'DESC';
            }else{
                $direction = 'ASC';
            }
            $query .= " ORDER BY ".$filter." ".$direction;
        }
    }
    //echo $query;
    $result = mysqli_query($link, $query);
    if(!$result) return false;
    $order_list=[];
    while($row = mysqli_fetch_assoc($result)){
        $order_list[]=$row;
    }
    return  $order_list;
}

