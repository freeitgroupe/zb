<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('prod_alias', $match)) header("Location: /admin");

//Список категорий
$category = get_category();
$category_tree = map_tree($category);
//debug_arr($category_tree);
//если парент == 0 тогда - черта
//если parent > 0


function data_arr_menu($category_tree){
   if(!isset($text)){$text=''; $tab='';}
   foreach ($category_tree as $item){
       //debug_arr($item)  ;
       $text .= '<option value="">' . $item['title'] . '</option>';
       if(isset($item['childs'])){
           $text .= data_arr_menu($item['childs']);
       }
   }
   return $text;
}

//debug_arr(data_arr_menu($category_tree, $tab)); exit;

if($match['prod_alias'] != 'new'){

    $category_id = '';
    $category_alias = $match['prod_alias'];

    //Поиск id продукта по алиасу
    $category_id = findOneCategoryId($category_alias);
    $category_id = (int)$category_id;

    //если алиас не найден уходим на главную старницу
    if (!$category_id)
    {
        header("Location: /admin");
        exit();
    }


    $pages_id = $category_id;
    $category_product_for_edit = category_product_for_edit($pages_id);
    $parent_id = $category_product_for_edit['parent'];

    //Список всех фильтров
    //$get_all_filters = get_all_filters();

    //активные фильтры для категории
    //$get_choose_filter = get_choose_filter($pages_id);

    //отмечаем активные фильтры и возращаем массив с активными фильтрами
    //    if($get_choose_filter != 'empty')
    //    $get_all_filters = relation_cat_fil($get_all_filters, $get_choose_filter);
    //debug_arr($get_choose_filter);

    //debug_arr(unserialize($category_product_for_edit['additional_attribute']));
    //exit;
    
    if(!$category_product_for_edit) header("Location: /admin/category-product-options");
    $category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree.php', $tab='', ['category_info'=> $category_product_for_edit]);

    //Данные для формы
    $form_edit = [
        [
            'type' => 'input',
            'label' => 'Название категории',
            'name_input' => 'title',
            'value' => $category_product_for_edit['title'],
            'placeholder' => 'Название категории',
            'required' => 'required'
        ],

        [
            'type' => 'textarea',
            'label' => 'Описание категории',
            'name_input' => 'description',
            'value' => $category_product_for_edit['description'],
            'placeholder' => 'Описание категории',
            'required' => 'required',
        ],

        [
            'type' => 'img',
            'src' => $category_product_for_edit['image']
        ],

        [
            'type' => 'file',
            'label' => 'Прикрепить новое изображение',
            'name_input' => 'img'
        ],

        [
            'type' => 'input',
            'label' => 'Ключевые слова',
            'name_input' => 'm_keywords',
            'value' => $category_product_for_edit['m_keywords'],
            'placeholder' => 'Ключевые слова'
        ],

        [
            'type' => 'input',
            'label' => 'Ключевое описание',
            'name_input' => 'm_description',
            'value' => $category_product_for_edit['m_description'],
            'placeholder' => 'Ключевое описание'
        ],

        [
            'type' => 'select',
            'label' => 'Отображение страницы',
            'name_input' => 'view', 'value_selected' => $category_product_for_edit['view'],
            'option_value' => ['0', '1'],
            'option_title' => ['Скрыта', 'Показана']
        ],

        [
            'type' => 'select_category_product',
            'label' => 'Родительская категория',
            'name_input' => 'cat_parent',
            'value_selected' => $category_product_for_edit['parent'],
            'option_value' => $category,
            'data_tree'=>$category_menu_admin
        ],

        [
            'type' => 'submit',
            'name' => 'edit_pages_success',
            'value' => 'Подтвердить'
        ],
    ];
    
    //Конструктор формы
    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        //debug_arr( $arr_post);exit;
        $edit_category_product_res = edit_category_product_res($pages_id, $arr_post);
        if (!$edit_category_product_res) {
            header("Location: ".PATH_ADMIN."edit-category-product/" . $category_alias);
            exit();
        }
        header("Location: ".PATH_ADMIN."edit-category-product/" . $category_alias);
        exit();
    }

    if (isset($_POST['filter_for_cat__success'])) {
        $arr_post = $_POST;
       // debug_arr( $arr_post);exit;
        
        $edit_filter_category_res = edit_filter_category_res($pages_id, $arr_post);

        if (!$edit_filter_category_res) {
            header("Location: /admin/edit-category-product/" . $category_alias);
            exit();
        }

        header("Location: /admin/edit-category-product/" . $category_alias);
        exit();
    }
    //debug_arr($form_edit);
}

//добавление категории
if($match['prod_alias'] == 'new'){
    $pages_id = 'new';
    $category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree.php', $tab='', ['create_category'=>'new']);

    //формирование сессионных переменных
    if(!isset($_SESSION['data'])){
        $_SESSION['data']['title'] = '';
        $_SESSION['data']['description'] = '';
        $_SESSION['data']['brand'] = '';
        $_SESSION['data']['alias'] = '';
        $_SESSION['data']['m_keywords'] = '';
        $_SESSION['data']['m_description'] = '';
        $_SESSION['data']['view'] = $view;
        $_SESSION['data']['parent'] = '';

    }

    if (isset($_POST['new_pages_success'])) {

        $arr_post = $_POST;
        //debug_arr($arr_post);exit;
        $new_category_product_res = new_category_product_res($arr_post);

        if (!$new_category_product_res) {
            header("Location: /admin/edit-category-product/" . $pages_id);
            exit();
        }

        if($new_category_product_res){
            header("Location: /admin/category-product-options/");
            exit();
        }

    }

    //Данные для формы
    $form_edit = [
        [
            'type' => 'input',
            'label' => 'Название категории',
            'name_input' => 'title',
            'value' => $_SESSION['data']['title'],
            'placeholder' => 'Название категории',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'textarea',
            'label' => 'Описание категории',
            'name_input' => 'description',
            'value' =>  $_SESSION['data']['description'],
            'placeholder' => 'Описание категории',
            'required' => 'required',
        ],

        [
            'type' => 'file',
            'label' => 'Прикрепить изображение',
            'name_input' => 'img'
        ],

        [
            'type' => 'input',
            'label' => 'Ключевые слова',
            'name_input' => 'm_keywords',
            'value' =>  $_SESSION['data']['m_keywords'],
            'placeholder' => 'Ключевые слова'
        ],

        [
            'type' => 'input',
            'label' => 'Ключевое описание',
            'name_input' => 'm_description',
            'value' =>  $_SESSION['data']['m_description'],
            'placeholder' => 'Ключевое описание'
        ],

        [
            'type' => 'select',
            'label' => 'Отображение страницы',
            'name_input' => 'view',
            'value_selected' =>  $_SESSION['data']['view'],
            'option_value' => ['0', '1'],
            'option_title' => ['Показана', 'Скрыта']
        ],

        [
            'type' => 'select_category_product',
            'label' => 'Родительская категория',
            'name_input' => 'cat_parent',
            'create_category' => 'new',
            'data_tree'=>$category_menu_admin
        ],

        [
            'type' => 'submit',
            'name' => 'new_pages_success',
            'value' => 'Подтвердить'
        ],
    ];
}



require_once TMP_ADM . $view .'.php';