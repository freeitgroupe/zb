<?php
defined("CATALOG") or die("Access denied");

/*
 * Список категорий
 */
function get_edit_category_news(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(
        ['*'],'category_news');
    if(!$result) return false;
    return $result;
}

/*
 * Удаление новости
 */
function delete_category_news_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('category_news', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

/*
 * Скрытие новости
 */
function hide_category_news_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('category_news',['view'],['0'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

/*
 * Отобразить новость
 */
function show_category_news_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('category_news',['view'],['1'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}



