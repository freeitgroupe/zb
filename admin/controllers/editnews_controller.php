<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match) || $match['pages_id'] == false) header("Location: /admin");

//Категории для новостей
$category_news = category_news();

if($match['pages_id'] != 'new') {
    $pages_id = (int)$match['pages_id'];
    $news_info_for_edit = news_info_for_edit($pages_id);
    if(!$news_info_for_edit) header("Location: /admin/news-options");
    //debug_arr($category_news); exit;

    //Данные для формы редактированияия старницы
    $form_edit = [
        ['type' => 'input', 'label' => 'Заголовок новости', 'name_input' => 'title', 'value' => $news_info_for_edit['title'], 'placeholder' => 'Заголовок новости', 'required' => 'required', 'helpblock' => 'true'],

        ['type' => 'input', 'label' => 'Дата публикации', 'name_input' => 'date', 'value' => $news_info_for_edit['date'], 'placeholder' => 'Дата публикации','required' => 'required', 'helpblock' => 'true', 'id'=>'datepicker'],

        ['type' => 'textarea', 'label' => 'Содержание', 'name_input' => 'description', 'value' => $news_info_for_edit['description'], 'placeholder' => '', 'required' => 'required', 'helpblock' => 'true'],

        ['type' => 'img', 'src' => $news_info_for_edit['img']],

        ['type' => 'file', 'label' => 'Прикрепить новое изображение', 'name_input' => 'img'],

        ['type' => 'input', 'label' => 'Ключевые слова', 'name_input' => 'm_keywords', 'value' => $news_info_for_edit['m_keywords'], 'placeholder' => 'Ключевые слова'],

        ['type' => 'input', 'label' => 'Ключевое описание', 'name_input' => 'm_description', 'value' => $news_info_for_edit['m_description'], 'placeholder' => 'Ключевое описание'],

        ['type' => 'select', 'label' => 'Отображение новости', 'name_input' => 'view', 'value_selected' => $news_info_for_edit['view'], 'option_value' => ['0', '1'], 'option_title' => ['Скрыта', 'Показана']],

        ['type' => 'select_category', 'label' => 'Категория для новостей', 'name_input' => 'cat_news', 'value_selected' => $news_info_for_edit['category_news_id'], 'option_value' => $category_news],

        ['type' => 'input', 'label' => 'Алиас', 'name_input' => 'alias', 'value' => $news_info_for_edit['alias'], 'placeholder' => 'Алиас'],

        ['type' => 'input', 'label' => 'Автор новости', 'name_input' => 'author', 'value' => $news_info_for_edit['author'], 'disabled'=>'true'],

        ['type' => 'submit', 'name' => 'edit_news_success', 'value' => 'Подтвердить'],
    ];

    if (isset($_POST['edit_news_success'])) {
        //var_dump($_POST); exit();
        //var_dump( $_FILES);
        //exit();
        $arr_post = $_POST;
        $edit_news_res = edit_news_res($pages_id, $arr_post);
        if (!$edit_news_res) {
            header("Location: /admin/edit-news/" . $pages_id);
            exit();
        }
        header("Location: /admin/news-options/");
        exit();
    }
    //debug_arr($form_edit);
}
//Создание новости
if($match['pages_id'] == 'new'){
    $pages_id = 'new';
    //формирование сессионных переменных
    if(!isset($_SESSION['data'])){
        $_SESSION['data']['title'] = '';
        $_SESSION['data']['description'] = '';
        $_SESSION['data']['date'] = '';
        $_SESSION['data']['m_keywords'] = '';
        $_SESSION['data']['m_description'] = '';
        $_SESSION['data']['alias'] = '';
        $_SESSION['data']['view'] = '';
        $_SESSION['data']['cat_news'] = '';
    }

    if (isset($_POST['new_news_success'])) {

        $arr_post = $_POST;
        //debug_arr($_POST);
        //debug_arr($_FILES);
        //exit;
        $new_pages_res = new_news_res($arr_post);

        if (!$new_pages_res) {
            header("Location: /admin/edit-news/" . $pages_id);
            exit();
        }
        if($new_pages_res){
            header("Location: /admin/news-options/");
            exit();
        }
    }

    $form_edit = [
        ['type' => 'input', 'label' => 'Заголовок новости', 'name_input' => 'title', 'value' => $_SESSION['data']['title'], 'placeholder' => 'Заголовок новости', 'required' => 'required', 'helpblock' => 'true'],

        ['type' => 'input', 'label' => 'Дата публикации', 'name_input' => 'date', 'value' => $_SESSION['data']['date'], 'placeholder' => 'Дата публикации','required' => 'required', 'helpblock' => 'true', 'id'=>'datepicker'],

        ['type' => 'textarea', 'label' => 'Содержание', 'name_input' => 'description', 'value' => $_SESSION['data']['description'], 'placeholder' => '', 'required' => 'required', 'helpblock' => 'true'],

        ['type' => 'file', 'label' => 'Прикрепить изображение', 'name_input' => 'img'],

        ['type' => 'input', 'label' => 'Ключевые слова', 'name_input' => 'm_keywords', 'value' => $_SESSION['data']['m_keywords'], 'placeholder' => 'Ключевые слова'],

        ['type' => 'input', 'label' => 'Ключевое описание', 'name_input' => 'm_description', 'value' => $_SESSION['data']['m_description'], 'placeholder' => 'Ключевое описание'],

        ['type' => 'select', 'label' => 'Отображение новости', 'name_input' => 'view', 'value_selected' => $_SESSION['data']['view'], 'option_value' => ['0', '1'], 'option_title' => ['Скрыта', 'Показана']],

        ['type' => 'select_category', 'label' => 'Категория для новостей', 'name_input' => 'cat_news', 'value_selected' => $_SESSION['data']['cat_news'], 'option_value' => $category_news],

        ['type' => 'input', 'label' => 'Алиас', 'name_input' => 'alias', 'value' => $_SESSION['data']['alias'], 'placeholder' => 'Алиас'],

        ['type' => 'input', 'label' => 'Автор новости', 'name_input' => 'author', 'value' => $_SESSION['auth_email'], 'disabled'=>'true'],
        ['type' => 'submit', 'name' => 'new_news_success', 'value' => 'Подтвердить'],
    ];
}

require_once TMP_ADM . $view .'.php';