<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//массив для заполнения данными фильтра
$arr_filter = [];

//query filter string
$filter_query = '';

if(!isset($_SESSION['filter'])) {
    $_SESSION['filter']['state_id'] = '' ;
    $_SESSION['filter']['city'] = '' ;
    $_SESSION['filter']['tax_summ'] = '' ;
    $_SESSION['filter']['official_registration'] = '' ;

}
//если был выполнен поисковой запрос
if(isset($_GET['searchButton'])){
    $arr_filter = $_GET;
    //debug_arr($arr_filter);
    $filter_query = filter_query_warehouse($arr_filter);
    //debug_arr($filter_query);
    //exit;
}
//количество складов
$count_warehouse_admin = count_warehouse_admin($filter_query);
//debug_arr($count_warehouse_admin);
//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

//необходимое кол-во страниц
$count_pages = ceil($count_warehouse_admin / $perpage);

//минимум 1 страница
if (!$count_pages) $count_pages = 1;
//если больше одной страницы
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

$get_warehouse_admin = get_warehouse_admin($start_pos, $perpage, $filter_query);
//var_dump($get_warehouse_admin);

//Удаление страниц
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении старницы!']));

    $delete_pages_res = delete_pages_res($pages_id);
    if (!$delete_pages_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления старницы!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

require_once TMP_ADM . $view .'.php';