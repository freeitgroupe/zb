<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "controllers/lk_controller.php";
require_once "models/{$view}_model.php";

if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'yes_auth') {
    //id пользователя
    $id = (int)$_SESSION['auth_id'];
    $email = $_SESSION['auth_email'];
    $pages_id = (int)$match['pages_id'];
    if(!$pages_id) {
        header("Location: /orders");
    }
    //Заголовки
    $title_header .= 'Order - ' . $pages_id;
    $description_header .= strip_tags(str_replace("\"","&quot;", 'Orders'));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", 'Orders'));

    //если нет фильтрации
    if(!isset($_SESSION['filter'])){
        $_SESSION['filter'] = NULL;
        $_SESSION['direction'] = NULL;
    }

    //-> При наличии пост данных при фильтрации
    if(isset($_POST['filter'])){
        $_SESSION['filter'] = clear_string($_POST['filter']);
        $_SESSION['direction'] = clear_string($_POST['direction']);
        json_encode(exit('true'));
    }


    //Заказы пользователя полная информация
    $all_orders_user_items = all_orders_user_items($email, $pages_id,$_SESSION['filter'], $_SESSION['direction']);
    if(!$all_orders_user_items){
        //header("Location: /orders");
        //exit;
    }
    //debug_arr($all_orders_user_items);
    //для формрования рейтинга по id товара, и общей суммы по ордеру
    foreach ($all_orders_user_items as $k=>$v){
        $all_orders_user_items[$k]['rating_param'] = product_rating($v['product_id']);
    }
    count($all_orders_user_items) > 0 ? $total_order = $all_orders_user_items[0]['sum']:'';
    //$total_order = $all_orders_user_items[0]['sum'];

    //debug_arr($all_orders_user_items);
    //$product_id=$all_orders_user_items['product_id'];
    //рейтинг продукта
    //$product_rating = product_rating($product_id);

    //exit;
    //распределение ордеров по статусам//

    //Ожидают обработки = 0
    //$orders_wait = orders_wait( $all_orders_user_items);

    //Обработанные статус = 1
    //$orders_confirm = orders_confirm( $all_orders_user_items);

    //2 подстатуса отправлен//
    //Отправленные статус 2
    //$orders_confirm_sent = orders_confirm_sent( $all_orders_user_items);
    //Доставленные статус 3
    //$orders_confirm_delivered = orders_confirm_delivered($all_orders_user_items);

    //Предзаказ статус = 5
    //$orders_pre_order = orders_pre_order( $all_orders_user_items);

    //Отмененные статус = 4
    //$orders_abort = orders_abort($all_orders_user_items);

    require_once "views/office/{$view}.php";

} else{header("Location: /");}
