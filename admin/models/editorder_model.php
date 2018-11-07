<?php
defined("CATALOG") or die("Access denied");

//Информация о заказе
function order_user_for_edit($pages_id){
    $obj_db = Model_Driver::get_instance();
    $query = "SELECT `orders`.*, `team_admin_users`.id AS admin_users_id, `team_admin_users`.name AS manager_name, `order_status`.param_status AS order_status_id, `order_status`.title AS status_title  FROM `orders` LEFT JOIN `team_admin_users` ON `orders`.team_admin_users_id = `team_admin_users`.id LEFT JOIN `order_status` ON `order_status`.param_status = `orders`.status WHERE `orders`.id={$pages_id}";
    //echo $query;
    $result = $obj_db ->sqlQuery($query);
    if(!$result) return false;
    return $result[0];
}

//Подробная информация о содержании заказа
function order_items_for_user($pages_id){
    $obj_db = Model_Driver::get_instance();
    $query = "SELECT `order_items`.*, products.id AS product_id, products.alias FROM order_items LEFT JOIN products ON order_items.product_id = products.id WHERE order_items.order_id={$pages_id}";
    //echo $query;
    $result = $obj_db ->sqlQuery($query);
    if(!$result) return false;
    return $result;
}

//Информация о способах доставки
function delivery_info(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->select(['*'], 'delivery');
    if(!$result) return false;
    return $result;
}

//Информация о способе оплаты
function pay_info(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->select(['*'], 'pay_form');
    if(!$result) return false;
    return $result;
}

function res_add_comment($user_log, $mess){
    $err=[];
    if(strlen(clear_string($mess)) < 5){
       $err[] = 'min 6 characters!';
       $_SESSION['message']['error'] = implode('<br/>', $err);
       return false;
    }
    $mess .=' (comment: '.$user_log['auth_name'].' in ' . date("Y-m-d H:i:s").')';
    $res = res_log_record($user_log, clear_string($mess));
    if(!$res){
        $_SESSION['message']['error'] = 'err insert comment';
        return false;
    }
    $_SESSION['message']['success']='Successful!';
    return true;
}

//Запрос на обновление количества товара для заказа
function update_order_items($arr,$user_log=false){
    if(!$arr)
        return false;
    //Проверяем существование заказа
    //debug_arr($arr);
    $res = findOneParam('order_items','id', (int)$arr['order_items_id']);
    if(!$res)
        return 'not_id';

    //Пропускаем количество не больше 100 единиц товара
    if($arr['new_qty'] >= 100 || $arr <= 0)
        return 'exceeded_qty(>= 100)';

    //Получаем данные о продукте бд
    $obj_db = Model_Driver::get_instance();
    $order_items_info=$obj_db->select(['*'], 'order_items', ['id'=>$arr['order_items_id']]);
    if(!$order_items_info)
        return 'err_order_items_info';

    //Новая общая стоимость корректируемого товара
    $new_price = $order_items_info[0]['price'] * $arr['new_qty'];

    //Отключаем автоматическое подтверждение выполнения SQL запросов в базе
    mysqli_autocommit($obj_db->ins_db, FALSE);

    $result_1 = $obj_db->update(
        'order_items',
        ['qty_item', 'sum_item'],
        [$arr['new_qty'], $new_price],
        ['id'=>$arr['order_items_id']]
    );

    if(!$result_1)
        return 'update_new_price_err';

    //Полная информация о редактируемом заказе
    $res = $obj_db->select(['*'], 'order_items', ['order_id'=>$arr['order_id']]);
    if(!$res)
        return 'err_select_order_items';

    $items_info=[];

    //Общая сумма заказа для ордера
    $items_info['item_sum']='';

    //Общее количество товара для заказа
    $items_info['all_qty']='';

    for($i=0, $count=count($res); $i<$count; $i++){
        $items_info['item_sum'] = $items_info['item_sum'] + $res[$i]['sum_item'];
        $items_info['all_qty'] = $items_info['all_qty'] + $res[$i]['qty_item'];
    }

    $time_update = date("Y-m-d H:i:s");
    //price, qty_item, sum_item from order_items where id = $arr['order_items_id']
    $result_1 = $obj_db->update(
        'orders',
        ['qty', 'sum', 'updated_at'],
        [$items_info['all_qty'], $items_info['item_sum'], $time_update],
        ['id' => $arr['order_id']]
    );

    if(!$result_1)
    {
        mysqli_rollback($obj_db->ins_db);
        return 'err_in_orders_update';
    }
    //Если запросы выполнены верно, отправляем запрос на подтверждение выполнения транзакции
    $commit = mysqli_commit($obj_db->ins_db);
    if(!$commit) return 'err_commit';

    //формируем логи
    mysqli_autocommit($obj_db->ins_db, TRUE);
    $mess = $user_log['auth_name'].' '.'update qty from '.$order_items_info[0]['qty_item'].' to '.$arr['new_qty'] .' '. $time_update;
    $record_log = res_log_record($user_log,$mess);

    //Возвращаем массив параметров
    //если успешно, формируем логи
    $res_update =
    [
        'res'=>'true',
        'new_price_for_item'=>$new_price,
        'total_sum_order'=> $items_info['item_sum'],
        'record_log'=> $mess,
    ];

    return $res_update;
}

