<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//массив для заполнения данными фильтра
$arr_filter = [];

//query filter string
$filter_query = '';

if(!isset($_SESSION['filter'])) {
    $_SESSION['filter']['state_id'] = '' ;
    $_SESSION['filter']['category_id'] = '';
    $_SESSION['filter']['available'] = '';
    $_SESSION['filter']['stock_id'] = '';
    $_SESSION['filter']['upsell_product'] = '';
    $_SESSION['filter']['id'] = '';
    $_SESSION['filter']['article'] = '';
    $_SESSION['filter']['start_price'] ='';
    $_SESSION['filter']['end_price'] ='';
}
//если был выполнен поисковой запрос
if(isset($_GET['searchButton'])){
    $arr_filter = $_GET;
    $filter_query = filter_query($arr_filter);
}

//Список категорий
$category = get_category();
$category_tree = map_tree($category);

//Формируем список категорий
$category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_product.php', $tab='',['active_category'=>$_SESSION['filter']['category_id']]);

//количество продуктов
$count_product_admin = count_product_admin($filter_query);

//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

//необходимое кол-во страниц
$count_pages = ceil($count_product_admin / $perpage);

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

$get_product_admin = get_product_admin($start_pos, $perpage, $filter_query);
//выбираем уникальном значении
$new_arr=[];
foreach ($get_product_admin['result_query'] as $k=>$v){
    $new_arr[$v['id']] = $v;
    //echo $new_arr[$item['id']];
}
//debug_arr($new_arr);
//$get_product_admin['result_query'] = $new_arr;
//Удаление
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении!']));

        //relation table with product

    $delete_product_res = delete_product_res($pages_id);
    if (!$delete_product_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}
//Скрытие
if(isset($_POST['hide_pages_id']) && $_POST['submit'] == 'hide_pages'){
    $pages_id =(int)$_POST['hide_pages_id'];
    if (!$pages_id)
        exit(json_encode(['hide_pages_mess'=>'Ошибка при скрытии!']));

    $hide_product_res = hide_product_res($pages_id);
    if (!$hide_product_res)
        exit(json_encode(['hide_pages_mess'=>'Ошибка после запроса скрытия!']));

    exit(json_encode(['hide_pages_res'=>'true']));
}
//Отображение
if(isset($_POST['show_pages_id']) && $_POST['submit'] == 'show_pages') {
   
    $pages_id = (int)$_POST['show_pages_id'];
    if (!$pages_id)
        exit(json_encode(['show_pages_mess' => 'Ошибка при оторажении!']));
   
    $id_category_for_product = id_category_for_product($pages_id);
    //exit(debug_arr($id_category_for_product));
    if (!$id_category_for_product)
        exit(json_encode(['show_pages_mess' => 'Ошибка при запросе категории продукта!']));    
    
    $check_hide_category_for_product = check_hide_category_for_product($id_category_for_product);
    //exit( $check_hide_category_for_product);
    if (!$check_hide_category_for_product)
        exit(json_encode(['show_pages_mess' => 'Ошибка при проверке активности категории продукта!']));
    
    if($check_hide_category_for_product == 'hide')
        exit(json_encode(['show_pages_mess' => 'Активировать продукт невозможно, так как категория продукта скрыта или удалена!']));

    $show_product_res = show_product_res($pages_id);
    if (!$show_product_res)
        exit(json_encode(['show_pages_mess' => 'Ошибка после запроса отображения!']));

    exit(json_encode(['show_pages_res' => 'true']));
}

require_once TMP_ADM . $view .'.php';
