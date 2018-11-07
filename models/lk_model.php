<?php
defined("CATALOG") or die("Access denied");
require_once "Model_Driver.php";

/**
 * Меню для лк пользователей
 **/

function menu_office(){
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $result = $obj_db->select(
        ['*'],'menu_office',[],'position', 'ASC');
    if(!$result) return false;
    return $result;
}
