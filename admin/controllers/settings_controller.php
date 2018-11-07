<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//количество строк в таблице с настройками в бд
//Если настройки не найдены создаем запись с настройками по умолчанию
if(!countRowTable('settings')){
    $res = addDataToTable('settings', ['titleSite'=>'null','descriptionSite'=>'null','minSumCart'=>50, 'email'=>'test@gmail.com', 'phone'=>'1.111 11 11','titleHome'=>'null','descriptionHome'=>'null','googleCode'=>'null','permissionComments'=>0, 'contentHomePage'=>'Empty']);
    return $res;
}

if(!countRowTable('settings_slider')){
    $res = addDataToTable('settings_slider', ['title'=>'null','link'=>'null', 'description'=>'null']);
    return $res;
}
//Получаем данные из таблицы для settings
$getAdminSettings = Model_Driver::get_instance()->select(['*'],'settings',[],'','',1);
if($getAdminSettings) $getAdminSettings = $getAdminSettings[0];
//debug_arr($getAdminSettings);

//Получаем данные из таблицы для settings_slider
$getAdminSettingsSlider = Model_Driver::get_instance()->select(['*'],'settings_slider',[],'','',1);
if($getAdminSettingsSlider) $getAdminSettingsSlider = $getAdminSettingsSlider[0];
//debug_arr($getAdminSettingsSlider);

//Обработка пост данных for table Settings
if(isset($_POST['editSettings'])){
    //Обновляем данные
    //editDataInTable('tableName', ['tablecolumn'=>$_POST['senParam']], ['id_column'=>$_POST['senParamId'], ['='], [$_POST['senParamCheckforEmpty']]])
    $settingsInfoUpdate = editDataInTable('settings', ['titleSite'=>$_POST['titleSite'], 'descriptionSite'=>$_POST['descriptionSite'],'minSumCart'=>(int)$_POST['minSumCart'], 'email'=>$_POST['email'],'phone'=>$_POST['phone'], 'titleHome'=>$_POST['titleHome'], 'descriptionHome'=>$_POST['descriptionHome'], 'googleCode'=>$_POST['googleCode'],'permissionComments'=>$_POST['permissionComments']],['id'=>$getAdminSettings['id']],['=']);
    if($settingsInfoUpdate){
        $_SESSION['message']['success'] = 'Success!';
        header("Location: /admin/settings");
        exit;
    }else{
        $_SESSION['message']['error'] = 'Error!';
        header("Location: /admin/settings");
        exit;
    }
}
//Обработка пост данных
//contentHomePage for table Settings
if(isset($_POST['editHomeContent'])){
    //Обновляем данные
    //editDataInTable('tableName', ['tablecolumn'=>$_POST['senParam']], ['id_column'=>$_POST['senParamId'], ['='], [$_POST['senParamCheckforEmpty']]])
    $settingsInfoUpdate = editDataInTable('settings', ['contentHomePage'=>$_POST['contentHomePage']],['id'=>$getAdminSettings['id']],['='],false,false,"true");
    if($settingsInfoUpdate){
        $_SESSION['message']['success'] = 'Success!';
        header("Location: /admin/settings");
        exit;
    }else{
        $_SESSION['message']['error'] = 'Error!';
        header("Location: /admin/settings");
        exit;
    }
}

if(isset($_POST['editSliderContent'])){
    //Обновляем данные
    //editDataInTable('tableName', ['tablecolumn'=>$_POST['senParam']], ['id_column'=>$_POST['senParamId'], ['='], [$_POST['senParamCheckforEmpty']]])
    $settingsSliderInfoUpdate = editDataInTable('settings_slider', ['title'=>$_POST['title'],'link'=>$_POST['link'], 'description'=>$_POST['description']],['id'=>$getAdminSettingsSlider['id']],['='],false,false,"true");
    if($settingsSliderInfoUpdate){
        $_SESSION['message']['success'] = 'Success!';
        header("Location: /admin/settings");
        exit;
    }else{
        $_SESSION['message']['error'] = 'Error!';
        header("Location: /admin/settings");
        exit;
    }
}

require_once TMP_ADM . $view .'.php';