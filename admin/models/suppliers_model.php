<?php
defined("CATALOG") or die("Access denied");

//Формируем массив страниц для поставщиков без фильтраций
function get_edit_suppliers(){
     $res = Model_Driver::get_instance()->select(['*'], 'suppliers');
     if(!$res) return false;
     return false;
}

//Поставщики
function startSearchParam(){
     $query = "SELECT `suppliers`.* FROM `suppliers` WHERE `suppliers`.supplier_id <> 0";
     return $query;
}

//поисковой запрос с учетом фильтраций
function filter_query_suppliers($arr_filter){
    //если указаны фильтры
    $query = startSearchParam();
    if(count($arr_filter) > 0){ //если указан хоть один из фильтров
        $arr_search = ['title','state','city','zip_code', 'email'];
        //Проходимя по массиву фильтра
        foreach ($arr_filter as $k=>$v) {
            //поверяем допустимые значения для поиска
            if(!in_array($k, $arr_search)) continue;
            if(clear_string($v) == false || empty($v)) continue;
            $_SESSION['filter'][$k] = $v;
            $query .= " AND {$k}='$v'";
        }
        return $query;
    }
    return $query;
}

//количество поставщиков согласно поисковому запросу
function count_suppliers_admin($filter_query){
    $obj_db = Model_Driver::get_instance();
    //количество продуктов согласно фильтрам
    $query_count = "SELECT COUNT(*) FROM (" . $filter_query .") AS count_str ";
    $result_count = $obj_db->sqlQuery($query_count);
    //var_dump($result_count);
    if(!$result_count) return false;
    return $result_count[0]['COUNT(*)'];
}

//склады для админки
function  get_suppliers_admin($start_pos, $perpage, $filter_query = false){
    $obj_db = Model_Driver::get_instance();
    //Формирование запроса
    $query = $filter_query;
    //укажем сортировку и лимит
    $query .=" ORDER BY `suppliers`.supplier_id LIMIT {$start_pos}, {$perpage}";
    //запрос согласно указаным фильтрам
    $result_query = $obj_db->sqlQuery($query);
    if(!$result_query) return false;
    return $result_query;
}

//Удаление поставщиков
function deleteSuppliersRes($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('suppliers', ['supplier_id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

//Удаление поставщиков с таблицы rel_suppliers_products
function deleteRelSuppliersProdRes($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->delete('rel_suppliers_products', ['supplier_id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}