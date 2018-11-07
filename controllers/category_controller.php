<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
/*
 * Формирование id для категории
 */
if (array_key_exists('cat_alias', $match)){
    $alias = $match['cat_alias'];
    //echo $alias;
    //поиск алиаса для продукта
    $id = findOneCategoryId($alias);
    //echo $id;
    if($id){$id = (int)$id;}
}else{
    $id = 1;
    //header("Location: /");exit;
}
//Считаем количество просмотров категории
$getCountViewCategory = getCountViewCategory($id);
// ID дочерних категорий
$ids = cats_id($category, $id);
//Дочернии категории + выюранная категория
$ids = !$ids ? $id : $ids . $id ;
//Получение alias, title, только дочерних категорий
$cats_info = cats_info($ids, $id);
//debug_arr($cats_info);
//Инфо о полной ветке дочерних категорий + самостоятельная категория
$catsAllLevel = catsAllLevel(catsAllLineChilds($category, $id), $cats_info);
$catsAllLevelTree = map_tree($catsAllLevel);
$catsAllLevelTreeString = data_tree_to_string($catsAllLevelTree,  $_SERVER['DOCUMENT_ROOT'] . '/views/template_to_html/category_tree_front.php', $tab='', ['activeCategory'=>$id]);

//Получаем информацию о выбранной категории
$getInfoCategory = findOneParam('category','alias', $alias, true);
if($getInfoCategory){
    $getInfoCategory = $getInfoCategory[0];
    $title_header .= $getInfoCategory['title'];
    $description_header .= strip_tags(str_replace("\"","&quot;", $getInfoCategory['m_description']));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", $getInfoCategory['m_keywords']));
    $image_header .= substr(PATH, 0, -1) . CAT_IMG . $getInfoCategory['image'];
}
//debug_arr($getInfoCategory);
/*
 * Обработка данных при нажатии на кнопку подгрузка товара
 */
if(isset($_POST['num_page_product'])){
    //if(!safePostAjaxRequest()) return false;
    $num_page_product = (int)$_POST['num_page_product'];
    if(!$num_page_product) exit('false');
    $page_product_response = page_product_response($num_page_product, $ids);
    if(!$page_product_response) exit('false');
    $page_product_html = content_to_string($page_product_response, 'page_product_html.php');
    exit($page_product_html);
}


/*
 * Товары выбранной категории
 */
include 'libs/breadcrumbs.php';

/*=========Пагинация==========*/
// кол-во товаров на страницу
$perpage = (isset($_COOKIE['per_page']) && (int)$_COOKIE['per_page']) ? $_COOKIE['per_page'] : PERPAGE;
// общее кол-во товаров
$count_goods = count_goods($ids, $_SESSION['warehouse']);
// необходимое кол-во страниц
$count_pages = ceil($count_goods / $perpage);
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
// если запрошенная страница больше максимума
if ($page > $count_pages) $page = $count_pages;
//начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;
//пагинация
$pagination = pagination($page, $count_pages);
//цены на товары согласно выбранному складу
//достаем id  товаров согласно id склада

//продукты
$products = get_products($ids, $start_pos, $perpage, $_SESSION['warehouse']);

require_once "views/{$view}.php";
