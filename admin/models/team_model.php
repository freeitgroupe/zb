<?php
defined("CATALOG") or die("Access denied");

function res_create_user($post){
    $error = [];
    if(!isset( $_SESSION['message']['error'])){
        $_SESSION['message']['error'] ='';
    }
    if(!isset( $_SESSION['message']['success'])){
        $_SESSION['message']['success'] ='';
    }

    $email = clear_string($post['email']);
    $pass = strtolower(clear_string($post['password']));
    $login = clear_string($post['login']);
    if(!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i",trim($email))) $error[] = "Please enter a valid email!";
    if(strlen($pass) < 6 or strlen($pass) > 15) $error[] = "Enter a password from 6 to 15 characters!";
    if(strlen($login) < 3 or strlen($login) > 100) $error[] = "Enter a login from 3 to 100 characters!";
    if(findOneParam('team_admin_users', 'login',$login)){
        $error[] = "This login already exists!";
    }
    if(findOneParam('team_admin_users', 'email',$email)){
        $error[] = "This email already exists!";
    }
    if (count($error)) {
        $_SESSION['message']['error'] = implode('<br />',$error);
        $createSessionParam = createSessionData('data',['login'=>$post['login'],'email'=>$email,'name'=>$post['name'], 'start_time_work'=>$post['start_time_work'], 'phone'=>$post['phone'],'ext_phone'=>$post['ext_phone'], 'age'=>$post['age'], 'date_birth'=>$post['date_birth'],'education'=>$post['education'], 'admin_access_id'=>$post['admin_access_id']]);
        return false;
    }

    $pass = md5($pass);
    $pass = strrev($pass);
    $pass = "9nm2rv8q".$pass."2yo6z";
    $ip = $_SERVER['REMOTE_ADDR'];
    //$code = gen_code (10);

    $res_create_user = addDataToTable('team_admin_users', ['login'=>$post['login'],'email'=>$email, 'password'=>$pass,'name'=>$post['name'], 'start_time_work'=>$post['start_time_work'], 'phone'=>$post['phone'],'ext_phone'=>$post['ext_phone'], 'age'=>$post['age'], 'date_birth'=>$post['date_birth'],'education'=>$post['education'], 'admin_access_id'=>$post['admin_access_id']]);
    if($res_create_user){
        $_SESSION['message']['success'] ='Success!';
        return true;
    }
}

