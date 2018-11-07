<?php
defined("CATALOG") or die("Access denied");
//SELECT `products`.id, `products`.alias, `products`.article,`products`.title, `products`.category_id, `products`.`available`, `products`.stock_id, `products`.upsell_product, `products`.price, `products`.count_prod, `rel_states_products`.product_id, `rel_states_products`.state_id AS rel_state_id, `states`.id as `states_id`, `states`.name as `states_name`, `category`.title as `category_title`, `availability_products`.id as `availability_id`, `availability_products`.title as `availability_title`, `war_tmp`.warehouse_id, `war_tmp`.name, `war_tmp`.warehouse_price,`war_tmp`.warehouse_state_id  FROM `products` LEFT OUTER JOIN `rel_states_products` ON `products`.id = `rel_states_products`.product_id LEFT OUTER JOIN `states` ON `rel_states_products`.state_id = `states`.id LEFT OUTER JOIN `category` ON `products`.category_id =`category`.id LEFT JOIN `availability_products` ON `products`.`available` = `availability_products`.id LEFT JOIN (SELECT  `warehouse`.id, `warehouse`.state_id AS warehouse_state_id , `warehouse`.name, `rel_warehouse_product`.warehouse_id,`rel_warehouse_product`.warehouse_price,`rel_warehouse_product`.product_id FROM `warehouse` LEFT JOIN `rel_warehouse_product` ON `warehouse`.id = `rel_warehouse_product`.warehouse_id) as `war_tmp` ON `products`.id=`war_tmp`.product_id
//фильтр для сортровки
function filter_query($arr_filter){
    //если указаны фильтры
    $query = '';
    if(count($arr_filter) > 0)//если указан хоть один из фильтров
    {
        //тригер
        $trig_query = 0;

        // Допостимые значения для фильтрации
        $arr_search = ['state_id','category_id','available', 'stock_id','upsell_product','id','article', 'price'];

        $_SESSION['filter']['state_id'] = clear_string($arr_filter['state_id']) ;
        $_SESSION['filter']['category_id'] = clear_string($arr_filter['category_id']);
        $_SESSION['filter']['available'] = clear_string($arr_filter['available']);
        $_SESSION['filter']['stock_id'] = clear_string($arr_filter['stock_id']);
        $_SESSION['filter']['upsell_product'] = clear_string($arr_filter['upsell_product']);
        $_SESSION['filter']['id'] = clear_string($arr_filter['id']);
        $_SESSION['filter']['article'] = clear_string($arr_filter['article']);

        $query = "SELECT `products`.id, `products`.article, `products`.alias, `products`.title, `products`.category_id, `products`.`available`, `products`.stock_id, `products`.upsell_product, `products`.price, `products`.count_prod,  `category`.title as `category_title`, `availability_products`.id as `availability_id`, `availability_products`.title as `availability_title` FROM `products` LEFT OUTER JOIN `category` ON `products`.category_id =`category`.id LEFT JOIN `availability_products` ON `products`.`available` = `availability_products`.id WHERE `products`.id > 0";

        foreach($arr_filter as $k=>$v){
            //проверяем есть ли
            if(!in_array($k, $arr_search)) continue;

            //обращаемся к назв. таблицы для формирования запроса для 'id'
            if($k == 'id' && (int)$v > 0 ){
                $query .= " AND `products`.id=" . $v;
            }

            //фильтр по принадлежности продукта к складу, (склад)который находится в запрашиваемом штате
            if($k == 'state_id' && (int)$v > 0){
                $query .=" AND `products`.id IN (SELECT rel_warehouse_product.product_id FROM rel_warehouse_product WHERE warehouse_id IN (SELECT warehouse.id FROM warehouse WHERE state_id = " . $v . "))";
            }

            //обрабатываем массив с ценой
            if($k == 'price'){
                if($v[0]) {
                    $v[0] = str_replace(",",".", $v[0]);
                    $_SESSION['filter']['start_price'] = $v[0] = (float)$v[0];
                }
                if($v[1]) {
                   $v[1] = str_replace(",",".", $v[1]);
                    $_SESSION['filter']['end_price'] = $v[1] = (float)$v[1];
                }

                if($v[1] < $v[0]){
                    $_SESSION['filter']['start_price'] = $_SESSION['filter']['end_price'] = $v[1] = $v[0] = 0;
                    $_SESSION['message']['error'] = 'Err_price. specify the correct price interval!';
                }
            }

            if(empty($v)) continue;

            if(is_array($v) && $v[0]==0 && $v[1]==0) {
                continue;
            }

            if($k == 'category_id' && (int)$v > 0){
                // ID дочерних категорий
                $ids_cat_search = cats_id(get_category(),$v);
                //Дочернии категории + выбранная категория
                $ids_cat_search = !$ids_cat_search ? $v : $ids_cat_search . $v;
                $v =  $ids_cat_search;
                $query .= " AND category_id IN ({$v})";
            }

            if(($k == 'price' && $v[0] > 0) || ($k == 'price' && $v[1] > 0)){
                if($v[0] > 0 && $v[1] == 0){
                    $query .=" AND price >= $v[0]";
                }
                if($v[0] == 0 && $v[1] > 0){
                    $query .=" AND price <= $v[1]";
                }
                if($v[0] > 0 && $v[1] > 0){
                    $query .=" AND price BETWEEN {$v[0]} AND {$v[1]}";
                }
            }

            if($k=='available' && (int)$v > 0){
                $query .=" AND products.id IN (SELECT rel_warehouse_product.product_id FROM rel_warehouse_product WHERE warehouse_availability =" . $v.")";
            }

            if($k == 'article' && clear_string($v)>''){
                $query .=" AND products.article LIKE '%{$v}%'";
            }
        }
    }
    return $query;
}

