<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

/*
 * Используем 2 разных view-шаблона для редактирования страницы(editpages) и добавления(addpages) страницы
 * */
if(!array_key_exists('pages_id', $match)) header("Location:" . PATH_ADMIN . 'edit-pages/');

if($match['pages_id'] != 'new') {
    if(!$pages_id=(int)$match['pages_id']) header("Location:" . PATH_ADMIN . 'edit-pages/');
    if(!$find_one_data = findOneParam('pages', 'page_id', $pages_id)) header("Location:" . PATH_ADMIN . 'edit-pages/');
    $pages_info_for_edit = pages_info_for_edit($pages_id);
    if(!$pages_info_for_edit) header("Location: /admin/static-pages");
    //debug_arr($pages_info_for_edit);

    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        $edit_pages_res = edit_pages_res($pages_id, $arr_post);
        if (!$edit_pages_res) {
            header("Location: /admin/edit-pages/" . $pages_id);
            exit();
        }
        header("Location: /admin/static-pages/");
        exit();
    }
    require_once TMP_ADM . $view .'.php';
}
//Создание новой страницы
if($match['pages_id'] == 'new'){
    $pages_id = 'new';
    //формирование сессионных переменных
    if(!isset($_SESSION['data'])){
        $createSessionParam = createSessionData('data',['title'=>'','alias'=>'','meta_d'=>'','meta_k'=>'','text'=>'', 'status'=>'', 'position'=>'', 'parent_section'=>'']);
    }

    if (isset($_POST['new_pages_success']) && $_POST['new_pages_success'] > false) {
        $arr_post = $_POST;
        $new_pages_res = new_pages_res($arr_post);
        if (!$new_pages_res) {
            header("Location: /admin/edit-pages/" . $pages_id);
            exit();
        }
        if($new_pages_res){
            header("Location: /admin/static-pages/");
            exit();
        }
    }
    require_once TMP_ADM . 'addpages' .'.php';
}