//Запрос на удаление товара у пользователя из содержания корзины
function delete_order_items($arr=[], $user_log, $pages_id){
    if(!$arr)
        return false;
    //Проверяем существование заказа
    $res = findOneParam('order_items','id', $arr['order_items_id']);
    if(!$res)
        return 'not_id';

    $res = findOneParam('order_items','order_id', $pages_id);
    if(!$res)
        return 'order_error';

    //Получаем данные о продукте бд
    $obj_db = Model_Driver::get_instance();
    $order_items_info = $obj_db->select(['*'], 'order_items', ['id'=>$arr['order_items_id']]);
    $product_title = $order_items_info[0]['title'];
    //debug_arr($order_items_info); exit;
    if(!$order_items_info)
        return 'err_order_items_info';

    //Полная информация о редактируемом заказе
    $order_info = $obj_db->select(['*'], 'orders', ['id'=>$order_items_info[0]['order_id']]);
    if(!$order_info)
        return 'err_select_orders';
    //debug_arr($order_info); exit;

    //Удаление товара из заказ
    //Отключаем автоматическое подтверждение выполнения SQL запросов в базе
    mysqli_autocommit($obj_db->ins_db, FALSE);

    $result_1 = $obj_db->delete(
        'order_items',
        ['id'=>$arr['order_items_id']],
        ['=']
    );
    if(!$result_1){
        mysqli_rollback($obj_db->ins_db);
        return 'del_items_err';
    }

    //получаем обновленные данные о заказе
    $update_info_orders_item = $obj_db->select(['COUNT(*)'], 'order_items', ['order_id'=>$order_items_info[0]['order_id']]);
    //debug_arr($order_items_info); exit;
    if($update_info_orders_item[0]['COUNT(*)'] === false)
    {
        return 'err_update_info_orders_item';
    }
    //debug_arr($order_items_info); exit;

    if($update_info_orders_item[0]['COUNT(*)'] == 0 )
    {
        $result_1 = $obj_db->update(
            'orders',
            ['qty', 'sum'],
            [0, 0],
            ['id' => $order_items_info[0]['order_id']]
        );
        if(!$result_1)
        {
            mysqli_rollback($obj_db->ins_db);
            return 'update_orders_err';
        }

        //Если запросы выполнены верно, отправляем запрос на подтверждение выполнения транзакции
        $commit = mysqli_commit($obj_db->ins_db);
        if(!$commit) return 'err_commit';

        $res_update =
            [
                'res'=>'true',
                'total_sum_order'=> 0
            ];
        return $res_update;
    }

    $update_info_orders_item = $obj_db->select(['*'], 'order_items', ['order_id'=>$order_items_info[0]['order_id']]);
    $items_info=[];
    //Общая сумма заказа для ордера
    $items_info['item_sum']='';
    //Общее количество товара для заказа
    $items_info['all_qty']='';

    for($i=0, $count=count($update_info_orders_item); $i<$count; $i++){
        $items_info['item_sum'] = $items_info['item_sum'] + $update_info_orders_item[$i]['sum_item'];
        $items_info['all_qty'] = $items_info['all_qty'] + $update_info_orders_item[$i]['qty_item'];
    }

    //price, qty_item, sum_item from order_items where id = $arr['order_items_id']

    $result_1 = $obj_db->update(
        'orders',
        ['qty', 'sum'],
        [$items_info['all_qty'], $items_info['item_sum']],
        ['id' => $update_info_orders_item[0]['order_id']]
    );

    if(!$result_1)
    {
        mysqli_rollback($obj_db->ins_db);
        return 'err_in_orders_update';
    }

    //Если запросы выполнены верно, отправляем запрос на подтверждение выполнения транзакции
    $commit = mysqli_commit($obj_db->ins_db);
    if(!$commit) return 'err_commit';
    mysqli_autocommit($obj_db->ins_db, TRUE);

    $time_update = date("Y-m-d H:i:s");
    $mess = $user_log['auth_name'].' '.'product is removed ('.$product_title.') ' . $time_update;
    $record_log = res_log_record($user_log, $mess);

    //Возвращаем массив параметров
    $res_update =
        [
            'res'=>'true',
            'total_sum_order'=> $items_info['item_sum'],
            'record_log'=> $mess,
        ];
    return $res_update;
}