//достаем продукты для админки
function  get_product_admin($start_pos, $perpage, $filter_query = false){
    $obj_db = Model_Driver::get_instance();
    //Формирование запроса
    $query='';
    $query = "SELECT `products`.id, `products`.article, `products`.alias, `products`.title, `products`.category_id, `products`.`available`, `products`.stock_id, `products`.upsell_product, `products`.price, `products`.count_prod,  `category`.title as `category_title`, `availability_products`.id as `availability_id`, `availability_products`.title as `availability_title` FROM `products` LEFT OUTER JOIN `category` ON `products`.category_id =`category`.id LEFT JOIN `availability_products` ON `products`.`available` = `availability_products`.id";

    if ($filter_query > ''){
        $query = $filter_query;
    }
    //укажем сортировку и лимит
    $query .=" ORDER BY `products`.id DESC LIMIT {$start_pos}, {$perpage}";
    //echo $query;
    //запрос согласно указаным фильтрам
    $result_query = $obj_db->sqlQuery($query);

    //количество продуктов согласно фильтрам
    //$query_count = "SELECT COUNT(*) FROM (" . $query .") AS count_str ";
    //$result_count = $obj_db->sqlQuery($query_count);
    if(!$result_query) return false;
    $res=['result_query'=>$result_query];
    return $res;
}

//Считаем количество всех продуктов с учетом использования поиска
function count_product_admin($filter_query = false){
    $obj_db = Model_Driver::get_instance();
    if($filter_query > false){
        //количество продуктов согласно фильтрам
        $query_count = "SELECT COUNT(*) FROM (" . $filter_query .") AS count_str ";
        //echo $query_count;
        $result_count = $obj_db->sqlQuery($query_count);
        if(!$result_count) return false;
        return $result_count[0]['COUNT(*)'];
    }
    $query_count="SELECT COUNT(*) FROM (SELECT `products`.id, `products`.article, `products`.alias, `products`.title, `products`.category_id, `products`.`available`, `products`.stock_id, `products`.upsell_product, `products`.price, `products`.count_prod,  `category`.title as `category_title`, `availability_products`.id as `availability_id`, `availability_products`.title as `availability_title` FROM `products` LEFT OUTER JOIN `category` ON `products`.category_id =`category`.id LEFT JOIN `availability_products` ON `products`.`available` = `availability_products`.id) AS count_str";

    $result_count = $obj_db->sqlQuery($query_count);
    if(!$result_count) return false;
    return $result_count[0]['COUNT(*)'];
}

//количество продукта на складе
function get_count_product_id_in_warehouse($product_id){
    $product_id = (int)$product_id;
    if(!$product_id) return false;
    $query = "SELECT SUM(warehouse_count) FROM `rel_warehouse_product` WHERE product_id=".$product_id;
    global $link;
    $res = Model_Driver::get_instance()->select(['SUM(`warehouse_count`)'],'rel_warehouse_product', ['product_id'=>$product_id]);
    //debug_arr($res);
    if(!$res) return false;
    return $res[0]['SUM(`warehouse_count`)'];
}

//Удаление продукта
function delete_product_res($pages_id){
    $obj_db = Model_Driver::get_instance();

    //проверяем принадлежность склада к продуктам
    if(findOneParam('rel_warehouse_product', 'product_id', $pages_id))
    {
        mysqli_autocommit($obj_db->ins_db,FALSE);
        try
        {
            $result = $obj_db->delete('rel_warehouse_product', ['product_id'=>$pages_id], ['=']);
            if(!$result) {
                throw new Exception();
            }
            $result_1 = $obj_db->delete('products', ['id'=>$pages_id], ['=']);
            if(!$result_1){
                throw new Exception();
            }
        }
        catch (Exception $e)
        {
            mysqli_rollback($obj_db->ins_db);
            return false;
        }
        mysqli_commit($obj_db->ins_db);
        return true;
    }
    $result = $obj_db->delete('products', ['id'=>$pages_id], ['=']);
    if(!$result) return false;
    return $result;
}

//Скрыть на фронтэнде 
function hide_product_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('products',['visible'],['0'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}

//категория продукта 
function id_category_for_product($id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->select(['parent'], 'products', ['id'=>$id]);
    if(!$result) return false;
    return $result[0]['parent'];
}

//Проверка скрыта или нет категория продукта
//делаем запрос в таблицу category
//проверяем view таблицы category
function check_hide_category_for_product($id){
    //$id - id категории отображаемого продукта,
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->select(['view'], 'category', ['id'=>$id]);
    if(!$result) return false;
    if($result[0]['view'] == '0') return 'hide';
    if($result[0]['view'] > 0 ) return 'show';
}

//Показать на фронтэнде
function show_product_res($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('products',['visible'],['1'],['id'=>$pages_id]);
    if(!$result) return false;
    return $result;
}