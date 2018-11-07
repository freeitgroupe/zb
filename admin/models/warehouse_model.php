<?php defined("CATALOG") or die("Access denied");


function filter_query_warehouse($arr_filter){
    //если указаны фильтры
    $query = 'SELECT `warehouse`.*, `states`.id AS states_id, `states`.name AS states_name  FROM `warehouse` INNER JOIN `states` ON `warehouse`.state_id = `states`.id WHERE `warehouse`.id <> 0 ';
    if(count($arr_filter) > 0)//если указан хоть один из фильтров
    {
        $arr_search = ['state_id','city','tax_summ','official_registration'];
        if(!isset($arr_filter['official_registration'])) $arr_filter['official_registration'] = 0;
        //Проходимя по массиву фильтра
        foreach ($arr_filter as $k=>$v) {
            //поверяем допустимые значения для поиска
            if(!in_array($k, $arr_search)) continue;

            if($k == 'tax_summ' && clear_string($v) > 0 )
            {
                $v = round(floatval(preg_replace("#,#",".",$v )), 2);
                $_SESSION['filter']['tax_summ'] = $v;
                $query .= " AND tax_summ={$v}";
                continue;
            }
            if($k == 'official_registration'){
                $_SESSION['filter']['official_registration'] = $v;
                $query .=" AND official_registration='$v'";
                continue;
            }

            if(clear_string($v) == false) continue;
            $_SESSION['filter'][$k] = $v;
            $query .= " AND {$k}='$v'";
        }
        return $query;
    }
}
//Использование фильтра параметры для поиска
//      1. Регион
//		2. Город
//		3. Склады без официальной регистрации
//		4. По проценту налога в Штате
//  	6. Биллинг
function count_warehouse_admin($filter_query=false){
    $obj_db = Model_Driver::get_instance();
    if($filter_query > ''){
        //количество продуктов согласно фильтрам
        $query_count = "SELECT COUNT(*) FROM (" . $filter_query .") AS count_str ";
        //echo $query_count;
        $result_count = $obj_db->sqlQuery($query_count);
        if(!$result_count) return false;
        return $result_count[0]['COUNT(*)'];
    }
}

//склады для админки
function  get_warehouse_admin($start_pos, $perpage, $filter_query = false){
    $obj_db = Model_Driver::get_instance();
    //Формирование запроса
    $query = "SELECT `warehouse`.*, `states`.id AS states_id, `states`.name AS states_name  FROM `warehouse` INNER JOIN `states` ON `warehouse`.state_id = `states`.id WHERE `warehouse`.id <> 0 ";
    if ($filter_query > ''){
        $query = $filter_query;
    }
    //укажем сортировку и лимит
    $query .=" ORDER BY `warehouse`.id LIMIT {$start_pos}, {$perpage}";

    //запрос согласно указаным фильтрам
    $result_query = $obj_db->sqlQuery($query);

    //количество продуктов согласно фильтрам
    //$query_count = "SELECT COUNT(*) FROM (" . $query .") AS count_str ";
    //$result_count = $obj_db->sqlQuery($query_count);
    if(!$result_query) return false;
    return $result_query;
}

/*
 * Удаление страницы сайта
 */
function delete_pages_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    //проверяем принадлежность склада к продуктам
    if(findOneParam('rel_warehouse_product', 'warehouse_id', $pages_id)){
        $result = $obj_db->delete('rel_warehouse_product', ['warehouse_id'=>$pages_id], ['=']);
        if(!$result) return false;
    }
    $result = $obj_db->delete('warehouse', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}
