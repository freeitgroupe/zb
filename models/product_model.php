<?php
defined("CATALOG") or die("Access denied");
/**
 * Получение отдельного товара
 **/
function get_one_product($product_id){
    global $link;
    $query = "SELECT * FROM products WHERE id = $product_id AND mark_view = '1'";
    $res = mysqli_query($link, $query);
    if(mysqli_num_rows($res) == 0){
        header("Location: /category");
        exit();
    }
    return mysqli_fetch_assoc($res);
}

/**
 * Формируем количество просмотров товара
 **/
function get_count_view($product_id){

    $product_id = (int)$product_id;

    if(!isset($_SESSION['count_id'])){$_SESSION['count_id'] = '0';}

    if($product_id != $_SESSION['count_id'])
    {
        global $link;
        $query_count = mysqli_query($link, "SELECT page_views FROM products WHERE id='$product_id'");
        $row = mysqli_fetch_array($query_count);
        //var_dump($row);
        $new_count = $row['page_views'] + 1;

        $update = mysqli_query($link, "UPDATE products SET page_views = '$new_count' WHERE id ='$product_id'");

        if (!$update) {
            echo 'Ошибка обновления количества просмотров';
            exit();
        }

        $_SESSION['count_id'] = $product_id;
    }

}

//формирование листа просмотренных товаров в базе
function watch_list_user($product_id){
    $product_id = (int)$product_id;
    if(!$product_id) return false;

    if(!isset($_SESSION['watch_list_id'])){$_SESSION['watch_list_id']='';}

    if($_SESSION['watch_list_id'] != $product_id)
    {
        $_SESSION['watch_list_id'] = $product_id;
        $obj_db = Model_Driver::get_instance();

        $res = $obj_db ->select(['count(*)'], 'watch_list', ['watch_ip' => $_SERVER['REMOTE_ADDR'], 'watch_product_id'=>$_SESSION['watch_list_id']]);
        //debug_arr($res[0]['count(*)']);
        $new_date = date('Y-m-d H:i:s',time());
        if($res[0]['count(*)'] > 0)
            {
                $res = $obj_db->update('watch_list', ['watch_date'],[$new_date], ['watch_product_id'=>$_SESSION['watch_list_id']]);
                if(!$res) return false;
            }
        else
            {
                $res = $obj_db->insert('watch_list', ['watch_product_id','watch_ip', 'watch_date'], [$_SESSION['watch_list_id'], $_SERVER['REMOTE_ADDR'], $new_date]);
                if(!$res) return false;
            }
    }
}

// возвращаем по ip список просмотренных товаров пользователя
function get_watch_list($user_ip, $product_id=''){
    global $link;
    $query = "SELECT `watch_product_id` FROM `watch_list` WHERE `watch_ip` = '$user_ip' ORDER BY `watch_date` DESC LIMIT 5";
    //echo $query;
    $res = mysqli_query($link, $query);
    if(!$res) return false;
    $prod_id = '';
    while($row = mysqli_fetch_assoc($res))
    {
        if($product_id == $row['watch_product_id']) continue;
        $prod_id .= $row['watch_product_id'] . ',';
    }
    $prod_id = substr($prod_id, 0, -1);
    //debug_arr($prod_id);
    $query = "SELECT * FROM `products` WHERE `mark_view`='1' AND `id` IN($prod_id)";
    //echo $query;
    $res = mysqli_query($link, $query);
    if(!$res) return false;
    $prod_arr = [];
    while($row = mysqli_fetch_assoc($res))
    {
        $prod_arr[]= $row;
    }
    //debug_arr($prod_arr);
    return $prod_arr;
}

/**
 * Получения бонусов для продкта
 **/
function get_bonuses($id_bns =''){
    global $link;
    $result=mysqli_query($link, "SELECT * FROM bonuses WHERE id='$id_bns'");
    if($result){
        return mysqli_fetch_assoc($result);
    }else{
        $_SESSION['message']['error'] = "Ошибка при выборке данных о акциях для продукта";
        header("Location: /product");
        exit();
    }
}

/**
 * Получения статуса продукта
 **/
function get_product_status($id_sts =''){
    global $link;
    $result=mysqli_query($link, "SELECT * FROM product_status WHERE id='$id_sts'");
    if($result){
        return mysqli_fetch_assoc($result);
    }else{
        $_SESSION['message']['error'] = "Ошибка при выборке данных о статусе продукта";
        header("Location: /product");
        exit();
    }
}

/**
 * Получения сопутствующих товаров для продукта
 */
function get_related_additions($product_id){
    $related_additions = [];
    global $link;
    $query = "SELECT `additions_products`.*,`products`.id, `products`.alias, `products`.title, `products`.image, `products`.price, `products`.stock_id,`products`.upsell_product   FROM `additions_products` INNER JOIN `products` ON `additions_products`.related_additions_id = `products`.id WHERE `products`.mark_view = '1' AND `additions_products`.product_id ='$product_id'";
    //echo $query;
    $result = mysqli_query($link, $query);

    if(mysqli_num_rows($result) > 0){

        while($row = mysqli_fetch_assoc($result)){
            $related_additions[] = $row;
        }
        return $related_additions;

    }else{
        return false;
    }

}

