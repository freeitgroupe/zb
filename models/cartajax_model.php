<?php
/**
 * Добавление товара в корзину
 **/
function add_to_cart_product($id, $suppliersId=NULL){
    global $link;
    //$result = Model_Driver::get_instance()->select('*', 'products', ['id'=>$id]);
    $result = mysqli_query($link, "SELECT * FROM products WHERE id = $id");
    if (!mysqli_num_rows($result)) return false;
    //формируем куку c идентификатором для пользователя
    $keyFromCookie = createCookieForBuyer();
    //var_dump($keyFromCookie); exit;
    //Если пользователь авторизован берем id
    $user_id = isset($_SESSION['auth_id']) ? $_SESSION['auth_id'] : NULL;
    $row = mysqli_fetch_array($result);
    $query ="INSERT INTO cart(cart_id_product, cart_id_supplier,cart_price,cart_datetime,cart_ip, cookie_key, user_id) VALUES('" . $row['id'] . "','" . $suppliersId . "','" . $row['price'] . "',NOW(),'" . $_SERVER['REMOTE_ADDR'] . "', '". $keyFromCookie ."', '". $user_id ."')";
    $res = mysqli_query($link, $query);
    if (!$res) return false;
    return true;
}

/**
 * Информация о количестве товара в корзине для пользователя
 **/
function cart_info(){
    $num_rows = '';
    global $link;
    $result = mysqli_query($link, "SELECT * FROM cart,products WHERE cart.cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND products.id = cart.cart_id_product");

    if (mysqli_num_rows($result) > 0){
        $num_rows = mysqli_num_rows($result);
        //Общее количество товара
        $count = 0;
        //Общая сумма товара
        $int = 0;
        //Массив с информация о каждом товаре id, title, count
        $info_cart = [];
        //Массив с ответом
        $res =[];

        for($i = 0; $i < $num_rows; $i++){
            $row[$i] = mysqli_fetch_assoc($result);
            $count = $count + $row[$i]["cart_count"];
            $int = $int + ($row[$i]["price"] * $row[$i]["cart_count"]);
            $info_cart[$i]['id'] = $row[$i]['cart_id_product'];
            $info_cart[$i]['title'] = $row[$i]['title'];
            $info_cart[$i]['count'] = $row[$i]['cart_count'];
            $info_cart[$i]['alias'] = $row[$i]['alias'];
            $info_cart[$i]['price'] = $row[$i]['price'];
        }
        echo json_encode($res = ['count'=>$count , 'int' => $int, 'product_info_res' => $info_cart]);
        exit();
    }
    else{
        echo json_encode('0'); exit;
    }
}

/**
 * Пересчитываем товар в корзине пользователя
 **/
function order_list_recalc($id, $param, $quantity='', $cookie_key = NULL, $user_id = NULL){

    $id = clear_string($id);
    $param = clear_string($param);
    global $link;
    $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id_product = '$id'");
    if (mysqli_num_rows($result) > 0){

        if($param == 'clear')
        {
            $result = mysqli_query($link, "DELETE FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}");
            if($result)
            {
                echo json_encode('true');
                exit;
            }
        }
        //Удаление товара из корзины
        if($param == 'delete')
        {
            $result = mysqli_query($link, "DELETE FROM cart WHERE cart_id_product = '$id' AND cart_ip = '{$_SERVER['REMOTE_ADDR']}'");
            if($result)
            {
                echo json_encode('true'); exit;
            }
        }

        //Прибавление товара по кнопке +
        if($param == 'plus')
        {
            global $link;
            $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
            if (mysqli_num_rows($result) > 0)
            {
                $row = mysqli_fetch_array($result);
                $new_count = $row["cart_count"] + 1;

                $update = mysqli_query($link, "UPDATE cart SET cart_count='$new_count', cart_datetime = NOW() WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id ='$id'");

                if($update){ echo $new_count; exit;}
                else{ echo "Ошибка прибавления товара";}
            }
        }

        //Уменьшение товара в корзине по кнопке -
        if($param == 'minus')
        {
            global $link;
            $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
            if (mysqli_num_rows($result) > 0)
            {
                $row = mysqli_fetch_array($result);
                $cart_count = (int)$row["cart_count"];

                if( $cart_count < 2 )
                {
                    echo $cart_count; exit;
                }
                $new_count =  $cart_count - 1;

                $update = mysqli_query($link, "UPDATE cart SET cart_count='$new_count', cart_datetime = NOW() WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id ='$id'");

                if($update)
                {
                    echo $new_count; exit;
                }
                else
                {
                    echo "Ошибка при уменьшении товара в корзине";
                }
            }
        }

        //Ручной ввод количества товара
        if($param == 'quantity')
        {
            $old_count='';

            global $link;
            $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
            if (mysqli_num_rows($result) > 0)
            {
                $quantity = (int)$quantity;
                $row = mysqli_fetch_array($result);
                $old_count = (int)$row["cart_count"];

                if($quantity > 0 && $quantity < 99)
                {
                    $update = mysqli_query($link, "UPDATE cart SET cart_count='$quantity', cart_datetime = NOW() WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id ='$id'");
                    if($update)
                    {
                        echo $quantity;
                        exit();
                    }
                    else
                    {
                        echo 'Ошибка обновления количества товара';
                        exit();
                    }
                }
                else
                {
                    echo $old_count; exit();
                }

            }
        }

    }
    else
    {
        return false;
    }
}

function updateCountProductInCart($id, $user_ip, $count, $cookie_key = '', $user_id = ''){
    $count = (int)$count;
    $query = "UPDATE cart SET cart_count = cart_count + 1,  cart_datetime = NOW() WHERE cart_ip = '$user_ip' AND cart_id_product = $id AND (cookie_key = '{$cookie_key}' OR user_id = {$user_id})";
    //echo $query;
    $res = Model_Driver::get_instance()->sqlQuery($query, 'true');
    if(!$res) return false;
    return true;
}