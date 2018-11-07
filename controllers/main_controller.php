<?php
defined("CATALOG") or die("Access denied");
require_once $_SERVER['DOCUMENT_ROOT'] . "/include/db_connect.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/models/main_model.php";
require_once $_SERVER['DOCUMENT_ROOT'] . "/controllers/auth_controller.php";

//Категории товаров по назначению(т.е. подкатегория товаров)
$category = get_category_front();
//Основные(корневые категории) категории
$primary_category = primary_category();
//debug_arr($primary_category);

//построение дерева категорий
$category_tree = map_tree($category);
$category_menu = category_to_string($category_tree, 'category_template.php');
$pages = get_pages();

//Следим за временем проведения акций
checkTimeForStock();

//список доступных складов
$warehouse = warehouse_info();
//debug_arr($warehouse);
// Формирование данных для выбранного склада пользователем //
//-> Если нет сессионных данных о складе
//-> Если пользователь авторизован
//-> Если пользователь не авторизован
if(!isset($_SESSION['warehouse'])) {
    $_SESSION['warehouse'] = WarehouseForUsers($warehouse);
}
//debug_arr($WarehouseForUser = UserChoiceWarehouse(22));
//-> При наличии пост данных
if(isset($_POST['WarehouseChoice'])){
    $WarehouseForUser = UserChoiceWarehouse($_POST['WarehouseChoice']);
    if($WarehouseForUser){
        $_SESSION['warehouse'] = $WarehouseForUser;
        exit('true');
    }
}

//-> Массив складов с выбранным складом для пользователя
$WarehouseArrWithChoiceUserWarehouse = WarehouseArrWithChoiceUserWarehouse($warehouse, $_SESSION['warehouse']);
//debug_arr($WarehouseArrWithChoiceUserWarehouse);
//Информация о сумме минимального ордера
$getAdminSettings = getAdminSettings();
if($getAdminSettings){
    $getAdminSettings[0]['phone'];
    //Минимальная сумма для корзины
    define('MIN_SUM_ORDER',$getAdminSettings[0]['minSumCart']);
    define('PHONE_SITE',$getAdminSettings[0]['phone']);
    define('EMAIL_SITE',$getAdminSettings[0]['email']);
}

$getAdminSettingsStaticText = getAdminSettingsStaticText();
if($getAdminSettingsStaticText){
    //Минимальная сумма для корзины
    define('CART_TEXT',$getAdminSettingsStaticText[0]['cart_text']);
    define('UPSELL_TEXT',$getAdminSettingsStaticText[0]['upsell_text']);
    define('FINAL_TEXT',$getAdminSettingsStaticText[0]['order_final_text']);
}
//var_dump($_COOKIE);
//var_dump($geoLocationUsers);
//require __DIR__ . '/../vendor/autoload.php';
//$client = TaxJar\Client::withApiKey('c05327a17f5815075a192382b5584964'); // Useful for quick testing
//var_dump($client);
//$client = TaxJar\Client::withApiKey($_ENV['c05327a17f5815075a192382b5584964']); // Recommended
/*
$tax = $client->taxForOrder(
    [
        'from_country' => 'US',
        'from_zip' => '07102',
        'from_state' => 'NJ',
        'from_city' => 'Newark',
        'from_street' => '49 Washington St',
        'to_country' => 'US',
        'to_zip' => '07306',
        'to_state' => 'NJ',
        'to_city' => 'Jersey City',
        'to_street' => '',
        'amount' => 450,
        'shipping' => 0,
        'line_items' => [
            [
                'quantity' => 1,
                'unit_price' => 150
            ],
            [
                'quantity' => 1,
                'unit_price' => 150
            ],
            [
                'quantity' => 1,
                'unit_price' => 150
            ]
        ]
    ]);

$order = $client->createOrder([
    'transaction_id' => '125',
    'transaction_date' => '2018/04/01',
    'from_country' => 'US',
    'from_zip' => '94111',
    'from_state' => 'CA',
    'from_city' => 'San Francisco',
    'from_street' => '600 Montgomery St',
    'to_country' => 'US',
    'to_zip' => '90002',
    'to_state' => 'CA',
    'to_city' => 'Los Angeles',
    'to_street' => '123 Palm Grove Ln',
    'amount' => 16.5,
    'shipping' => 1.5,
    'sales_tax' => 0.95,
    'line_items' => [
        [
            'quantity' => 1,
            'product_identifier' => '12-34243-9',
            'description' => 'Fuzzy Widget',
            'unit_price' => 15.0,
            'sales_tax' => 0.95
        ]
    ]
]);
*/
//echo $tax->amount_to_collect . PHP_EOL;
//echo $tax->rate;
//var_dump($tax->amount_to_collect );
//checkZipCode('90002');
//var_dump(checkZipCode('94111'));
require_once "{$_SERVER['DOCUMENT_ROOT']}/controllers/wishlist_controller.php";

