<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "controllers/lk_controller.php";
require_once "models/{$view}_model.php";

if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'yes_auth') {
    //Заголовки
    $title_header .= 'Your orders';
    $description_header .= strip_tags(str_replace("\"","&quot;", 'Orders'));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", 'Orders'));

    //id пользователя
    $id = (int)$_SESSION['auth_id'];
    $email = $_SESSION['auth_email'];

    //если нет фильтрации
    if(!isset($_SESSION['filter_orders'])){
        $_SESSION['filter_orders'] = NULL;
        $_SESSION['direction_orders'] = NULL;
    }

    //-> При наличии пост данных при фильтрации
    if(isset($_POST['filter'])){
        $_SESSION['filter_orders'] = clear_string($_POST['filter']);
        $_SESSION['direction_orders'] = clear_string($_POST['direction']);
        json_encode(exit('true'));
    }

    //Формируем данные о заказах пользователя из таблицы order
    $all_orders_user = all_orders_user($email, $_SESSION['filter_orders'], $_SESSION['direction_orders']);
    //debug_arr($all_orders_user);



    require_once "views/office/{$view}.php";

} else{header("Location: /");}