/**
 * Вывод комментариев для товара
 */
function get_comments($id, $count = false){
    $id = (int)$id;
    $comments = [];
    global $link;
    $sql ="SELECT * FROM comments WHERE comment_product_id='$id' AND approved='1'";

    $sql .= "";

    if($count > false ){
        $count=(int)$count;
        $sql .= " LIMIT 0,". $count;
    }else{
        $sql .= " LIMIT 0, ".COUNT_COMM."";
    }


    $result = mysqli_query($link, $sql);

    if($result){
        while($row = mysqli_fetch_assoc($result)){
            $comments[$row['id']] = $row;
            $arr = [];
            if(isset($comments[$row['id']]['photo']) && $comments[$row['id']]['photo'] != '') {
                $vr_arr = explode('/', $comments[$row['id']]['photo']);
                for ($i = 0, $count = count($vr_arr); $i < $count; $i++) {
                    if ($vr_arr[$i] != '') {
                        $arr[] = $vr_arr[$i];
                    }
                }
                $comments[$row['id']]['photo'] = $arr;
            }
        }
        return $comments;
    }else{
        echo "Ошибка при поиске данных";exit();
    }
}

/**
 * Подсчитіваем кол-во комментариев
 */
function count_comments($id){
    $id = (int)$id;
    global $link;
    $result = mysqli_query($link, "SELECT COUNT(*) as count FROM comments WHERE comment_product_id='$id' AND approved='1'");
    //var_dump(mysqli_fetch_assoc($result));
    $count = mysqli_fetch_assoc($result);
    return (int)$count['count'];
}

/**
 * Обработка пользовтаельских комментариев
 */
function comment_add($post){
    $errors = [];
    //Обработка постданных от пользователя
    if(!empty($_POST)){
        $_SESSION['comment_user']='';
        //Получаем пользовательские данные
        $user_name = clear_string($post['author_name']);
        $user_email = clear_string($post['author_email']);
        $comment_text = clear_string($post['comment_text']);
        $comment_good = clear_string($post['comment_good']);
        $comment_bad = clear_string($post['comment_bad']);
        $parent_comment = (int)clear_string($post['parent_comment']);
        $product_id = (int)clear_string($post['product_id']);

        //проверяем данные
        if(strlen($user_name) < 3 || strlen($user_name) > 20){
            $errors[] = "The name must contain between 3 and 20 characters!";
        }

        if(!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i",$user_email)){
            $errors[]="Please enter a valid email!";
        }

        if(strlen($comment_text) < 10 || strlen($comment_text) > 250){
            $errors[] = "The review text should contain from 10 to 250 characters!";
        }

        if(strlen($comment_good) > 255){
            $errors[] = "The positive feedback text must contain up to 150 characters!";
        }

        if(strlen($comment_bad) > 255){
            $errors[] = "The negative feedback text must contain up to 150 characters!";
        }

        if(count($errors) > 0){
            echo $_SESSION['message'] = implode('<br/>',$errors);
//            /header("Location: {$_SERVER["HTTP_REFERER"]}");
            exit();
        }

        global $link;
        $result= mysqli_query($link, "INSERT INTO comments(
                    parent, 
                    author_name,
                    author_email, 
                    comment_text, 
                    comment_product_id,
                    comment_good, 
                    comment_bad,                    
                    created_add
                    ) VALUES (
                    '{$parent_comment}', 
                    '{$user_name}',
                    '{$user_email}',
                     '{$comment_text}',
                     '{$product_id}',
                     '{$comment_good}',
                     '{$comment_bad}',
                     NOW())");

        if($result){
            //проверяем переменную с именем изображений           
            if(isset($_SESSION['message'])){
                unset($_SESSION['message']);
            };
            echo "success";
            exit;
        }

        if(!$result){
            echo 'An error occurred while adding data to the database!';
            exit;
        }

    }else{
        $_SESSION['message'] = 'Required fields are not filled!';
        exit();
    }

}

function stringViewSuppliers($arr){
    $res='';
    if(!$arr || count($arr)==0){
        $res = 'not found';
        return $res;
    }
    foreach ($arr as $item){
        $res .= "<a href='/suppliers/{$item['alias']}'>{$item['title']}</a></br>";
    }
    return $res;
}

function countSuppliersProduct($suppliersForOneProduct){
    $res = '('. 0 . ')';
    if(!is_array($suppliersForOneProduct)) return $res;
    $res = '(' . count($suppliersForOneProduct) . ')';
    $res .= ' <a class="view-all-suppliers">View all suppliers</a>';
    return $res;
}


