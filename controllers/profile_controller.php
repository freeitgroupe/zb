<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
//общие настройкм к лк
require_once "controllers/lk_controller.php";
require_once "models/{$view}_model.php";

if(isset($_SESSION['auth'])) {
    //debug_arr($_SESSION);
   //Информация о пользователе
    $user_detail =
    [
        'name'=>$_SESSION['auth_name'],
        'email'=>$_SESSION['auth_email'],
        'phone'=>$_SESSION['auth_phone']
    ];

    //Заголовки
    $title_header .= 'Profile - ' . $_SESSION['auth_name'];
    $description_header .= strip_tags(str_replace("\"","&quot;", 'Profile'));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", 'Profile'));

    $params = array(
        'redirect_uri'  => REDIRECT_G,
        'response_type' => 'code',
        'client_id'     => CLIENT_ID_G,
        'scope'         => SCOPE_G
    );
    $linkGoogle = '<p><a href="' . URL_AUTH_G . '?' . urldecode(http_build_query($params)) . '">Add Google account</a></p>';
    if (isset($_SESSION['user_google'])) {
        $linkGoogle =  '<p><img src="' . $_SESSION['user_google']['picture'] . '" height="30" style="border-radius: 50%"/>';
        $linkGoogle .=  $_SESSION['user_google']['email'].'</p>';
        $linkGoogle .= '<p><a href="/goauth?unlink_google">Unlink Google Account</a></p>';
        //debug_arr($_SESSION['user_google']);exit;
    }

    //Формирование сылки для соц сети facebook
    $pathFacebook = pathFacebook();
    //обрабатываем ответ от facebook
    if(isset($_GET['code'])){
        $result = get_token($_GET['code']);
        if($result){
            $fb_info = get_data($result);
            if(array($fb_info)){
                //подключаем соцсеть пользователя
                addSocialFacebook($fb_info['id'], $_SESSION['auth_email']);
            }else{
                $_SESSION['message']['error'] = 'Error data for social info!';
                header("Location: /profile");
                exit();
            }
        }
    }
    //Отключение связи с соцсетью
    if(isset($_POST['unbindFB'])){
        delSocialFacebook($_SESSION['auth_email']);
    }

    //Обновление личной информации
    if(isset($_POST['personal_info'])){
        $personal_info=$_POST;
        //print_r($personal_info);exit();
        $users_option = users_option($personal_info, $_SESSION['auth_id']);
        if(!$users_option){
            header("Location: /profile");
            exit();
        }else{
            header("Location: /profile");
            exit();
        }
    }

    //Обновление пароля
    if(isset($_POST['new_pass_submit'])){
        //debug_arr($_POST);exit;
        if($_POST['new_password'] != $_POST['confirm_password']):
            $_SESSION['message']['error'] = 'New and old passwords do not match!';
            header("Location: /profile");
            exit();
        elseif(empty($_POST['old_password'])):
            $_SESSION['message']['error'] = 'Empty current password!';
            header("Location: /profile");
            exit();
        else:
            $id = (int)$_SESSION['auth_id'];
            $old_pass = clear_string($_POST['old_password']);
            $new_pass = clear_string($_POST['new_password']);
            $new_password_user = new_password($old_pass, $new_pass, $id);
        endif;
    }
    
    require_once "views/office/{$view}.php";
    //require_once "views/cart.php";
    
} else{
    header("Location: /");
}
