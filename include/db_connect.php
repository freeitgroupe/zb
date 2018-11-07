<?php
defined("CATALOG") or die("Access denied");
if($_SERVER['REMOTE_ADDR'] == '127.0.0.1' ){
    $db_host = 'localhost';
    $db_user = 'root';
    $db_pass = '123456';
    $db_database = 'webene00_zb_test_loc';
    define("PATH", "http://zbbp.loc/" );
    define('SESSION_PATH', $_SERVER["DOCUMENT_ROOT"].'/cgi-bin/tmp');
}else{
    $db_host = 'zupplyboxcom.ipagemysql.com';
    $db_user = 'webene00_zb';
    $db_pass = '9ax34r5s';
    $db_database = 'webene00_zb_test';
    define("PATH", "http://zupplybox.com/");
    define('SESSION_PATH', $_SERVER["DOCUMENT_ROOT"].'/cgi-bin/tmp');
}
define('HOST', $db_host);
define('USER', $db_user);
define('PASSWORD', $db_pass);
define('DB_NAME', $db_database);
define('TMP_ADM', 'views/template/adm/');

$options_per_page = [5,10,15];//количество товаров на страницу

global $link;
$link = @mysqli_connect($db_host,$db_user,$db_pass);
mysqli_select_db($link, $db_database) or die("Нет соединения с БД ");
mysqli_set_charset($link,"utf8");

//Заголовки для хедера
$title_header='';
$description_header='';
$keywords_header='';
$image_header='';
//Валюта
$currency = '$';

//Константы для сайта
define("EMAIL", 'support_zupplybox@gmail.com');
define("ADMIN_MAIL", 'Zupply_box@gmail.com');
define("SITE_NAME", "Zupply box" );

define("IMAGE", PATH ."uploads_images/" );//загруженные товары
define("IMG_ALL", PATH . "uploads_images/uploads_all_img/" );//загруженные картинки
define("NOIMAGE", 'nophoto.jpg');
define("COMMENTS_IMG", "/uploads_images/comments/" );//загруженные товары

define("NEWS_IMG_TMP",  "/uploads_images/news/tmp/" );//временное хранилище для фото новостей
define("NEWS_IMG", "/uploads_images/news/baseimg/" );//фото для новостей

define("PARTNERS_IMG_TMP",  "/uploads_images/partners/tmp/" );//временное хранилище для фото партнеров
define("PARTNERS_IMG", "/uploads_images/partners/baseimg/" );//Основное фото для партнеров

define("CAT_IMG_TMP",  "/uploads_images/category/tmp/" );//временное хранилище для фото категорий продукта
define("CAT_IMG", "/uploads_images/category/baseimg/" );//фото для категорий

define("PROD_IMG_TMP",  "/uploads_images/product/tmp/" );//временное хранилище для фото продукта
define("PROD_IMG", "/uploads_images/product/baseimg/" );//фото для gпродукта

define("GALLERY_IMG_TMP",  "/uploads_images/product/tmp/" );//временное хранилище для галереи фото продукта
define("GALLERY_IMG", "/uploads_images/product/thumbs/" );//фото для галереи продукта

define("STOCK_IMG_TMP", "/uploads_images/stock/tmp/");//временное хранилище для фото акций
define("STOCK_IMG", "/uploads_images/stock/baseimg/");//фото акций

define("STOCK_THUMBNAIL_IMG_TMP", "/uploads_images/stock/tmp/");//временное хранилище для лого акций
define("STOCK_THUMBNAIL_IMG", "/uploads_images/stock/thumbs/");//фото для хранения лого акций

define("AVATAR", "/uploads_images/avatars/" );//загруженные товары
define("IMG", "/img/" );//изображения для оформления сайта
define("PERPAGE", 8);//
define("COUNT_COMM", 5);//количество комментариев на страницу по умолчанию
define("UA", 'грн');
define("USD", 'usd');

//Правила авторизации
define('FEALT',1);//кол-во дней блокировки пользователя при неудачной авторизации в админку
define('VERSION','110');//версия файла для кук
define('KEY','hfkjdfhjkhkdsjfhkljsdGHHDGD878754');//ключ для шифрования
define('EXPIRATION', 1200 );//врямя после которого требуется повторная авторизация
define('VARNING_TIME', 300);//врямя после которого кука перезапишется для админа

//Авторизация через Фэйсбук
define("URL_AUTH","https://www.facebook.com/v2.12/dialog/oauth");
define("CLIENT_ID","926638490838393");
define("SECRET","c9454d86e96a086401e8029798d88bab");
define("REDIRECT",PATH . 'profile');
define("TOKEN","https://graph.facebook.com/oauth/access_token");
define("GET_DATA","https://graph.facebook.com/me?fields=name,first_name,last_name,email,link,gender,locale,picture");

//Авторизация через google
define('CLIENT_ID_G', '535200460243-9f17kohf8lin6i0md7hkqs24v33h18lt.apps.googleusercontent.com');
define('CLIENT_SECRET_G', '-2jZ8fs-BknZjA7TrBXsMGMZ');
define('REDIRECT_G', PATH . 'goauth');
define('URL_AUTH_G', 'https://accounts.google.com/o/oauth2/auth');
define('SCOPE_G', 'https://www.googleapis.com/auth/userinfo.email https://www.googleapis.com/auth/userinfo.profile');

//PayPal API
define("PAYPAL_URL",'https://www.sandbox.paypal.com/cgi-bin/webscr');
define("PAYPAL_ID",'pudzia009-facilitator@gmail.com');
define("SUCCESS",PATH . 'pay-success');
define("CANCEL",PATH. 'pay-cancel');
define("IPN",PATH . 'pay-ipn');
?>