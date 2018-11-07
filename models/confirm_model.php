<?php defined("CATALOG") or die("Access denied");

//достаем данные для формы оформления заказа
function info_form_auth(){
    //если пользователь авторизован
    if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'yes_auth'){
        $_SESSION['cart']['cart_id'] = $_SESSION['auth_id'];
        $_SESSION['cart']['cart_name'] = $_SESSION['auth_name'];
        $_SESSION['cart']['cart_phone'] = $_SESSION['auth_phone'];
        $_SESSION['cart']['cart_email'] = $_SESSION['auth_email'];
        $_SESSION['cart']['cart_address'] = $_SESSION['auth_address'];
    }
}

function confirm_type_1($personal_info){
    $err = [];//для хранения ошибок
    //проверяем существования для пользователя
    if(isset($personal_info['id']))
    {
        $_SESSION['cart']['cart_id'] = $personal_info['id'];
    }

    $user_name = clear_string($personal_info['name']);
    $user_phone = clear_string($personal_info['phone']);
    $user_email = clear_string($personal_info['email']);

    //проверяем данные
    if(strlen($user_name) < 3 || strlen($user_name) > 20){
        $err[] = "The name field must not be empty (3-25 characters)!";
    }

    if(strlen($user_phone) < 8 || strlen($user_phone) > 80){
        $err[] = "The phone field must not be empty! Matches: 1-(123)-123-1234 | 123 123 1234 | 1-800-ALPHNUM!";
    }

    if(!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i",trim($user_email)))
    {
        $err[]='The e-mail field must not be empty!';
    }

    if(!empty($err)){
        $_SESSION['message']['error'] = implode('<br/>',$err);
        $data = ['response'=>false, 'mess'=>$_SESSION['message']['error']];
        return $data;
    }

    $_SESSION['cart']['cart_name']  = $user_name;
    $_SESSION['cart']['cart_phone'] = $user_phone;
    $_SESSION['cart']['cart_email'] = $user_email;

    //заполняем массив данных
    $data = ['response'=>'true','user_name'=>$user_name, 'user_phone'=>$user_phone, 'user_email'=>$user_email];
    return $data;
}

function confirm_type_2($personal_info){
    $err=[];//для хранения ошибок

    $user_address = clear_string($personal_info['cart_address']);
    $user_note = clear_string($personal_info['note']);
    $user_delivery = (int)clear_string($personal_info['delivery']);
    $user_zipcode = (int)clear_string($personal_info['zipcode']);

    if(strlen($user_address) < 5 ){
        $err[] = "Address min 5 characters";
    }

    if($user_delivery == 0){
        $err[] = "Delivery  is empty!";
    }
    if(!isset(checkZipCode($user_zipcode)->postalCode)){
        $err[]= "Zip code: " . $user_zipcode . " - not correct!";
    }


    if(!empty($err)){
        $_SESSION['message']['error'] = implode('<br/>',$err);
        $data = ['response'=>false, 'mess'=>$_SESSION['message']['error']];
        return $data;
    }

    $_SESSION['cart']['cart_address']  = $user_address;
    $_SESSION['cart']['cart_note']     = $user_note;
    $_SESSION['cart']['cart_delivery'] = $user_delivery;
    $_SESSION['cart']['cart_zipcode'] = $user_zipcode;

    $data = ['response'=>'true', 'user_address'=>$user_address, 'user_delivery'=>$user_delivery, 'user_note'=>$user_note, 'user_zipcode'=>$user_zipcode, 'user_name'=>$_SESSION['cart']['cart_name'], 'user_phone'=>$_SESSION['cart']['cart_phone'], 'user_email'=>$_SESSION['cart']['cart_email']];
    return $data;
}

function confirm_type_3($personal_info){
    $err=[];//для хранения ошибок
    //$user_pay = (int)clear_string($personal_info['pay']);
    if(!empty($err)){
        $_SESSION['message']['error'] = implode('<br/>',$err);
        header("Location: /checkout?personal=detail");
        exit();
    }

    $_SESSION['cart']['cart_pay'] = '0';

    $data = ['response'=>'true'];
    return $data;
}

function res_confirm(){
    $err=[];
    if(empty($err)){
        //подключаемся к бд и записываем данные о ордере
        global $link;
        $result = mysqli_query($link, "SELECT * FROM cart, products WHERE cart.cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND products.id = cart.cart_id_product");
        //var_dump(mysqli_num_rows($result)); exit;

        if(mysqli_num_rows($result) > 0){
            $order_list=[];
            while($row = mysqli_fetch_assoc($result)){
                $order_list[] = $row;
            }

            $order_list['total_qty'] = 0;//общее кол-во купленного товара
            $order_list['total_sum'] = 0;//общая сумма купленного товара

            for($i = 0, $count = count($order_list); $i < $count; $i++ ){
                if (isset($order_list[$i]['price'])){
                    $total_value = $order_list[$i]['price'] * $order_list[$i]['cart_count'];
                    $order_list[$i]['total_value'] = $total_value;
                    $order_list['total_qty'] += $order_list[$i]['cart_count'];
                    $order_list['total_sum'] += $total_value;
                }
            }
            $total_qty_order = $order_list['total_qty'];
            $total_sum_order = $order_list['total_sum'];

        } else{
            //echo 'Ошибка при поиске товаров в корзине для пользователя';
            $data = ['response'=>'false','message'=>'err_bd'];
            return $data;
        }

        $user_name     = $_SESSION['cart']['cart_name'];
        $user_phone    = $_SESSION['cart']['cart_phone'];
        $user_email    = $_SESSION['cart']['cart_email'];
        $user_address  = $_SESSION['cart']['cart_address'];
        $user_delivery = $_SESSION['cart']['cart_delivery'];
        $user_note     = $_SESSION['cart']['cart_note'];
        $user_pay      = $_SESSION['cart']['cart_pay'];
        $user_zipcode  = $_SESSION['cart']['cart_zipcode'];
        $user_rate     = $_SESSION['cart']['cart_rate'];


        $query = "INSERT INTO `orders`( `created_at`, `updated_at`, `qty`, `sum`, `status`, `name`, `email`, `phone`, `address`, `zipcode`, `rate_sum`,  `delivery`, `type_pay`, `pay`, `note`) VALUES(
                                            NOW(),
                                            NOW(),
                                            '$total_qty_order',
                                            '$total_sum_order',
                                            '0',
                                            '$user_name',
                                            '$user_email',
                                            '$user_phone',
                                            '$user_address',
                                            '$user_zipcode',
                                            '$user_rate',
                                            '$user_delivery',
                                            '$user_pay',
                                            '0',
                                            '$user_note')";
        //echo $query; exit;

        $result = mysqli_query($link, $query );
        if($result){
            $_SESSION['order_user_id'] ='';
            $_SESSION['order_user_id'] = mysqli_insert_id($link);

            //вырезаем два последних значения
            $total_sum_order_old = array_pop($order_list);
            $total_qty_order_old = array_pop($order_list);

            for($i=0, $list = count($order_list); $i < $list; $i++ ){
                //var_dump($order_list);
                global $link;
                $result = mysqli_query($link, "INSERT INTO  `order_items`(`order_id`, `product_id`, `title`, `price`, `qty_item`, `sum_item`, `order_supplier`,  `article_number`)VALUES(
                '".$_SESSION['order_user_id']."',
                '".$order_list[$i]['cart_id_product']."',
                '".$order_list[$i]['title']."',
                '".$order_list[$i]['price']."',
                '".$order_list[$i]['cart_count']."',
                '".$order_list[$i]['cart_count'] * $order_list[$i]['cart_price']."',
                '".$order_list[$i]['cart_id_supplier']."',
                '".$order_list[$i]['article']."')");
            }
            if($result){
                //Формируем письмо пользователю с его покупкой
                $message='';
                require_once "mail/template/order.php";
                $to = $user_email;
                $subject = "You order '".SITE_NAME."' Номер заказа № '".$_SESSION['order_user_id']."' ";
               //$message .= 'Тестирование';
                $headers  = "Content-type: text/html; charset=utf-8 \r\n"; //Кодировка письма
                $headers .= "From: ZUPPLYBOX <support@zupplybox.com>\r\n"; //Наименование и почта отправителя
                $send_mail = mail($to, $subject, $message, $headers); //Отправка письма с помощью функции mail
                //ob_clean();
                if(!$send_mail){
                    $data = ['response'=>'false','message'=>'err_mail'];
                    return $data;
                }

                //Очищаем корзину заказов для пользователя который подтвердил заказ
                $result = mysqli_query($link, "DELETE FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}'");
                if($result){
                    $data = ['response'=>'true','message'=>'Thank you for choosing. Our manager will call you back.'];
                    return $data;

                }else{
                    $data = ['response'=>'false','message'=>'Err dell product from cart!'];
                    return $data;
                }
            }

        }else{
            $data = ['response'=>'false','message'=>'Err add order buy!'];
            return $data;
        }
    }

}

//достаем данные о доставке
function delivery_system(){
    $delivery_item = [];
    global $link;
    $result = mysqli_query($link, "SELECT * FROM delivery ORDER BY position DESC ");
    if($result){
        while($row = mysqli_fetch_assoc($result)){
            $delivery_item[] = $row;
        }
        return $delivery_item;
    }else{
        echo "Ошибка при поиске доступных видов доставки";
        exit;
    }
}

//достаем данные для оплаты
function pay_system(){
    $pay_item = [];
    global $link;
    $result = mysqli_query($link, "SELECT * FROM pay_form ORDER BY position ASC ");
    if($result){
        while($row = mysqli_fetch_assoc($result)){
            $pay_item[] = $row;
        }
        return $pay_item;
    }else{
        echo "Ошибка при поиске методов оплаты!";
        //exit();
    }
}