//Обновление статуса
function update_status_order($param_id, $order_status, $pages_id, $order_user_for_edit,$user_log){
    //проверка передаваемого параметра
    $param_id =(int)$param_id;
    $new_arr=[];
    $new_status_order='';
    foreach ($order_status as $item) {
        $new_arr[]=$item['param_status'];
        if($param_id == $item['param_status']){
            $new_status_order =  $item['title'];
        }

    }

    if(!in_array($param_id, $new_arr)){
        $_SESSION['message']['error'] = 'err_status order send!';
        return false;
    }
    //записываем старый статус
    $old_status_order = $order_user_for_edit['status_title'];

    $time_update = date("Y-m-d H:i:s");
    $res = Model_Driver::get_instance()->update(
        'orders',
        ['status', 'updated_at'],
        [ $param_id, $time_update],
        ['id'=>$pages_id]
    );
    if(!$res) {
        $_SESSION['message']['error'] = 'err update err_status!';
        return false;
    }
    // после обновления данных записываем новый статус

    $time_update = date("Y-m-d H:i:s");
    $mess = $user_log['auth_name'].' '.'update status from '.$old_status_order.' to '.$new_status_order .' '. $time_update;
    $record_log = res_log_record($user_log,$mess);

    if(!$record_log) $_SESSION['message']['error'] ='err record log!';
    $_SESSION['message']['success']='Success update!';
    return true;
}

function res_log_record($user_log, $mess){
    //if(empty($mess)) $mess = 'empty';
    $time = date("Y-m-d H:i:s");
    $query = "INSERT INTO `order_processing` (order_id,auth_id,auth_name,auth_email,message,created_at) VALUES ({$user_log['pages_id']},{$user_log['auth_id']},'{$user_log['auth_name']}','{$user_log['auth_email']}','{$mess}','{$time}')";
    //echo $query;
    $res = Model_Driver::get_instance()->sqlQuery($query, true);
    if(!$res){
        mysqli_error(Model_Driver::get_instance()->ins_db);
        //$_SESSION['message']['error']='err insert data!';
        return false;
    }
    return true;
}















