<?php
defined("CATALOG") or die("Access denied");
/**
 * Получение отдельного товара
 **/
function get_one_pages($page_alias){
    $page_alias = clear_string($page_alias);
    $query = "SELECT * FROM pages WHERE alias LIKE '$page_alias' AND status=1 LIMIT 1";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if(!$res) return false;
    $new_arr=[];
    $arr = $res[0];
    foreach ($arr as $k=>$v){
        if($k == 'text'){
            $new_arr[$k] = $v;
            continue;
        }
        $new_arr[$k]=$v;
    }
    return $new_arr;
}

