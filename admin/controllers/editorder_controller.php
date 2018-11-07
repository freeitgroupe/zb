<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match)) header("Location: /admin");

//debug_arr($_SESSION);
//Для формирования логов при редактировании ордера
//Исползуем глобальный массив $_SESSION['auth_name'],$_SESSION['auth_email']
//статусы для ордеров
$order_status = find_all_from_table('order_status');

if($match['pages_id'] != 'new'){
    $pages_id = $match['pages_id'];
    $pages_id = (int)$pages_id;
    //информация о выбранном ордере
    $order_user_for_edit = order_user_for_edit($pages_id);
    //debug_arr($order_user_for_edit);

    //Подробная информация о содержании заказа
    $order_items_for_user = order_items_for_user($pages_id);
    //debug_arr( $order_items_for_user);
    //if(!$order_items_for_user) $order_items_for_user = '';
    if(!$order_user_for_edit) header("Location: /admin/orders-options/");

    //готовые логи для ордера
    $log_for_order = find_one_param_table('order_processing', 'order_id', $pages_id);
    if(!$log_for_order) $log_for_order = 'empty';
    //debug_arr($log_for_order);

    //Данные для записи логов
    $user_log =[
        'auth_name'=>$_SESSION['auth_name'],
        'auth_email' => $_SESSION['auth_email'],
        'auth_id' => $_SESSION['auth_id'],
        'pages_id' => $pages_id,
    ];

    //Формирование комментария
    if(isset($_POST['add_comment'])){
        $res_add_comment = res_add_comment($user_log,$_POST['message']);
        if (!$res_add_comment)
        {
            header("Location: /admin/edit-order/" . $pages_id);
            exit();
        }
        header("Location: /admin/edit-order/" . $pages_id);
        exit();
    }

    ////отправляем пост данные в order items////
    //Обновление количества товара
    if(isset($_POST['order_item_id']) && isset($_POST['new_qty']) && isset($_POST['order_id']) && $_POST['submit'] == 'page_new_qty_submit')
    {
        ////Обработка данных////
        //Формируем массив id товара в заказе, количество товара, номер заказа
        $arr =
            [
                'order_items_id'=>(int)$_POST['order_item_id'],
                'new_qty'=>(int)$_POST['new_qty'],
                'order_id'=>(int)$_POST['order_id'],
            ];
        
        //Обновление в бд
        $update_order_items = update_order_items($arr,$user_log);

        if(isset($update_order_items['res']))
        {
            exit(json_encode($update_order_items));
        }
        else
        {
            exit(json_encode(['messages'=>$update_order_items]));
        }
        //обработка результатов
    }

    //Удаление товара из заказа
    if(isset($_POST['submit']) && isset($_POST['order_item_id']) && $_POST['submit'] == 'page_delete_submit')
    {
        ////Обработка данных////
        //Формируем массив? передаем id товара 
        $arr =
            [
                'order_items_id'=>(int)$_POST['order_item_id']                
            ];

        //Обновление в бд
        $delete_order_items = delete_order_items($arr, $user_log, $pages_id);

        if(isset($delete_order_items['res']))
        {
            exit(json_encode($delete_order_items));
        }
        else
        {
            exit(json_encode(['messages'=>$delete_order_items]));
        }

    }

    //Обновление статуса заказа
    if (isset($_POST['update_status'])) {

        $update_status_order = update_status_order($_POST['order_status'], $order_status, $pages_id, $order_user_for_edit,$user_log);

        if (!$update_status_order)
        {
            header("Location: /admin/edit-order/" . $pages_id);
            exit();
        }
        header("Location: /admin/edit-order/" . $pages_id);
        exit();
    }

}

require_once TMP_ADM . $view .'.php';