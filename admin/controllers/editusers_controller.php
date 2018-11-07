<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
if(!array_key_exists('pages_id', $match)) header("Location: /admin/users/");
$pages_id = $match['pages_id'];
$pages_id = (int)$pages_id;
if(!$pages_id) header("Location: /admin/users/");
if(!$res = findOneParam('users', 'id', $pages_id)) header("Location: /admin/users");
//Находим все данные по пользователю
$data = Model_Driver::get_instance()->sqlQuery("SELECT `users`.*, `orders`.id AS order_id, `orders`.user_id,`orders`.qty,`orders`.sum FROM `users` INNER JOIN `orders` ON `users`.id =`orders`.user_id  WHERE `orders`.user_id={$pages_id}");
//Считаем количество ордеров просматриваемого пользователя
$dataCountOrders = countRowTable('orders',['user_id'=>$pages_id]);
//Количечтво товара купленного просматриваемым пользователем
$dataCountProductsInOrders = countSummColomnTable('orders','qty', ['user_id'=>$pages_id]);
//debug_arr($data);
//debug_arr($dataCountOrders);
//debug_arr($dataCountProductsInOrders);
require_once TMP_ADM . $view . '.php';