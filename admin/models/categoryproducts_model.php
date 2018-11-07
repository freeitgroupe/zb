<?php
defined("CATALOG") or die("Access denied");

//Считаем количество категорий
function count_category_admin(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['count(*)'], 'category');
    if(!$result) return false;
    return $result[0]['count(*)'];
}

//количество категорй на страницу
//достаем продукты для админки
function  get_category_admin($start_pos, $perpage){
    $obj_db = Model_Driver::get_instance();
    //Формирование запроса
    $query='';
    $query = "SELECT * FROM `category`";

    //укажем сортировку и лимит
    $query .=" ORDER BY `category`.id LIMIT {$start_pos}, {$perpage}";

    //запрос
    $result_query = $obj_db->sqlQuery($query);

    //количество продуктов согласно фильтрам
    //$query_count = "SELECT COUNT(*) FROM (" . $query .") AS count_str ";
    //$result_count = $obj_db->sqlQuery($query_count);
    if(!$result_query) return false;
    return $result_query;
}

//самостоятельные категории товаров
function get_edit_category_products(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'category',[]);
    if(!$result) return false;
    /** @var true $result */
    return $result;
}

/*
 * Cодержание подкатегорий в выбраной категории
 */
function get_empty_subcategory_product($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['count(*)'], 'category', ['parent'=>$pages_id]);
    if(!$result) return false;
    if($result[0]['count(*)'] == 0) return 'empty';
    return 'not empty';
}

/*
 * Удаление категории сайта
 */
function delete_category_products($pages_id){
    $obj_db = Model_Driver::get_instance();    
    $result = $obj_db->delete('category', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}


/*
* Есть ли продукты в данной категории
*/
function category_product_empty($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['count(*)'], 'products', ['category_id'=>$pages_id]);
    if(!$result) return false;
    if($result[0]['count(*)'] > 0) return 'not empty';
    if($result[0]['count(*)'] == 0) return 'empty'; 
}


/*
* Скрытие продуктов выбранной категории
*/
function hide_product_for_cat($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->update('products', ['mark_view'],['0'], ['category_id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}


/*
 * Скрытие подкатегории товаров
 */
function hide_sub_cat_res ($pages_id){   
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('category',['`view`'],['0'],['parent'=>$pages_id]);
    if(!$result) return false;
    return $result;
}


/*
 * Скрытие категории товаров
 */
function hide_category_products($pages_id){
    $arr_mess=[];
    $obj_db = Model_Driver::get_instance(); 
    $result = $obj_db->update('category',['`view`'],['0'], ['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}


/*
 * Самостоятельная категория или нет
 */
function separate_category($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['parent'], 'category', ['id'=>$pages_id]);
    if(!$result) return false;
    if($result[0]['parent'] == 0) return 'separate';
    if($result[0]['parent'] > 0) return $result[0]['parent'];

}

/*
 * проверка скрыты или нет вышестоящие категории
 */
function hide_parent_category($pages_parent_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['`view`'], 'category', ['id'=>$pages_parent_id]);
    if(!$result) return false;
    if($result[0]['view'] == 0) return 'hide';
    if($result[0]['view'] > 0) return 'show';
}


/*
 * Отобразить категорию
 */
function show_category_products($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('category',['`view`'],['1'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

/*
* Отобразить продукты для выбранной категории
*/
function show_product_for_cat($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->update('products', ['mark_view'],['1'], ['category_id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}



