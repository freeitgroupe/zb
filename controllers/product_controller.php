<?php
defined("CATALOG") or die("Access denied");
require_once "main_controller.php";
require_once "models/{$view}_model.php";

//в случае авторизации получаем сессионые данные для имейла и имени
$sess_email ='';
$sess_name ='';
if(isset($_SESSION['auth']) && $_SESSION['auth'] =='yes_auth'){
    $sess_email = $_SESSION['auth_email'];
    $sess_name = $_SESSION['auth_name'] > '' ? $_SESSION['auth_name'] : '';
}

if(array_key_exists('prod_alias', $match)){
    $product_id = '';
    $product_alias = $match['prod_alias'];

    //поиск алиаса продукта
    $product_id = findOneProductId($product_alias);
    $product_id = (int)$product_id;
    //если алиас не найден уходим на главную старницу
    if (!$product_id) {
        header("Location: /");
        exit();
    }
}
else{
    header("Location: /");
    exit();
}

//Обработка комментариев (отзывы)
//проверяем разрешены комментарии или нет (0-не разрешены, 1- разрешены)
$permissionCreateComments = getAdminSettings()[0]['permissionComments'];
if($permissionCreateComments > 0){
    if(isset($_POST['author_name']) && isset($_POST['author_email'])) {
        $post = $_POST;
        $comment_add = comment_add($post);
    }
    //Подгружаем комментарии при аякс запросе
    if(isset($_POST['count_comments']) && $_POST['count_comments'] > 0){
        echo $comments;
        exit;
    }

    //получение комментариев для продукта
    $c='';
    if(isset($_POST['count_comments'])){
        $c = (int)$_POST['count_comments'];
    }
    $get_comments = get_comments($product_id, $c);
    $comments_tree = map_tree($get_comments);
    $comments = comments_to_string($comments_tree);
    $count_comments = count_comments($product_id);

}


//Обработка рейтинга комментария
if(isset($_POST['type']) || isset($_POST['paramVote'])){
    $err='';
    $type = clear_string($_POST['type']);
    $comment_id = (int)$_POST['paramVote'];
    $date = date("Y-m-d H:i:s");
    if($type != 'like' && $type != 'dislike' || $comment_id == 0){
        $err = 'Error param';
    }
    if($type == 'like') $fieldName = 'count_like';
    if($type == 'dislike') $fieldName = 'count_dislike';

    $findIpUsers = Model_Driver::get_instance()->select(['*'],'comments_votes',['user_ip'=>$_SERVER['REMOTE_ADDR'],'comments_id'=>$comment_id]);
    if(is_array($findIpUsers)){
        $err = "You already voted!";
    }

    $findLocalIpUsers = Model_Driver::get_instance()->select(['*'],'comments_votes',['ip_locale_address'=>gethostbyaddr($_SERVER['REMOTE_ADDR']),'comments_id'=>$comment_id]);
    if(is_array($findLocalIpUsers)){
        $err = "You already voted!!";
    }

    if($err > ''){
        echo json_encode(array('result' => 'error', 'msg' => $err));
        exit();
    }

    $resAddVoted = addDataToTable('comments_votes', ['user_ip'=>$_SERVER['REMOTE_ADDR'], 'ip_locale_address'=>gethostbyaddr($_SERVER['REMOTE_ADDR']),'comments_id'=>$comment_id,'created'=> $date]);

    $resUpdateCountVote = Model_Driver::get_instance()->sqlQuery("UPDATE `comments` SET `$fieldName`= `$fieldName` + 1 WHERE  `id` = $comment_id", true);

    if($resUpdateCountVote){
       exit(json_encode(['result' => 'success']));
    }else{
        exit(debug_arr($resUpdateCountVote));
    }
}

$get_count_view = get_count_view($product_id);

//получение данных о продуккте по id
$get_one_product = get_one_product($product_id);

//Поставщики товара
$suppliersForOneProduct = suppliersForOneProduct($product_id);
//вывод списка поставщиков
$stringViewSuppliers = stringViewSuppliers($suppliersForOneProduct);
//подсчет количества поставщиков
$countSuppliersProduct = countSuppliersProduct($suppliersForOneProduct);

$get_related_additions = get_related_additions($product_id);
//debug_arr($get_related_additions);

//Заголовки для Хедера
$title_header .= $get_one_product['title'];
$description_header .= strip_tags(str_replace("\"","&quot;", $get_one_product['meta_d']));
$keywords_header .= strip_tags(str_replace("\"","&quot;", $get_one_product['meta_k']));
$image_header .= substr(PATH, 0, -1) . PROD_IMG . $get_one_product['image'];

if(is_array($get_one_product)){
    //Участвует товар в акциях или нет
    if((int)$get_one_product['stock_id'] > 0){
        $get_stock_info = get_stock_info($get_one_product['stock_id']);

        //подсчет разницы времени
        $date_now = date_create(date( "Y-m-d H:i:s", time()));;
        $date_end = date_create($get_stock_info['end_time']);
        $js_time = date('Y/m/d H:i:s', strtotime($get_stock_info['end_time']));
        $interval = date_diff($date_now, $date_end);
        $res_interval =$interval->format('%a day, %H hour, %I minutes, %S seconds');
        //debug_arr($get_stock_info);
    }

    //формирование watch list
    $watch_list = watch_list_user($product_id);

    //Возращаем список просмотренных товаров по ip пользователя
    $user_ip = $_SERVER['REMOTE_ADDR'];
    $get_watch_list = get_watch_list($user_ip,$product_id);

    //рейтинг продукта
    $product_rating = product_rating($get_one_product['id']);
    //debug_arr($product_rating);
}
//получение статуса для продукта(в наличии, в ожидании и др.)
//$get_product_status = get_product_status($get_one_product['product_status_id']);
//получение сопутствующих сервисов для продукта
//$get_related_additions = get_related_additions($product_id);

//Рейтинг товара
if(isset($_POST['ratingPoints']) && !empty($_POST['ratingPoints']))
{
    //входные данные
    //$user_ip = $_SERVER['REMOTE_ADDR'];
    //$computerName = gethostbyaddr($user_ip);
    $postID =  (int)$_POST['postID'];
    $rating_number = 1;
    $ratingPoints = (int)$_POST['ratingPoints'];
    //debug_arr($ratingPoints);exit;
    $res_rate = res_rate($postID, $rating_number, $ratingPoints);
}

//debug_arr($comments);
//debug_arr($comments_tree);
//var_dump($_SESSION);

//для формирования хлебных крошек
$id = $get_one_product['category_id'];
include 'libs/breadcrumbs.php';

require_once "views/{$view}.php";