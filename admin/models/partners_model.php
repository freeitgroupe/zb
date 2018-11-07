<?php
defined("CATALOG") or die("Access denied");

//Считаем количество партнеров
function count_partners_admin(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['count(*)'], 'partners');
    if(!$result) return false;
    return $result[0]['count(*)'];
}


//достаем партнеров для админки
function  get_partners_admin($start_pos, $perpage){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'partners',[],'id','ASC', $start_pos.','.$perpage);
    if(!$result) return false;
    return $result;
}

//Удаление партнеров
function delete_partners_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('partners', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

//Скрыть на фронтэнде
function hide_partners_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('partners',['view'],['0'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

//Показать на фронтэнде
function show_partners_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('partners',['view'],['1'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}