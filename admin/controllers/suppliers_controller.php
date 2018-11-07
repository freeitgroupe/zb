<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//массив для заполнения данными фильтра
$arr_filter = [];
//query filter string
$filter_query = startSearchParam();
//Создание сессионной переменной для фильтрации данных
if(!isset($_SESSION['filter'])){createSessionData('filter',['title'=>'','state'=>'','city'=>'','zip_code'=>'','email'=>'',]);}

//если был выполнен поисковой запрос
if(isset($_GET['searchButton'])){
    $arr_filter = $_GET;
    $filter_query = filter_query_suppliers($arr_filter);
}
//Формируем массив страниц
$count_suppliers_admin = count_suppliers_admin($filter_query);
//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;
//необходимое кол-во страниц
$count_pages = ceil($count_suppliers_admin/$perpage);
//минимум 1 страница
if (!$count_pages) $count_pages = 1;
//если больше одной страницы

$page_count = page_count($count_pages);
// получение текущей страницы
if(isset($_GET['page'])) {
    $page = (int)$_GET['page'];
    if($page < 1 || $page > $count_pages) $page = 1;
} else {
    $page = 1;
}
// начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);
/*=========Пагинация==========*/
$get_suppliers_admin = get_suppliers_admin($start_pos, $perpage, $filter_query);
$get_pages_admin = get_pagination_param('suppliers', 'supplier_id', 'ASC', $start_pos, $perpage);
//debug_arr($get_pages_admin);
if(!$get_pages_admin){$get_pages_admin = 'No data!';}

//Удаление поставщиков
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Error delete!']));

    $delete_pages_res = deleteSuppliersRes($pages_id);
    if (!$delete_pages_res)
        exit(json_encode(['delete_pages_mess'=>'Error send delete!']));

    $deleteRelSuppliersProdRes = deleteRelSuppliersProdRes($pages_id);
    if ($deleteRelSuppliersProdRes === false)
        exit(json_encode(['delete_pages_mess'=>'Error send delete!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

require_once TMP_ADM . $view .'.php';