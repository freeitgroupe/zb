<?php
defined("CATALOG") or die("Access denied");

//Считаем количество фильтров
function count_filters_admin(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['count(*)'], 'filter');
    if(!$result) return false;
    return $result[0]['count(*)'];
}

//достаем продукты для админки
function  get_filters_admin($start_pos, $perpage){
    //$obj_db = Model_Driver::get_instance();
    //$result = $obj_db->select(['*'], 'filters',[],'id','ASC', $start_pos.','.$perpage);

    //Формируем запрос в таблицу фильтров и в таблицу значений фильтров
    global $link;
    $query = "SELECT filter_value.*, filter.name, filter.visible FROM filter_value INNER JOIN filter ON filter_value.filter_id = filter.id LIMIT {$start_pos}, {$perpage}";
    $result = mysqli_query($link,$query);
    if(!$result) return false;
    $arr =[];
    while($row = mysqli_fetch_assoc($result)){
        $arr[]=$row;
    }
    return $arr;
}

//Удаление один параметр фильтра
function delete_filter_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('filter_value', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

//Получаем Имя фильтра по его значению фильтра
function param_id_title($param_id){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db->select(['filter_id'], 'filter_value', ['id'=>$param_id]);
    if(!$res) return false;
    return $res[0]['filter_id'];
}

//Редактирование имени фильтра
function  edit_event_ajax_rename($param_name, $param_id){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db->update('filter', ['name'], [$param_name], ['id'=>$param_id]);
    if(!$res) return false;
    return $param_name;
}






