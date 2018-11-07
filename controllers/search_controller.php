<?php
defined("CATALOG") or die("Access denied");
require_once "main_controller.php";
require_once "models/{$view}_model.php";

//Заголовок
$title_header .= "Search";

//Выбор категории для поиска
if(isset($_POST['category_search']) && $_POST['category_search'] > '')
    {
        $category_search = $_POST['category_search'];
        //проверка и выбор категории
        $category_for_search = category_for_search($category_search);
        $_SESSION['category_search'] = $category_for_search;
        exit();
    }

//Смотрим гет запрос поиска
if(isset($_GET['term']))
    {
        if(!isset($_SESSION['category_search'])){$_SESSION['category_search'] ='';}
        $result_search = search_autocomplete($_SESSION['category_search']);
        exit(json_encode($result_search));
    }
elseif(isset($_GET['search']) && $_GET['search'])
    {
        //запрос каегории для поиска
        if(!isset($_GET['category']))
        {
            $category_search = 0;
        }
        else
        {
            $category_search = $_GET['category'];
        }

        $_SESSION['search'] = clear_string($_GET['search']);
        $text_search = $_GET['search'];

        //выборка категорий для поиска от родительской к дочерней
        $category_for_search = category_for_search($category_search);


        //Обработка данных при нажатии на кнопку подгрузка товара
        if(isset($_POST['num_page_product']))
        {
            $num_page_product = (int)$_POST['num_page_product'];
            if(!$num_page_product) exit('false');

            $product_search_response  = product_search_response($category_for_search,$text_search,$num_page_product);
            if(!$product_search_response) exit('false');

            $page_product_html = content_to_string($product_search_response, 'page_product_html.php');
            exit($page_product_html);
        }

        //get запрос
        $num_page_product='';
        $product_search_response = product_search_response($category_for_search,$text_search, $num_page_product);

        //проверяем на пустой массив
        if(sizeof($product_search_response) == 0)
        {
            $products = 'Nothing found!';
        }
        else
        {
            $products = $product_search_response;
        }
    }
else
    {
        $products = 'Nothing found!';
    }

//$breadcrumbs = "<a href='" .PATH. "'>Главная</a> / Результат поиска";

include 'libs/breadcrumbs.php';
$breadcrumbs .='<a href="#">Search</a>';
require_once "views/{$view}.php";