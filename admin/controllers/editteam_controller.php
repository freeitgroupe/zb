<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
if(!array_key_exists('pages_id', $match)) header("Location:" . PATH_ADMIN . 'team/');
if(!$pages_id=(int)$match['pages_id']) header("Location:" . PATH_ADMIN . 'team/');
if(!$find_one_data = findOneParam('team_admin_users', 'id', $pages_id)) header("Location:" . PATH_ADMIN . 'team/');

//Выборка данных для $pages_id
$get_data_admin = Model_Driver::get_instance()->sqlQuery("SELECT `team_admin_users`.*, `team_admin_access`.id AS team_admin_access_id, `team_admin_access`.team_name FROM `team_admin_users` LEFT JOIN `team_admin_access` ON `team_admin_users`.admin_access_id=`team_admin_access`.id WHERE `team_admin_users`.id={$pages_id}");
if(!$get_data_admin[0]) header("Location:" . PATH_ADMIN . 'team/');
$get_data_admin = $get_data_admin[0];

//Выборка параметров из бд для наименования уровней доступа
$get_data_admin_access = find_all_from_table('team_admin_access');
//Обработка запроса на обновление данных

if(isset($_POST['update_user'])){
    $res_data_update = res_update_user($_POST,$pages_id);
    if($res_data_update){
        header("Location:" . PATH_ADMIN . 'edit-team/'.$pages_id);
        exit;
    }
    header("Location:" . PATH_ADMIN . 'edit-team/'.$pages_id);
    exit;
}
//debug_arr($get_data_admin);
require_once TMP_ADM . $view .'.php';
