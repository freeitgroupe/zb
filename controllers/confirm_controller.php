<?php
defined("CATALOG") or die("Access denied");
//require_once "controllers/main_controller.php";
require_once "models/confirm_model.php";

//Информация о возможностях доставки и оплаты
$delivery = delivery_system();
$pay = pay_system();
//var_dump($_GET);

//сессионные данные для формы при отсутствии авторизации
if(!isset($_SESSION['order'])) {
    $_SESSION['order'] = '';
}

if(!isset($_SESSION['cart'])){
    $_SESSION['cart']['cart_id'] = '';
    $_SESSION['cart']['cart_name'] = '';
    $_SESSION['cart']['cart_phone'] = '';
    $_SESSION['cart']['cart_email'] = '';
    $_SESSION['cart']['cart_address'] = '';
    $_SESSION['cart']['cart_zipcode'] = '';
    $_SESSION['cart']['cart_rate'] = '';
    $_SESSION['cart']['cart_note'] = '';
    $_SESSION['cart']['cart_pay'] = '';
}

//Информация для формы оформления заказа
if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'yes_auth') {
    info_form_auth();
}

$order_list_user = order_list();
$total_sum_order = totalSumQtyArr($order_list_user)['total_sum'];
$total_qty_order = totalSumQtyArr($order_list_user)['total_qty'];

if (MIN_SUM_ORDER <= $total_sum_order):
    //Первый этап оформления заказа
    if(isset($_POST['confirm_type_1'])){
        $personal_info = $_POST;
        //debug_arr($personal_info);exit;
        $confirm_type_1 = confirm_type_1($personal_info);
        //проверка ответа
        if($confirm_type_1 > false)
        {
            exit(json_encode($confirm_type_1));
        }
        else
        {
            exit(json_encode($confirm_type_1));
            header("Location: /checkout?personal=detail");
            exit();
        }
    }
    //Второй этап оформления заказа
    if(isset($_POST['confirm_type_2'])){
        $personal_info = $_POST;
        $confirm_type_2 = confirm_type_2($personal_info);

        if($confirm_type_2['response'] > false)
        {
            $fromZipCode = '44444';
            $ToZipCode = $confirm_type_2['user_zipcode'];
            $_SESSION['cart']['cart_rate'] = rateCount($order_list_user, $total_sum_order, $total_qty_order, $fromZipCode, $ToZipCode);
            $confirm_type_2['rate'] =  $_SESSION['cart']['cart_rate'];
            exit(json_encode($confirm_type_2));
        }
        else
        {
            exit(json_encode($confirm_type_2));
        }
    }
    //Финальный этап оформления заказа
    if(isset($_POST['confirm_type_final'])){

        $personal_info = $_POST;
        $confirm_type_3 = confirm_type_3($personal_info);

        if($confirm_type_3['response'] > false)
        {
            $res_confirm = res_confirm();
            //var_dump($res_confirm);
            if(!$res_confirm['response']){
                exit(json_encode($res_confirm));
            }
            if($res_confirm['response']){
                exit(json_encode($res_confirm));
            }
        }
        else
        {
            header("Location: /checkout?personal=detail");
            exit();
        }
    }
endif;