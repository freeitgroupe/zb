<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match) || $match['pages_id'] == false) header("Location: /admin");

if($match['pages_id'] != 'new') {
    $pages_id = (int)$match['pages_id'];
    $category_news_info_for_edit = category_news_info_for_edit($pages_id);
    if(!$category_news_info_for_edit) header("Location: /admin/category-options");
    //debug_arr($_SERVER);

    //Данные для формы
    $form_edit = [
        [
            'type' => 'input',
            'label' => 'Название категории',
            'name_input' => 'title',
            'value' => $category_news_info_for_edit['title'],
            'placeholder' => 'Название категории',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'input',
            'label' => 'Алиас страницы',
            'name_input' => 'alias',
            'value' => $category_news_info_for_edit['alias'],
            'placeholder' => 'Алиас страницы',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'select',
            'label' => 'Отображение страницы',
            'name_input' => 'view', 'value_selected' => $category_news_info_for_edit['view'],
            'option_value' => ['0', '1'],
            'option_title' => ['Показана', 'Скрыта']
        ],

        [
            'type' => 'submit',
            'name' => 'edit_pages_success',
            'value' => 'Подтвердить'
        ],
    ];

    if (isset($_POST['edit_pages_success']) && $_POST['edit_pages_success'] > false) {
        $arr_post = $_POST;
        $edit_category_news_res = edit_category_news_res($pages_id, $arr_post);
        if (!$edit_pages_res) {
            header("Location: /admin/edit-category-news/" . $pages_id);
            exit();
        }
        header("Location: /admin/category-options/");
        exit();
    }
    //debug_arr($form_edit);
}

//Создание новой страницы
if($match['pages_id'] == 'new'){
    $pages_id = 'new';

    //формирование сессионных переменных
    if(!isset($_SESSION['new_pages'])){
        $_SESSION['new_pages']['title'] = '';
        $_SESSION['new_pages']['alias'] = '';      
        $_SESSION['new_pages']['view'] = '';
    }

    if (isset($_POST['new_pages_success']) && $_POST['new_pages_success'] > false) {
        $arr_post = $_POST;

        $new_category_news_res = new_category_news_res($arr_post);

        if (!$new_category_news_res) {
            header("Location: /admin/edit-category-news/" . $pages_id);
            exit();
        }

        if($new_category_news_res){
            header("Location: /admin/category-options/");
            exit();
        }

    }

    $form_edit = [
        [
            'type' => 'input',
            'label' => 'Название категории',
            'name_input' => 'title',
            'value' => $_SESSION['new_pages']['title'],
            'placeholder' => 'Название категории',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'input',
            'label' => 'Алиас страницы',
            'name_input' => 'alias',
            'value' => $_SESSION['new_pages']['alias'],
            'placeholder' => 'Алиас страницы',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'select',
            'label' => 'Отображение страницы',
            'name_input' => 'view', 'value_selected' => $_SESSION['new_pages']['view'],
            'option_value' => ['0', '1'],
            'option_title' => ['Показана', 'Скрыта']
        ],

        [
            'type' => 'submit',
            'name' => 'new_pages_success',
            'value' => 'Подтвердить'
        ],
    ];

}

require_once TMP_ADM . $view .'.php';