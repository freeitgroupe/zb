<?php
defined("CATALOG") or die("Access denied");

/*
 * Данные о статических страницах сайта
 */

function get_edit_pages(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(
        ['*'],'pages',[],'position', 'ASC');
    if(!$result) return false;
    return $result;
}

/*
 * Удаление страницы сайта
 */

function delete_pages_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('pages', ['page_id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

/*
 * Скрытие страницы 
 */
function hide_pages_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('pages',['view'],['0'],['page_id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

/*
 * Отобразить страницу
 */
function show_pages_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('pages',['view'],['1'],['page_id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}



