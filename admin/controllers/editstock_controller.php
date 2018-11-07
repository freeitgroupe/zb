<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match)) header("Location: /admin/stock");
if(!$pages_id = (int)$match['pages_id']) header("Location: /admin/stock");
//Информация о выбранной акции
$stockInfo = findOneParam('stock', 'id', $pages_id);



//debug_arr($stockInfo);
if(isset($_POST['edit_stock'])){
    if(!isset( $_SESSION['message']['error'])){
        $_SESSION['message']['error'] ='';
    }
    if(!isset( $_SESSION['message']['success'])){
        $_SESSION['message']['success'] ='';
    }
    //поверка формата времени для $_POST['end_time']
    //debug_arr($_POST);
    //дату окончания акции проверяем отдельно, при некорректном значении возвращаем +1 день
    $time = checkFormatTime($_POST['end_time']);

    //Обновляем данные
    $stockInfoUpdate = editDataInTable('stock', ['title'=>$_POST['title'], 'description'=>$_POST['description'], 'mini_description'=>$_POST['mini_description'],'activation'=>$_POST['activation'], 'end_time'=>$time],['id'=>$pages_id], ['title']);

    //Обновление медиа
    if($stockInfoUpdate){
        $_SESSION['message']['success'] .= "Success update info</br>";
        //проверка на пустоту данных о превью акции
        if(isset($_FILES['img']) && empty($_FILES['img']['error'])){
            $name_files_arr = $_FILES['img'];
            //загрузка
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
                $pages_id,
                300,
                200
            );
            if(!$res){
                $_SESSION['message']['error'] .= 'err download img!</br>';
            }
            $_SESSION['message']['success'] .= 'Success update stock img!</br>';
        }
        //проверка на пустоту данных о лого акции
        if(isset($_FILES['thumbnail']) && empty($_FILES['thumbnail']['error'])) {
            $name_files_arr_1 = $_FILES['thumbnail'];
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
                $pages_id,
                100,
                80
            );

            if(!$res_1){
                $_SESSION['message']['error'] .= 'err download thumbnail </br>';
            }
            $_SESSION['message']['success'] .= 'Success update thumbnail img!</br>';
        }
    }else{
        $_SESSION['message']['error'] .= 'err update info </br>';
    }
    header("Location: /admin/edit-stock/{$pages_id}");
    exit;

}

//Удаленеие лого акции
if(isset($_POST['submit']) && ($_POST['submit'] == 'page_delete_thumbnail')) {
    //debug_arr($_POST); exit;
    $res = deletePhotoFromTable('stock', $pages_id, 'stock_thumbnail', $_POST['pageFileDel'],STOCK_THUMBNAIL_IMG, NOIMAGE);
    exit(json_encode($res));
}

//Удаление превью акции
if(isset($_POST['submit']) && ($_POST['submit'] == 'page_delete_img')) {
    //debug_arr($_POST); exit;
    $res = deletePhotoFromTable('stock', $pages_id, 'stock_img', $_POST['pageFileDel'],STOCK_IMG, NOIMAGE);
    exit(json_encode($res));
}

require_once TMP_ADM . $view .'.php';