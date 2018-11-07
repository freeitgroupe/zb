<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Создание нового дисконта
if(isset($_POST['create_discount'])){
    //debug_arr($_POST);exit;
    if(!isset( $_SESSION['message']['error'])) createSessionEmptyData('message',['error']);
    if(!isset( $_SESSION['message']['success'])) createSessionEmptyData('message',['success']);

    $time = clear_string($_POST['rangeTime']);
    //получаем время в массиве
    //$time_arr = return ['timeStart'=>'2018-02-02 00:00:00', 'timeEnd'=>'2018-02-03 00:00:00'];
    $time_arr = checkRangeFormatDate($time);

    //генерирование кодов для дисконта
    $generationCode = gen_code(12);

    //обрабатываем данные
    $resCreateDiscount = addDataToTable('discount', ['title'=>$_POST['title'], 'start_date'=>$time_arr['timeStart'], 'end_date'=>$time_arr['timeEnd'], 'percent'=>floatval($_POST['percent']),  'status_active'=>$_POST['status_active']], ['title', 'percent']);

    if(!$resCreateDiscount){
        $_SESSION['message']['error'] .= 'Error create Discount.</br>';
        header("Location: /admin/discount");
        exit;
    }
    $maxId = maxParamInTable('discount', 'id');

    //Формируем alias,
    $alias = get_alias('discount', 'alias', clear_string($_POST['title']), $maxId);
    //Записываем алиас
    $resUpdateAlias = editDataInTable('discount', ['alias'=>$alias],['id'=>$maxId], ['=']);
    //Записываем код скидки
    $resCreateDiscountCode = addDataToTable('discount_code', ['number'=>$generationCode,'discount_id'=>$maxId]);
    if(!$resCreateDiscountCode){
        $_SESSION['message']['error'] .= 'Error create Discount code.</br>';
        header("Location: /admin/discount");
        exit;
    }
}


//Формирование таблицы с наименованием пользователей//
//Количество данных в таблице
$count_data_admin = countRowTable('discount');
//debug_arr($count_stock_admin);
//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;
//необходимое кол-во страниц
$count_pages = ceil($count_data_admin / $perpage);
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
/*=========Пагинация==========*/
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);

$get_data_admin = get_pagination_param('discount', 'id', 'ASC', $start_pos, $perpage);
//var_dump($get_data_admin);
require_once TMP_ADM . $view .'.php';

