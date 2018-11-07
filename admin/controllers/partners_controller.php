<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";


//количество новостей
$count_partners_admin = count_partners_admin();
//$obj_db = Model_Driver::get_instance();
//$arr_name=[];
//for($i=0; $i<43; $i++){
//    $z = $i . '.jpg';
//    $result = $obj_db->insert('partners', ['name','image','link', 'visible'], ['пример текста', $z, '#', 1]);
//}


//debug_arr($count_partners_admin);
//exit;

// кол-во новостей на страницу
$perpage = (isset($_COOKIE['per_page_partners']) && (int)$_COOKIE['per_page_partners']) ? $_COOKIE['per_page_partners'] : PERPAGE;

// необходимое кол-во страниц
$count_pages = ceil($count_partners_admin / $perpage);
//var_dump($count_pages);
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
//var_dump($start_pos);

/*=========Пагинация==========*/

$get_partners_admin = get_partners_admin($start_pos, $perpage);
//debug_arr($get_partners_admin);
//debug_arr($pagination);
//
//exit;

//Удаление
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
//    var_dump($_POST);
//    exit;
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении!']));

    $delete_partners_res = delete_partners_res($pages_id);
    if (!$delete_partners_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

//Скрытие
if(isset($_POST['hide_pages_id']) && $_POST['submit'] == 'hide_pages'){
    $pages_id =(int)$_POST['hide_pages_id'];
    if (!$pages_id)
        exit(json_encode(['hide_pages_mess'=>'Ошибка при скрытии!']));

    $hide_partners_res = hide_partners_res($pages_id);
    if (!$hide_partners_res)
        exit(json_encode(['hide_pages_mess'=>'Ошибка после запроса скрытия!']));

    exit(json_encode(['hide_pages_res'=>'true']));
}

//Отображение
if(isset($_POST['show_pages_id']) && $_POST['submit'] == 'show_pages') {
    $pages_id = (int)$_POST['show_pages_id'];
    if (!$pages_id)
        exit(json_encode(['show_pages_mess' => 'Ошибка при оторажении!']));

    $show_partners_res = show_partners_res($pages_id);
    if (!$show_partners_res)
        exit(json_encode(['show_pages_mess' => 'Ошибка после запроса отображения!']));

    exit(json_encode(['show_pages_res' => 'true']));
}

require_once TMP_ADM . $view .'.php';