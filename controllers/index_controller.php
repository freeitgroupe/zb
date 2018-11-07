<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//Заголовки для Хедера главной страницы
//Получаем данные из таблицы
if($getAdminSettings = getAdminSettings()){
    $getAdminSettings = $getAdminSettings[0];
    $title_header .= $getAdminSettings['titleHome'];
    $description_header .= strip_tags(str_replace("\"","&quot;", $getAdminSettings['descriptionHome']));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", $getAdminSettings['descriptionSite']));
    //$image_header .= substr(PATH, 0, -1) . PROD_IMG . $get_one_product['image'];
}

//Получаем контент для главной страницы сайта
$homeContentPage = find_all_from_table('settings');
$homeContentPage = $homeContentPage[0]['contentHomePage'];

//Получаем контент для главной страницы сайта
$SliderContent = find_all_from_table('settings_slider');
$SliderContent = $SliderContent[0];
//debug_arr($homeContentPage);

//Наиболее покупаемый товар(3-товара на страницу)
$ProductsHomePage = getBestBuyProducts();
if (!$ProductsHomePage){
    //Наиболее просматриваемый товар
    if(!$ProductsHomePage = getBestViewProducts()){
        $ProductsHomePage = 'demoProducts';
    }
}
//debug_arr($ProductsHomePage);


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




require_once "views/{$view}.php";