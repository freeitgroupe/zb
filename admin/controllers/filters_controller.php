<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";


//количество фильтров на страницу
$count_filters_admin = count_filters_admin();


// кол-во новостей на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

// необходимое кол-во страниц
$count_pages = ceil($count_filters_admin / $perpage);

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

$get_filters_admin = get_filters_admin($start_pos, $perpage);
//debug_arr($get_filters_admin);exit;

//Удаление
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении!']));

    $delete_filter_res = delete_filter_res($pages_id);
    if (!$delete_filter_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

//Орабатіваем пост данные на редактирование имени фильтра
if(isset($_POST['param_name']) && $_POST['param_id'] && ($_POST['submit'] == 'event_rename')){

    $param_name =clear_string($_POST['param_name']);
    $param_id = (int)$_POST['param_id'];


    if (strlen($param_name) < 2 || strlen($param_name) > 40)
        exit(json_encode(['pages_mess'=>'Укажите имя  от 2-х до 40 символов!']));

    //Достаем имя фильтра
    $param_id_title = param_id_title($param_id);

    if(!$param_id_title)
        exit(json_encode(['pages_mess'=>'Ошибка при редактировании 1!']));
        //debug_arr($param_id_title);exit;
    
    if(!$param_id)
        exit(json_encode(['pages_mess'=>'Ошибка при редактировании 2!']));
    
    //Переименовываем фильтр, возвращаем имя фильтра
    $edit_event_ajax_rename = edit_event_ajax_rename($param_name, $param_id_title);

    if (!$edit_event_ajax_rename)
        exit(json_encode(['pages_mess'=>'Ошибка обновления данных!']));

    exit(json_encode(['success_result'=>'true', 'param_response_name'=>$edit_event_ajax_rename ]));
}

require_once TMP_ADM . $view .'.php';
