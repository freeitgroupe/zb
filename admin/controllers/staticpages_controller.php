<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Формируем массив страниц
$get_edit_pages = get_edit_pages();
//debug_arr($get_edit_pages);

// Формирование таблицы с наименованием акций//
//количество продуктов
$count_pages_admin = countRowTable('pages');
//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;
//необходимое кол-во страниц
$count_pages = ceil($count_pages_admin / $perpage);
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
$get_pages_admin = get_pagination_param('pages', 'page_id', 'ASC', $start_pos, $perpage);
//$get_pages_admin = renameParam($get_pages_admin,'status',[0=>'draft', 1=>'public']);
//debug_arr($get_pages_admin);
if(!$get_pages_admin){$get_pages_admin = 'No shares for goods';}

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
//Скрытие страницы из раздела меню
if(isset($_POST['hide_pages_id']) && $_POST['submit'] == 'hide_pages'){
    $pages_id =(int)$_POST['hide_pages_id'];
    if (!$pages_id)
        exit(json_encode(['hide_pages_mess'=>'Ошибка при скрытии старницы!']));

    $hide_pages_res = hide_pages_res($pages_id);
    if (!$hide_pages_res)
        exit(json_encode(['hide_pages_mess'=>'Ошибка после запроса скрытия старницы!']));

    exit(json_encode(['hide_pages_res'=>'true']));
}
//Отображение страницы из раздела меню
if(isset($_POST['show_pages_id']) && $_POST['submit'] == 'show_pages') {
    $pages_id = (int)$_POST['show_pages_id'];
    if (!$pages_id)
        exit(json_encode(['show_pages_mess' => 'Ошибка при оторажении старницы!']));

    $show_pages_res = show_pages_res($pages_id);
    if (!$show_pages_res)
        exit(json_encode(['show_pages_mess' => 'Ошибка после запроса отображения старницы!']));

    exit(json_encode(['show_pages_res' => 'true']));
}




require_once TMP_ADM . $view .'.php';