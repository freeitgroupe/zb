<?php
defined("CATALOG") or die("Access denied");
//      1.1. Общее Количество товаров++
//      1.2. Количество товаров в наличии++
//		1.3. Количество проданных товаров++ ==isset time==
//		1.4. Средний чек сделки++ ==isset time==
//		1.5. Общая сумма налога по товарам ---????????? ==isset time==
//		1.6. Заказы на текущий момент++
//		1.7. Количество незавершенных сделок (возвраты и отказы)++ ==isset time==
//      1.8. Количество уникальных посетителей++ ==isset time==
//		1.9. Количество человек на сайте в данный момент++???????
//		1.10. Количество зарегистрированных посетителей+ +==isset time==
//		1.11. Самые просматриваемые страницы и разделы+-?????????
//      1.12. Самый популярный товар по количествам продаж++ ==isset time==
//	2. Конверсионные данные (Программно)
//		2.1. Общая сумма проданных товаров(Оборот)++  ==isset time==
//		2.2. Количество незавершенных сделок в денежном эквиваленте(1.4)++  ==isset time==
//		2.3. Топ по просмотрам товарных категорий (1.7)++?????
//		2.4. Рейтинг популярности товаров по просмотрам (1.8)++
//		2.5. Конверсия посетителя в покупку+-???????
//      2.6. Конверсия посетителя в регистрацию+-????????
//      2.7. Количество брошенных корзин+-  ==isset time==

//общее количество продуктов
function CountAllProducts(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT COUNT(*) FROM `products`");
    if(!$res) return false;
    return $res[0]['COUNT(*)'];
}

//количество продуктов доступных к покупке
function CountAvailableProducts(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT COUNT(*) FROM `products` WHERE `mark_available` = '1'");
    if(!$res) return false;
    return $res[0]['COUNT(*)'];
}

//количество проданных продуктов
function CountSoldProducts($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT SUM(qty) AS sumQty FROM `orders` WHERE `pay` = 1 AND `created_at` BETWEEN '$timeStart' AND '$timeEnd'");
    if(!$res) return 'Error count';
    if($res[0]['sumQty'] == NULL){$res[0]['sumQty'] = 0;}
    return $res[0]['sumQty'];
}

//средний чек сделки
function averageTransactionCheck($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT AVG(`sum`) AS priceAvg FROM `orders` WHERE `pay` = 1 AND `created_at` BETWEEN '$timeStart' AND '$timeEnd'");
    if(!$res) return false;
    return $res[0]['priceAvg'];
}

//Общее количество налога по проданным товарам закончить...
function totalTaxForProducts(){
    $res = Model_Driver::get_instance()->sqlQuery("");
}

//Количество заказов на текущий момент
function countCurrentOrders($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT COUNT(*) FROM `orders` WHERE `pay` = 0 AND `created_at` BETWEEN '$timeStart' AND '$timeEnd' ");
    if(!$res) return false;
    return $res[0]['COUNT(*)'];
}
//Количество не завершенных сделок
function countPendingTransaction($timeStart, $timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT COUNT(*) FROM `orders` WHERE `status` = 4 AND `created_at` BETWEEN '$timeStart' AND '$timeEnd'");
    if(!$res) return false;
    return $res[0]['COUNT(*)'];
}

//Количество зарегистрированных посетителей
function countRegUsers($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT COUNT(*) FROM `users` WHERE `datetime` BETWEEN '$timeStart' AND '$timeEnd' ");
    if(!$res) return false;
    return $res[0]['COUNT(*)'];
}
//Самый популярный товар по количеству продаж
function popularSoldProducts($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT MAX(sumQtyEtem) AS MaxSoldProducts FROM (SELECT SUM(qty_item) as sumQtyEtem, `product_id` FROM `order_items` WHERE payment_id=0  GROUP BY(product_id) ORDER BY sumQtyEtem DESC) AS sumTable");
    if(!$res) return false;
    return $res[0]['MaxSoldProducts'];
}

//Общая сумма проданных товаров
function CountConfirmPayAllSolidProducts($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT TRUNCATE(SUM(`sum`),2) AS sumSolidProducts FROM `orders` WHERE `pay`=1 AND `created_at` BETWEEN '$timeStart' AND '$timeEnd'");
    if(!$res) return false;
    return $res[0]['sumSolidProducts'];
}

// Количество незавершенных сделок в денежном эквиваленте
function CountProcessedPayAllSolidProducts($timeStart,$timeEnd){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT TRUNCATE(SUM(`sum`),2) AS sumProcessedPayProducts FROM `orders` WHERE `pay`=0");
    if(!$res) return false;
    return $res[0]['sumProcessedPayProducts'];
}
// Рейтинг популярности товаров по просмотрам
function PopularViewsProduct(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT `title`, `alias`, `article`, `page_views` FROM `products` ORDER BY `page_views` DESC LIMIT 5");
    if(!$res) return false;
    return $res;
}

//Рейтинг популярости категорий по просмотрам
function PopularViewsCategory(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT `title`, `alias`, `category_views` FROM `category` ORDER BY `category_views` DESC LIMIT 5");
    return $res;
}

//количество товаров в корзине (количество брошенных корзин)
function countProcessedCart(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT count(*) FROM (SELECT DISTINCT `cart_ip` FROM `cart`) as `countCart`");
    if(!$res) return false;
    return $res[0]['count(*)'];
}
