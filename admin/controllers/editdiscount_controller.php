<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
if(!array_key_exists('pages_alias', $match)) header("Location:" . PATH_ADMIN . 'discount/');

if($match['pages_alias'] != 'new'){
    if(!$discountInfo = findOneParam('discount', 'alias', $match['pages_alias'])) header("Location:" . PATH_ADMIN . 'discount');
    $discountId = $discountInfo['id'];
    debug_arr($discountInfo);

}

require_once TMP_ADM . $view . '.php';
