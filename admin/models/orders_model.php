<?php
defined("CATALOG") or die("Access denied");

//стандартный поисковой запрос
//Поисковой запрос для ордера с учетом параметров
function filter_query_for_order($arr_filter=false){
    //если указаны фильтры
    $query = "SELECT `orders`.*, `team_admin_users`.id AS admin_users_id, `team_admin_users`.name AS manager_name, `order_status`.param_status AS order_status_id, `order_status`.title AS status_title  FROM `orders` LEFT JOIN `team_admin_users` ON `orders`.team_admin_users_id = `team_admin_users`.id LEFT JOIN `order_status` ON `order_status`.param_status = `orders`.status WHERE `orders`.id > 0 ";
    if($arr_filter > false && count($arr_filter) > 0)//если указан хоть один из фильтров
    {
        // Допостимые значения для фильтрации
        $arr_search = ['created_at','manager_name','sum', 'order_status','name','phone'];

        $_SESSION['filter']['manager_name'] = clear_string($arr_filter['manager_name']) ;
        $_SESSION['filter']['order_status'] = clear_string($arr_filter['order_status']);
        $_SESSION['filter']['name']         = clear_string($arr_filter['name']);
        $_SESSION['filter']['phone']        = clear_string($arr_filter['phone']);

        //преобразование даты
        if(!$_SESSION['filter']['start_date'] = date("Y-m-d H:i:s", strtotime(clear_string($arr_filter['created_at'][0])))){
            $_SESSION['filter']['start_date']='';
        }
        if(!$_SESSION['filter']['end_date'] = date("Y-m-d H:i:s", strtotime(clear_string($arr_filter['created_at'][0])))){
            $_SESSION['filter']['end_date']= '';
        }

        foreach($arr_filter as $k=>$v){
            //проверяем есть ли
            if(!in_array($k, $arr_search)) continue;

            if(empty($v)) continue;

            if(is_array($v) && $v[0]==0 && $v[1]==0) {
                continue;
            }

            //поиск по менеджеру
            if($k == 'manager_name' && $_SESSION['filter']['manager_name'] > ''){
                $query .= " AND `team_admin_users`.name='{$_SESSION['filter']['manager_name']}'";
            }

            //фильтр по статусу ордера
            if($k == 'order_status' && $_SESSION['filter']['order_status'] > 0){
                $query .=" AND `orders`.status='{$_SESSION['filter']['order_status']}'";
            }

            //фильтр по статусу ордера
            if($k == 'name' && $_SESSION['filter']['name'] > ''){
                $query .=" AND `orders`.name LIKE '%" . $_SESSION['filter']['name'] ."%'";
            }

            //фильтр по ntktajye
            if($k == 'phone' &&  $_SESSION['filter']['phone']  > ''){
                $query .=" AND `orders`.phone LIKE '%" . $_SESSION['filter']['phone'] ."%'";
            }

            //обрабатываем массив с ценой
            if($k == 'sum'){
                if($v[0]) {
                    $v[0] = str_replace(",",".", $v[0]);
                    $_SESSION['filter']['start_price'] = $v[0] = (float)$v[0];
                }
                if($v[1]) {
                    $v[1] = str_replace(",",".", $v[1]);
                    $_SESSION['filter']['end_price'] = $v[1] = (float)$v[1];
                }

                if($v[1] < $v[0]){
                    $_SESSION['filter']['start_price'] = $_SESSION['filter']['end_price'] = $v[1] = $v[0] = 0;
                    $_SESSION['message']['error'] = 'Err_price. specify the correct price interval!';
                }
            }

            if(($k == 'sum' && $v[0] > 0) || ($k == 'sum' && $v[1] > 0)){
                if($v[0] > 0 && $v[1] == 0){
                    $query .=" AND sum >= $v[0]";
                }
                if($v[0] == 0 && $v[1] > 0){
                    $query .=" AND sum <= $v[1]";
                }
                if($v[0] > 0 && $v[1] > 0){
                    $query .=" AND sum BETWEEN {$v[0]} AND {$v[1]}";
                }
            }

            if(($k == 'created_at' && $_SESSION['filter']['start_date'] > 0) || ($k == 'created_at' && $_SESSION['filter']['end_date'] > 0)) {
                if ($_SESSION['filter']['start_date'] > '' && $_SESSION['filter']['end_date'] == '') {
                    $query .= " AND created_at >= '{$_SESSION['filter']['start_date']}'";
                }
                if ($_SESSION['filter']['start_date'] == '' && $_SESSION['filter']['end_date'] > '') {
                    $query .= " AND created_at <='{$_SESSION['filter']['end_date']}";
                }
                if ($_SESSION['filter']['start_date'] > '' && $_SESSION['filter']['end_date'] > '') {
                    $query .= " AND created_at BETWEEN '{$_SESSION['filter']['start_date']}' AND '{$_SESSION['filter']['end_date']}'";
                }
            }
        }
    }
    return $query;
}

function count_orders_admin($filter_query){
    $obj_db = Model_Driver::get_instance();
        //количество продуктов согласно фильтрам
        $query_count = "SELECT COUNT(*) FROM (" . $filter_query .") AS count_str ";
        //echo $query_count;
        $result_count = $obj_db->sqlQuery($query_count);
        if(!$result_count) return false;
        return $result_count[0]['COUNT(*)'];
}


//достаем заказы для админки
function  get_orders_admin($start_pos, $perpage, $filter_query){
    $obj_db = Model_Driver::get_instance();
    //Формирование запроса
    $query = $filter_query;

    //укажем сортировку и лимит
    $query .=" ORDER BY `orders`.id DESC LIMIT {$start_pos}, {$perpage}";
    //echo $query;
    //запрос согласно указаным фильтрам
    $result_query = $obj_db->sqlQuery($query);
    //echo $query;
    //количество продуктов согласно фильтрам
    //$query_count = "SELECT COUNT(*) FROM (" . $query .") AS count_str ";
    //$result_count = $obj_db->sqlQuery($query_count);
    if(!$result_query) return false;
    //$res = ['result_query'=>$result_query];
    return $result_query;
}

//Удаление заказов
function delete_orders_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('orders', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

//Скрыть на фронтэнде
function hide_orders_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('orders',['view'],['0'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

//Показать на фронтэнде
function show_orders_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('orders',['view'],['1'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}