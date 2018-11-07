<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/remindPass_model.php";
require_once "models/{$view}_model.php";

if(array_key_exists('recovery', $match)){
    $code ='';
    $code =$match['recovery'];
    $recovery_res = recovery_res($code);
}

if(isset($_POST['reg_pass']) && isset($_POST['reg_pass_again']) && isset($_POST['email_for_pass'])){
    $email = clear_string($_POST['email_for_pass']);
    $pass = clear_string($_POST['reg_pass']);
    $new_pass_repeat = clear_string($_POST['reg_pass_again']);
    if($pass != $new_pass_repeat){
        echo "Passwords do not match!";
    }else{        
        $recovery_pass = recovery_pass($pass, $email);
    }
}

//echo $_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];

require_once "views/{$view}.php";
