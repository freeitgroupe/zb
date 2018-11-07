<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Формируем массив категорий
$get_edit_category_news = get_edit_category_news();
//debug_arr($get_edit_category_news);

//Удаление
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении старницы!']));

    $delete_category_news_res = delete_category_news_res($pages_id);
    if (!$delete_category_news_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления старницы!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

//Скрытие
if(isset($_POST['hide_pages_id']) && $_POST['submit'] == 'hide_pages'){
    $pages_id =(int)$_POST['hide_pages_id'];
    if (!$pages_id)
        exit(json_encode(['hide_pages_mess'=>'Ошибка при скрытии старницы!']));

    $hide_category_news_res = hide_category_news_res($pages_id);
    if (!$hide_category_news_res)
        exit(json_encode(['hide_pages_mess'=>'Ошибка после запроса скрытия старницы!']));

    exit(json_encode(['hide_pages_res'=>'true']));
}

//Отображение
if(isset($_POST['show_pages_id']) && $_POST['submit'] == 'show_pages') {
    $pages_id = (int)$_POST['show_pages_id'];
    if (!$pages_id)
        exit(json_encode(['show_pages_mess' => 'Ошибка при оторажении старницы!']));

    $show_category_news_res = show_category_news_res($pages_id);
    if (!$show_category_news_res)
        exit(json_encode(['show_pages_mess' => 'Ошибка после запроса отображения старницы!']));

    exit(json_encode(['show_pages_res' => 'true']));
}


if(array_key_exists('pages_id', $match) && $match['pages_id'] > 0) {
    $pages_id = (int)$match['pages_id'];
    if(!$pages_id){
        $pages_id = 1;
    }

    //загружаем шаблон редактирования скрипта

    //require_once TMP_ADM .  .'.php';   

    //Останавливаем выполнение скрипта
    //exit();
}
//echo $pages_id;

require_once TMP_ADM . $view .'.php';

