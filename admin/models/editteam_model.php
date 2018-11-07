<?php
defined("CATALOG") or die("Access denied");

function res_update_user($post,$pages_id){
    $error = [];
    if(!isset( $_SESSION['message']['error'])){
        $_SESSION['message']['error'] ='';
    }
    if(!isset( $_SESSION['message']['success'])){
        $_SESSION['message']['success'] ='';
    }
    $email = clear_string($post['email']);
    $login = clear_string($post['login']);
    $date = date("Y-m-d", strtotime(clear_string($post['date_birth'])));

    if(!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i",trim($email))) $error[] = "Please enter a valid email!";
    if(strlen($login) < 3 or strlen($login) > 100) $error[] = "Enter a login from 3 to 100 characters!";


        $sql = "SELECT `team_admin_users`.* FROM `team_admin_users` WHERE `team_admin_users`.id NOT IN (SELECT `team_admin_users`.id FROM `team_admin_users` WHERE `team_admin_users`.id={$pages_id}) AND `team_admin_users`.login='$login'";
        $res = Model_Driver::get_instance()->sqlQuery($sql);
        if($res){$error[] = "This login already exists!";}

    $sql = "SELECT `team_admin_users`.* FROM `team_admin_users` WHERE `team_admin_users`.id NOT IN (SELECT `team_admin_users`.id FROM `team_admin_users` WHERE `team_admin_users`.id={$pages_id}) AND `team_admin_users`.email='$email'";
    $res = Model_Driver::get_instance()->sqlQuery($sql);
    //exit;
    if($res){$error[] = "This email already exists!";}

    if (count($error)) {
        $_SESSION['message']['error'] = implode('<br />',$error);
        return false;
    }
    //exit;
    $res_update_user = editDataInTable('team_admin_users', ['login'=>$login,'email'=>$email,'name'=>$post['name'], 'start_time_work'=>$post['start_time_work'], 'phone'=>$post['phone'],'ext_phone'=>$post['ext_phone'], 'age'=>$post['age'], 'date_birth'=>$date,'education'=>$post['education'], 'admin_access_id'=>$post['admin_access_id']],['id'=>$pages_id],['=']);
    if($res_update_user){
        $_SESSION['message']['success'] ='Success!';
        return true;
    }
}
