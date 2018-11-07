<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//количество категорий
$count_category_admin = count_category_admin();

//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

//необходимое кол-во страниц
$count_pages = ceil($count_category_admin / $perpage);

//минимум 1 страница
if (!$count_pages) $count_pages = 1;
//если больше одной страницы

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
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);
/*=========Пагинация==========*/

$get_edit_category_products = get_category_admin($start_pos, $perpage);
//debug_arr($get_product_admin);

//Формируем массив самостоятельных категорий для товаров
//$get_edit_category_products = get_edit_category_products();


//debug_arr( separate_category(14));
//debug_arr(category_product_empty(1)); exit;
//debug_arr($get_edit_category_products);

//Удаление категории товаров
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Error delete error!']));

    //проверяем наличие подкатегорий в выбраннной категории

    $get_empty_subcategory_product = get_empty_subcategory_product($pages_id);
    
    //debug_arr($get_subcategory_product);exit;
    if(!$get_empty_subcategory_product)
        exit(json_encode(['delete_pages_mess'=>'Error search child category!']));

    if($get_empty_subcategory_product == 'not empty')
        exit(json_encode(['delete_pages_mess'=>'This category contains subcategories! Delete the subcategories!']));
    
    //проверяем есть ли продукты в данной категории, если есть тогда скрываем их и обнуляем категорию
    $category_product_empty = category_product_empty($pages_id);

    if(!$category_product_empty)
        exit(json_encode(['delete_pages_mess'=>'An error occurred while searching for products in the selected category!']));

    if($category_product_empty == 'not empty'){
       $hide_product_for_cat = hide_product_for_cat($pages_id);
        if(!$hide_product_for_cat)
            exit(json_encode(['delete_pages_mess'=>'An error occurred while hiding the goods of the selected category!']));
    }

    $delete_pages_res = delete_category_products($pages_id);
    if (!$delete_pages_res)
        exit(json_encode(['delete_pages_mess'=>'Error after delete request!']));

    exit(json_encode(['delete_pages_res'=>'true']));
}

//Скрытие категории
if(isset($_POST['hide_pages_id']) && $_POST['submit'] == 'hide_pages'){
    $pages_id =(int)$_POST['hide_pages_id'];
    if (!$pages_id)
        exit(json_encode(['hide_pages_mess'=>'Error hiding!']));

    //проверяем наличие подкатегорий в выбраннной категории
    $get_empty_subcategory_product = get_empty_subcategory_product($pages_id);


    //debug_arr($get_subcategory_product);exit;
    if(!$get_empty_subcategory_product)
        exit(json_encode(['hide_pages_mess'=>'Error searching for subcategories!']));

    if($get_empty_subcategory_product == 'not empty'){
        $hide_sub_cat_res = hide_sub_cat_res($pages_id);
        if(!$hide_sub_cat_res)
            exit(json_encode(['hide_pages_mess'=>'Error hiding product subcategories!']));
    }

    //проверяем есть ли продукты в данной категории, если есть тогда скрываем их
    $category_product_empty = category_product_empty($pages_id);

    if(!$category_product_empty)
        exit(json_encode(['hide_pages_mess'=>'An error occurred while searching for products in the selected category!']));

    if($category_product_empty == 'not empty'){
        $hide_product_for_cat = hide_product_for_cat($pages_id);
        if(!$hide_product_for_cat)
            exit(json_encode(['hide_pages_mess'=>'An error occurred while hiding the goods of the selected category!']));
    }

    $hide_pages_res = hide_category_products($pages_id);
    if (!$hide_pages_res)
        exit(json_encode(['hide_pages_mess'=>'Error after hiding request!']));

    exit(json_encode(['hide_pages_res'=>'true']));
}

//Отображение категории
if(isset($_POST['show_pages_id']) && $_POST['submit'] == 'show_pages') {

    $pages_id = (int)$_POST['show_pages_id'];
    if (!$pages_id)
        exit(json_encode(['show_pages_mess' => 'An error occurred during the launching of the page!']));

    //Является категория самостоятельной если нет тогда
    $separate_category = separate_category($pages_id);
    if (!$separate_category)
        exit(json_encode(['show_pages_mess' => 'Error after querying for subcategoria!']));

    //Если категория самостоятельная
    if($separate_category == 'separate'){

        //проверяем есть ли продукты в данной категории, если есть тогда скрываем их
        $category_product_empty = category_product_empty($pages_id);
        if(!$category_product_empty)
            exit(json_encode(['show_pages_mess'=>'An error occurred while searching for products in the selected category!']));

        if($category_product_empty == 'not empty'){
            $show_product_for_cat = show_product_for_cat($pages_id);
            if(!$show_product_for_cat)
                exit(json_encode(['show_pages_mess'=>'An error occurred while activating the goods of the selected category!']));
        }

        $show_pages_res = show_category_products($pages_id);
        if (!$show_pages_res)
            exit(json_encode(['show_pages_mess' => 'Error after querying category display!']));

        exit(json_encode(['show_pages_res' => 'true']));
    }

    //Если категория содержит родителя
    if($separate_category > false && $separate_category != 'separate'){

        $pages_parent_id = (int)$separate_category;

        $hide_parent_category = hide_parent_category($pages_parent_id);

        if (!$hide_parent_category)
            exit(json_encode(['show_pages_mess' => 'Error after checking for activity of higher categories!']));

        if($hide_parent_category == 'hide'){
            exit(json_encode(['show_pages_mess' => 'To display a subcategory, activate the parent category!']));
        }

        if($hide_parent_category == 'show'){
            //проверяем есть ли продукты в данной категории, если есть тогда скрываем их
            $category_product_empty = category_product_empty($pages_id);
            if(!$category_product_empty)
                exit(json_encode(['show_pages_mess'=>'An error occurred while searching for products in the selected category!']));

            if($category_product_empty == 'not empty'){
                $show_product_for_cat = show_product_for_cat($pages_id);
                if(!$show_product_for_cat)
                    exit(json_encode(['show_pages_mess'=>'An error occurred while hiding the goods of the selected category!']));
            }
            $show_pages_res = show_category_products($pages_id);
            if (!$show_pages_res)
                exit(json_encode(['show_pages_mess' => 'Error after querying category display!']));

            exit(json_encode(['show_pages_res' => 'true']));
        }
    }

        //Скрыта или нет вышестоящая категория, если нет тогда показываем категорию



}

require_once TMP_ADM . $view .'.php';