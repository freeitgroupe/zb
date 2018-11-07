<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Формирование таблицы с наименованием менеджеров//
//Количество данных в таблице
$count_data_admin = countRowTable('team_admin_users');

//Выборка параметров из бд
$get_data_admin_access = find_all_from_table('team_admin_access');
//debug_arr($get_data_admin_access);
//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

//необходимое кол-во страниц
$count_pages = ceil($count_data_admin / $perpage);

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
/*=========Пагинация==========*/
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);

$get_data_admin = get_pagination_param('team_admin_users', 'id', 'ASC', $start_pos, $perpage, "SELECT `team_admin_users`.*, `team_admin_access`.id AS team_admin_access_id, `team_admin_access`.team_name FROM `team_admin_users` LEFT JOIN `team_admin_access` ON `team_admin_users`.admin_access_id=`team_admin_access`.id ORDER BY `id` LIMIT {$start_pos}, {$perpage}");
//debug_arr($get_data_admin);
if(!isset($_SESSION['data'])){
    createSessionEmptyData('data',['login','email','name', 'start_time_work','phone','ext_phone','age','date_birth','education','admin_access_id']);
}

//debug_arr($_SESSION);

if(isset($_POST['create_user'])){
    //debug_arr($_POST);
    //exit;
    $res_data_create = res_create_user($_POST);
    if($res_data_create){
        header("Location: /admin/team/");
        exit;
    }
    header("Location: /admin/team/");
    exit;
}

if(!$get_data_admin){$get_data_admin = 'No data for views';}
require_once TMP_ADM . $view .'.php';