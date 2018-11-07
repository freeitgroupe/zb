<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//отправка данных на создание акций для товара
if(isset($_POST['create_stock'])){
    //debug_arr($_POST);
    //debug_arr($_FILES);
    //exit;
    if(!isset( $_SESSION['message']['error'])){
        $_SESSION['message']['error'] ='';
    }
    if(!isset( $_SESSION['message']['success'])){
        $_SESSION['message']['success'] ='';
    }

    $res_create_stock = addDataToTable('stock', ['title'=>$_POST['title'],'description'=>$_POST['description'], 'mini_description'=>$_POST['mini_description'],'activation'=>$_POST['activation'], 'end_time'=>$_POST['end_time']], ['title','end_time']);
    if($res_create_stock){
        $maxId = maxParamInTable('stock', 'id');

        if(!$maxId){
            $_SESSION['message']['error'] .= 'err max id </br>';
            header("Location: /admin/stock");
            exit;
        }

        //Формируем Алиас на товар
        $alias = get_alias('stock', 'alias', clear_string($_POST['title']), $maxId);
        //обновляем данные в таблице
        $resUpdateAlias = editDataInTable('stock', ['alias'=>$alias],['id'=>$maxId],['=']);
        if(!$resUpdateAlias){
            $_SESSION['message']['error'] .= 'Err alias update!</br>';
        }

        //загружаем фото для акции//
        //значение для превью акции
        $name_files_arr = $_FILES['img'];
        //значение для превью лого акции
        $name_files_arr_1 = $_FILES['thumbnail'];

        if(empty($name_files_arr['error'])){
            $res = downloadImage(
                $name_files_arr['tmp_name'],
                $name_files_arr['name'],
                $name_files_arr['type'],
                $name_files_arr['size'],
                STOCK_IMG_TMP,
                STOCK_IMG,
                'stock',
                'stock_img',
                'id',
                $maxId,
                300,
                200
            );

           if(!$res){
               $_SESSION['message']['error'] .= 'err download img </br>';
               $res = updateParamInTable('stock', ['stock_img'],[NOIMAGE], ['id'=> $maxId]);
           }
            $_SESSION['message']['success'] .= 'Success!</br>';

        } else{
            //Формируем изображение по умолчанию
            $res = updateParamInTable('stock', ['stock_img'],[NOIMAGE], ['id'=> $maxId]);
            $_SESSION['message']['error'] .= 'STOCK PAGE IMAGE not upload!</br>';
        }

        if(empty($name_files_arr_1['error'])){
            $res_1 = downloadImage(
                $name_files_arr_1['tmp_name'],
                $name_files_arr_1['name'],
                $name_files_arr_1['type'],
                $name_files_arr_1['size'],
                STOCK_THUMBNAIL_IMG_TMP,
                STOCK_THUMBNAIL_IMG,
                'stock',
                'stock_thumbnail',
                'id',
                $maxId,
                100,
                80
            );

            if(!$res_1){
                $res = updateParamInTable('stock', ['stock_thumbnail'],[NOIMAGE], ['id'=> $maxId]);
                $_SESSION['message']['error'] .= 'err download thumbnail </br>';
            }
            $_SESSION['message']['success'] .= 'Success!</br>';
            header("Location: /admin/stock/");
            exit;

        } else{
            //Формируем изображение по умолчанию
            $res = updateParamInTable('stock', ['stock_thumbnail'],[NOIMAGE], ['id'=> $maxId]);
            $_SESSION['message']['error'] = 'LOOP THUMBNAIL not upload!</br>';
            header("Location: /admin/stock/");
            exit;
        }
    }
}

//--(аннулирование акции) на товар--//
if(isset($_POST['submit']) && $_POST['submit']=='page_cancel_submit' && (int)$_POST['pages_id']!=0){
    //id акции на удаление
    //вызываем ф-ю на аннулирование акцииж
    $resEditStock = editStock($_POST['pages_id']);
    exit(json_encode($resEditStock));
}

//удаление акции
if(isset($_POST['submit']) && $_POST['submit']=='page_delete_submit' && (int)$_POST['pages_id']!=0){
    //id акции на удаление
    $resEditStock = editStock($_POST['pages_id'], $deleteAction = true);
    exit(json_encode($resEditStock));
}

// Формирование таблицы с наименованием акций//
//количество продуктов
$count_stock_admin = countRowTable('stock');

//вывод на экран данных о времени
$datetime1 = date_create(date( "Y-m-d H:i:s", time()));
$datetime2 = date_create('2017-12-08 12:40:00');
$interval = date_diff($datetime1, $datetime2, true);
//echo $interval->format('%a day, %H hour, %I minutes, %S seconds');

//подсчет времени для запроса в бд на аннуллирование акции
$realTime = time();
$endTime = strtotime("2017-12-10 12:12:00");
//echo $endTime - $realTime;

//debug_arr($count_stock_admin);
//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;

//необходимое кол-во страниц
$count_pages = ceil($count_stock_admin / $perpage);

//минимум 1 страница
if (!$count_pages) $count_pages = 1;
//если больше одной страницы

$page_count = page_count($count_pages);

// получение текущей страницы
if (isset($_GET['page'])){
    $page = (int)$_GET['page'];
    if($page < 1 || $page > $count_pages) $page = 1;
}else{
    $page = 1;
}

// начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);
/*=========Пагинация==========*/
$get_stock_admin = get_pagination_param('stock', 'id', 'ASC', $start_pos, $perpage);
if(!$get_stock_admin){$get_stock_admin = 'No sales for goods!';}
//debug_arr($get_stock_admin);
require_once TMP_ADM . $view .'.php';