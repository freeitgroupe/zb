<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";


//количество новостей
$count_news_admin = count_news_admin();

// кол-во новостей на страницу
$perpage = (isset($_COOKIE['per_page_news']) && (int)$_COOKIE['per_page_news']) ? $_COOKIE['per_page_news'] : PERPAGE;

// необходимое кол-во страниц
$count_pages = ceil($count_news_admin / $perpage);
// минимум 1 страница
if (!$count_pages) $count_pages = 1;

// получение текущей страницы
if (isset($_GET['page']))
{    
    $page = (int)$_GET['page'];
    if ($page < 1) $page = 1;
} 
else
{
    $page = 1;
}

// начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;

$pagination = pagination($page, $count_pages);

/*=========Пагинация==========*/

$get_news_admin = get_news_admin($start_pos, $perpage);
//debug_arr($news_admin);

//Удаление
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении!']));

    $delete_news_res = delete_news_res($pages_id);
    if (!$delete_news_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

//Скрытие
if(isset($_POST['hide_pages_id']) && $_POST['submit'] == 'hide_pages'){
    $pages_id =(int)$_POST['hide_pages_id'];
    if (!$pages_id)
        exit(json_encode(['hide_pages_mess'=>'Ошибка при скрытии!']));

    $hide_news_res = hide_news_res($pages_id);
    if (!$hide_news_res)
        exit(json_encode(['hide_pages_mess'=>'Ошибка после запроса скрытия!']));

    exit(json_encode(['hide_pages_res'=>'true']));
}

//Отображение
if(isset($_POST['show_pages_id']) && $_POST['submit'] == 'show_pages') {
    $pages_id = (int)$_POST['show_pages_id'];
    if (!$pages_id)
        exit(json_encode(['show_pages_mess' => 'Ошибка при оторажении!']));

    $show_news_res = show_news_res($pages_id);
    if (!$show_news_res)
        exit(json_encode(['show_pages_mess' => 'Ошибка после запроса отображения!']));

    exit(json_encode(['show_pages_res' => 'true']));
}


if(array_key_exists('pages_id', $match) && $match['pages_id'] > 0) {
    $pages_id = (int)$match['pages_id'];
    if(!$pages_id){
        $pages_id = 1;
    }

}

require_once TMP_ADM . $view .'.php';