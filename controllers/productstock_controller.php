<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(array_key_exists('param_res', $_POST)){
    //if(!safePostAjaxRequest()) return false;
    $id = 1;
}

/*
 * Формирование id для акции
 */
if (array_key_exists('stock_alias', $match)) {
    $alias = $match['stock_alias'];
    //echo $alias;
    //поиск алиаса для продукта
    $dataStock = findOneParam('stock', 'alias', $alias);
    //echo $id;
    if($dataStock){
        $id = (int)$dataStock['id'];
    }
}
else {
    header("Location:".PATH);
    exit;
}
//Заголовки для Хедера
$title_header .= $dataStock['title'];

/*
 * Обработка данных при нажатии на кнопку подгрузка товара
 */
if(isset($_POST['num_page_product']))
{
    //if(!safePostAjaxRequest()) return false;
    $num_page_product = (int)$_POST['num_page_product'];
    if(!$num_page_product) exit('false');
    $page_product_response = page_data_response($query="SELECT * FROM `products` WHERE `mark_view`='1' AND `stock_id`={$id} LIMIT {$num_page_product}, ".PERPAGE." ");
    if(!$page_product_response) exit('false');
    $page_product_html = content_to_string($page_product_response, 'page_product_html.php');
    exit($page_product_html);
}

//Обработка заказа при нажатии на кнопку купить
if(array_key_exists('param', $_POST) && ($_POST['param'] != '{}') && ($_POST['param_action']== 'add_product'))
{
    //if(!safePostAjaxRequest()) return false;

    $param = json_decode($_POST['param']);
    $id = (int)$param->{'id'};
    //проверяем есть ли данный товар у пользователя в корзине,тоггда обновляем кол-во товара.
    //Если такого товара нет тогда проверяем есть ли данный товар в списке товаров и добавляем его в корзину
    $add_to_cart_product = add_to_cart_product($id);
    if(!$add_to_cart_product)
        exit(json_encode('false'));
    exit(json_encode('true'));

}

//Обрабатываем запрос от аякса на результат для корзины кол-во, сумма товара,
if(array_key_exists('param_res', $_POST))
{
    //if(!safePostAjaxRequest()) return false;

    $cart_info = cart_info();
    if(!$cart_info)
        exit(json_encode('false'));
    exit($cart_info);
}

//удаление товара из корзины
if((key_exists('param', $_POST) && key_exists('param_action', $_POST)) || key_exists('param_quantity', $_POST))
{
    //if(!safePostAjaxRequest()) return false;
    $param ='';
    $param_action='';
    $param_quantity='';
    $quantity='';

    $param = json_decode($_POST['param']);
    $param_action = json_decode($_POST['param_action']);

    if(key_exists('param_quantity', $_POST))
    {
        $param_quantity = json_decode($_POST['param_quantity']);
        $quantity = $param_quantity->{'quantity'};
    }

    $id = (int)$param->{'id'};
    $param_action = $param_action->{'action'};

    //var_dump( $param_action);exit;
    if($id > 0)
    {
        $order_list_recalc = order_list_recalc($id, $param_action, $quantity);
    }

}

/*
 * Товары выбранной категории
 */
if(!$_POST)
    include 'libs/breadcrumbs.php';

/*=========Пагинация==========*/

// кол-во товаров на страницу
$perpage = (isset($_COOKIE['per_page']) && (int)$_COOKIE['per_page']) ? $_COOKIE['per_page'] : PERPAGE;

// общее кол-во товаров
$count_goods =  countRowTable('products', ['stock_id'=>$id, 'mark_view'=>'1']);

// необходимое кол-во страниц
$count_pages = ceil($count_goods / $perpage);

// минимум 1 страница
if (!$count_pages) $count_pages = 1;

// получение текущей страницы
if (isset($_GET['page'])){
    $page = (int)$_GET['page'];
    if ($page < 1) $page = 1;
}
else{
    $page = 1;
}

// если запрошенная страница больше максимума
if ($page > $count_pages) $page = $count_pages;

//начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;

//пагинация
$pagination = pagination($page, $count_pages);

//продукты
$products = Model_Driver::get_instance()->select(['*'], '`products`',['`mark_view`'=>'1', '`stock_id`'=>$id], '`title`', 'ASC', "{$start_pos}, {$perpage}");

require_once "views/{$view}.php";
