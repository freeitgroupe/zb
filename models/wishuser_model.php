<?php
defined("CATALOG") or die("Access denied");

//Списки желаний пользователя


//Товары согласно спискам желаний
/*
 * SELECT order_items.*, orders.*, products.*  FROM order_items INNER JOIN (SELECT * FROM orders WHERE email = '{$email}')orders ON order_items.order_id = orders.id INNER JOIN products ON order_items.product_id = products.id
 */
function wishlist_user_product($id){
    global $link;
    $query="SELECT wish_users.*, wishlist.title AS title_wish,  wishlist.default,  products.title AS title_product, products.price, products.alias, products.image FROM wish_users INNER JOIN (SELECT * FROM wishlist WHERE user_id='$id')wishlist ON wish_users.wish_id = wishlist.id INNER JOIN (SELECT  * FROM products WHERE mark_view='1')products ON wish_users.product_id = products.id";
    //echo $query;
    $result = mysqli_query($link, $query);
    if(!$result) return false;
    $arr=[];
    while($row=mysqli_fetch_assoc($result)){
        $arr[] = $row;
    }
    //Формируем упорядоченный массиив листа желаний согласно wish_id
    $trig = 0;
    $res_arr = [];
    for($i=0, $count = count($arr); $i<$count; $i++){
        $res_arr[$arr[$i]['wish_id']][] = $arr[$i];
    }
    return $res_arr;
}

function  wishListUserZeroProduct($wishlist_user, $wishlist_user_product = false){
    $arr=[];
    $y = '';
    if(!$wishlist_user_product)
        return $wishlist_user;
    for($i=0, $count=count($wishlist_user); $i<$count; $i++){
        foreach($wishlist_user_product as $key=>$value){
            if($wishlist_user[$i]['id'] == $key){//
                unset($wishlist_user[$i]);
                break;
            }
        }
    }
    return  $wishlist_user;
}

function  edit_wishlist_edit_res($wishlist_new_name, $edit_wishlist_id, $id){
    $obj_db = Model_Driver::get_instance();
    $search_list = $obj_db->select(['*'], 'wishlist', ['id'=>$edit_wishlist_id, 'user_id'=>$id]);
    if(!$search_list) return false;
    $result = $obj_db->update('wishlist',['title'], [$wishlist_new_name], ['id'=>$edit_wishlist_id]);
    if(!$result) return false;
    return $result;
}

function delete_wishlist_id_res($delete_wishlist_id, $id){
    $obj_db = Model_Driver::get_instance();
    $search_list = $obj_db->select(['*'], 'wishlist', ['id'=>$delete_wishlist_id, 'user_id'=>$id]);
    if(!$search_list) return false;

    $result_del_list = $obj_db->delete('wishlist', ['id'=>$delete_wishlist_id], ['=']);
    if(!$result_del_list) return false;

    $search_list_prod = $obj_db->select(['*'], 'wish_users', ['wish_id'=>$delete_wishlist_id, 'user_id'=>$id]);
    if(!$search_list_prod) return true;

    $result_del_wish_users = $obj_db->delete('wish_users', ['wish_id'=>$delete_wishlist_id], ['=']);
    if(!$result_del_wish_users) return false;

    return true;
}

function delete_wishlist_product_id($product_id, $id){
    $obj_db = Model_Driver::get_instance();
    $search_list_prod_id = $obj_db->select(['*'], 'wish_users', ['product_id'=>$product_id, 'user_id'=>$id]);
    if(!$search_list_prod_id) return false;
    $result_del_product = $obj_db->delete('wish_users', ['product_id'=>$product_id], ['=']);
    if(!$result_del_product) return false;
    return true;
}