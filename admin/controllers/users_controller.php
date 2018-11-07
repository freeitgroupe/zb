<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Формирование таблицы с наименованием пользователей//
//Количество данных в таблице
$count_data_admin = countRowTable('users');
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

$get_data_admin = get_pagination_param('users', 'id', 'ASC', $start_pos, $perpage, "SELECT `users`.*, round(SUM(`orders`.sum),2) as `sum` FROM `users` LEFT JOIN `orders` ON `users`.id=`orders`.user_id GROUP BY `users`.id ORDER BY `id` LIMIT {$start_pos}, {$perpage}");
//debug_arr($get_data_admin);
if(!$get_data_admin){$get_data_admin = 'No data for views';}
require_once TMP_ADM . $view .'.php';