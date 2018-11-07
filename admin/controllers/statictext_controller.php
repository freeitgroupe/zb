<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
//cart_text | upsell_text | order_final_text
//количество строк в таблице с настройками в бд
//Если настройки не найдены создаем запись с настройками по умолчанию
if(!countRowTable('settings_statictext')){
    $res = addDataToTable('settings_statictext', ['cart_text'=>'example text', 'upsell_text'=>'example upsell text', 'order_final_text'=>'example final text']);
    return $res;
}
//Получаем данные из таблицы
$getAdminSettings = Model_Driver::get_instance()->select(['*'],'settings_statictext',[],'','',1);
if($getAdminSettings) $getAdminSettings = $getAdminSettings[0];
//debug_arr($getAdminSettings);
//Обработка пост данных
if(isset($_POST['edit_statictext'])){
    //Обновляем данные
    //editDataInTable('tableName', ['tablecolumn'=>$_POST['senParam']], ['id_column'=>$_POST['senParamId'], ['='], [$_POST['senParamCheckforEmpty']]])
    $settingsInfoUpdate = editDataInTable('settings_statictext', ['cart_text'=>$_POST['cart_text'], 'upsell_text'=>$_POST['upsell_text'],'order_final_text'=>$_POST['order_final_text']],['id'=>$getAdminSettings['id']],['=']);
    if($settingsInfoUpdate){
        $_SESSION['message']['success'] = 'Success!';
        header("Location: /admin/settings-statictext");
        exit;
    }else{
        $_SESSION['message']['error'] = 'Error!';
        header("Location: /admin/settings-statictext");
        exit;
    }
}
require_once TMP_ADM . $view .'.php';