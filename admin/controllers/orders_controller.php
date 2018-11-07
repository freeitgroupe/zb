<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//массив для заполнения данными фильтра
$arr_filter = [];
//query filter string
$filter_query = '';

if(!isset($_SESSION['filter'])) {
    $_SESSION['filter']['start_date'] = '' ;
    $_SESSION['filter']['end_date'] = '' ;
    $_SESSION['filter']['start_price'] = '' ;
    $_SESSION['filter']['end_price'] = '' ;
    $_SESSION['filter']['manager_name'] = '';
    $_SESSION['filter']['sum'] = '';
    $_SESSION['filter']['order_status'] = '';
    $_SESSION['filter']['name'] = '';
    $_SESSION['filter']['phone'] = '';
}

//статусы для ордеров
$order_status = find_all_from_table('order_status');
//debug_arr($order_status);
//если был выполнен поисковой запрос
if(isset($_GET['searchButton'])){
    $arr_filter = $_GET;
}else{
    $arr_filter=FALSE;
}
$filter_query = filter_query_for_order($arr_filter);

//количество продуктов
$count_orders_admin = count_orders_admin($filter_query);

//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

//необходимое кол-во страниц
$count_pages = ceil($count_orders_admin / $perpage);

//минимум 1 страница
if (!$count_pages) $count_pages = 1;
//если больше одной страницы
function page_count($count_pages){
    if ($count_pages > 1){
        $arr_page=[];
        //пронумеровали страницы
        for($i=1; $i<=$count_pages; $i++){
            $arr_page['page'][] = $i;
        }
    }
    else{
        $arr_page['page'][] = 1;
    }

    if(isset($_GET['page']) && (int)$_GET['page'] > 0){
        $arr_page['page_active'] = (int)$_GET['page'];
    }else{
        $arr_page['page_active'] = 0;
    }
    return $arr_page;
}
$page_count = page_count($count_pages);

// получение текущей страницы
if (isset($_GET['page']))
{
    $page = (int)$_GET['page'];
    if($page < 1 || $page > $count_pages) $page = 1;
}
else
{
    $page = 1;
}

// начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);
/*=========Пагинация==========*/

$get_orders_admin = get_orders_admin($start_pos, $perpage, $filter_query);
//var_dump($get_orders_admin);
//exit;

require_once TMP_ADM . $view .'.php';