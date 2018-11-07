<?php
defined("CATALOG") or die("Access denied");

//получение списка желаний юзера
function wishlist_user($id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'wishlist', ['user_id'=>$id]);
    //проверяем запрос
    if(!$result) {
        return false;
    }
    //возвращаем результат в виде массива
    return $result;
}

//создаем новый лист желаний для юзера
function created_new_wish_list($name_wishlist, $user_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->insert('wishlist',['title','user_id'], [$name_wishlist,$user_id]);
    if (!$result) return false;
    if($result) return mysqli_insert_id($obj_db->ins_db);

}

//добавляем продукт лист желаний
function created_new_wish_users($wish_id, $id, $product_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->insert('wish_users',['wish_id','user_id', 'product_id'], [$wish_id, $id,$product_id]);
    if (!$result) return false;
    if($result) return true;
}

//Проверяем наличие продукта в листе желаний юзера
function findOneProductInWishusers($product_id, $id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'wish_users', ['product_id' => $product_id, 'user_id'=>$id]);
    if (!$result) return false;
    if($result) return true;
}

//Проверяем колличества товара в листе желаний
function countProdInWishList($id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'wish_users', ['user_id'=>$id]);
    if (!$result) return false;

    if ($result){
        $count='';
        $id_select_products_string = '';
        $id_select_products_wish_list = [];//Выбранный товар пользователем
        for($i = 0; $i < count($result); $i++){
            $id_select_products_wish_list[$i] = $result[$i]['product_id'];
            $id_select_products_string .= $result[$i]['product_id'] .',';
        }
        $count = count($result);

        $id_select_products_string = substr($id_select_products_string,0,-1);
        $query="SELECT * FROM products WHERE id IN($id_select_products_string)";
        //echo $query;
        $res_prod = $obj_db->sqlQuery($query);
        if (!$result) return false;
        //var_dump($count);exit;
        $res = ['count'=>$count, 'id_select_products_wish_list' => $id_select_products_wish_list, 'id_select_products_string'=>$res_prod ];
        return $res;

    }

}

//Удаления листа желаний пользователя
function deleted_wishlist($id_wishlist, $id=false, $product_id){
    $err = [];
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('wishlist',['id'=>$id_wishlist],['=']);
    if(!$result) $err[] = 'Ошибка при удалении листа желаний';
    //проверяем есть ли продукты в листе желаний
    if(findOneProductInWishusers($product_id, $id)){
        $result_1 = deleted_wishlist_users($id_wishlist, $id=false, $product_id);
        if(!$result) $err[] = 'Ошибка при удалении продукта из листа желаний';
    }
    if(!empty($err)) return $err;
    return true;
}

//Удаление товара из листа желаний пользователя
function deleted_wishlist_users($id_wishlist, $id=false, $product_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('wishusers',['wish_id'=>$id_wishlist, 'product_id'=>$product_id],['=']);
    if(!$result) return false;
    return true;
}



















