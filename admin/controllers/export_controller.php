<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/dumper_db.php";
require_once "models/{$view}_model.php";


if(isset($_POST['export_db'])){
    $res = backupDatabaseTables();
    if($res){
        //header("Location:" . TMP_ADM . 'export');
    }
}
//Экспорт продуктов
if(isset($_POST['export_products'])){
    $res = backupDataTable('products');
    if($res){
        header("Location:" . TMP_ADM . 'export');
    }
}
//Экспорт пользователей
if(isset($_POST['export_users'])){
    $res = backupDataTable('users');
    if($res){
        header("Location:" . TMP_ADM . 'export');
    }
}
require_once TMP_ADM . $view .'.php';