<?php
defined("CATALOG") or die("Access denied");

//Считаем количество новостей
function count_news_admin(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['count(*)'], 'news');
    if(!$result) return false;
    return $result[0]['count(*)'];
}


//достаем новости для админки
function  get_news_admin($start_pos, $perpage){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'news',[],'id','DESC', $start_pos.','.$perpage);
    if(!$result) return false;
    return $result;
}

//Удаление новости
function delete_news_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('news', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

//Скрыть на фронтэнде
function hide_news_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('news',['view'],['0'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

//Показать на фронтэнде
function show_news_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('news',['view'],['1'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}