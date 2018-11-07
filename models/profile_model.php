<?php
defined("CATALOG") or die("Access denied");
//обрабатываем данные из формы
function users_option($personal_info, $id)
{
    //var_dump($personal_info['phone']);exit();
    $user_id = (int)$id;
    $user_name = clear_string($personal_info['name']);
    $user_patronymic = clear_string($personal_info['patronymic']);
    $user_surname = clear_string($personal_info['surname']);
    $user_sex = (int)clear_string($personal_info['sex']);

    //очищаем поле телефона от запятых   
    $personal_info['phone'] = str_replace(',', '', $personal_info['phone']);

    if (is_array($personal_info['phone'])) {
        //удаляем пустые ключи
        $personal_info['phone'] = array_diff($personal_info['phone'], array(''));
        $user_phone = clear_string(implode(',', $personal_info['phone']));
    } else {
        $user_phone = clear_string($personal_info['phone']);
    }

    $user_email = clear_string($personal_info['email']);
    $user_birthday = clear_string($personal_info['birthday']);
    $user_city = clear_string($personal_info['city']);
    $user_address = clear_string($personal_info['address']);
    $user_type = (int)clear_string($personal_info['type']);

    $err = [];//для хранения ошибок

    //проверяем данные
    if (strlen($user_name) < 3 || strlen($user_name) > 20) {
        $err[] = "The name must contain between 3 and 20 characters!";
    }
    if (strlen($user_phone) < 3 || strlen($user_phone) > 80) {
        $err[] = "Enter phone number!";
    }
    if (!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i", $user_email)) {
        $err[] = 'Please enter a valid email!';
    }

    if (strlen($user_type) < 1) {
        $user_type = 0;
    }
    if (!empty($err)) {
        $_SESSION['message']['error'] = implode('<br/>', $err);
       return false;
    }

    $dataquery =
        "
        name='" . $user_name . "',
        patronymic='" . $user_patronymic . "',
        surname='" . $user_surname . "',
        sex='" . $user_sex . "',
        phone='" . $user_phone . "',
        email='" . $user_email . "',
        birthday='" . $user_birthday . "',
        city='" . $user_city . "',
        address='" . $user_address . "',
        type='" . $user_type . "'            
        ";
    global $link;
    $result = mysqli_query($link, "UPDATE users SET $dataquery WHERE id='{$user_id}'");

    if ($result) {

        //Формируем данные о телефоне в массив
        if (strripos($user_phone, ",")) {
            $phone = explode(",", $user_phone);
            $_SESSION['auth_phone'] = [];
            for ($i = 0, $count = count($phone); $i < $count; $i++) {
                $_SESSION['auth_phone'][] = $phone[$i];
            }
        } else {
            $_SESSION['auth_phone'] = $user_phone;
        }
        //удаляем пустые значения
        if (is_array($_SESSION['auth_phone'])) {
            $_SESSION['auth_phone'] = array_diff($_SESSION['auth_phone'], array(''));
        }

        //Обновляем следующие данные
        $_SESSION['auth_name'] = $user_name;
        $_SESSION['auth_address'] = $user_address;
        $_SESSION['auth_type'] = $user_type;
        $_SESSION['auth_email'] = $user_email;
        $_SESSION['message']['success'] = "Success update!";
        return true;
    }else{
        $_SESSION['message']['error'] = "Error update!";
        return false;
    }

}

function  new_password($old_pass, $new_pass, $id){
    //фильтруем данные по новому паролю
    $err = array();
    if (strlen($new_pass) < 6 or strlen($new_pass) > 15) $err[] = "Enter a password from 6 to 15 characters!";

    if(!empty($err)){
        $_SESSION['message']['error'] = implode("<br/>", $err);
        header("Location: /profile");
        exit;
    }
    //проверяем старый пароль, шифруем и делаем запрос в бд
    $old_pass   = md5($old_pass);
    $old_pass   = strrev($old_pass);
    $old_pass   = "9nm2rv8q".$old_pass."2yo6z";
    global $link;
    $result = mysqli_query($link, "SELECT pass FROM users WHERE id= '$id' and pass = '$old_pass'");

    if(isset($result) && mysqli_num_rows($result)){
        //шифруем новый пароль
        $new_pass   = md5($new_pass);
        $new_pass   = strrev($new_pass);
        $new_pass   = "9nm2rv8q".$new_pass."2yo6z";

        $update = mysqli_query($link,"UPDATE users SET pass = '$new_pass' WHERE  id = '$id'");
        if($update){
            $_SESSION['message']['success'] = "Password successfully updated!";
            header("Location: /profile");
            exit();
        }else{
            $_SESSION['message']['error'] = 'Error updating data!';
            header("Location: /profile");
            exit();
        }
    }else{
        $_SESSION['message']['error'] = "The requested data is not correct!";
        header("Location: /profile");exit();
    }
}

//Подключение соц сети
function addSocialFacebook($socialUid, $email){
    $socialUid = clear_string($socialUid);
    //делаем запрос в бд с id users на проверк утакого аккаунта в базе
    $query = "SELECT * FROM `users` WHERE `oauth_uid_facebook`= {$socialUid}";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    //if(!$res) redirectError('Error data!', '/profile');
    if($res) redirectError('This account is already in use!', '/profile');
    //обновляем данные в бд для пользователя с указанным имейлом
    $res = Model_Driver::get_instance()->update('users', ['oauth_uid_facebook'], [$socialUid], ['email'=>$email]);
    if(!$res) redirectError('Error data update!', '/profile');
    redirectSuccess('Update success!', '/profile');
}

//Отключение соц сети
function delSocialFacebook($email){
    //обновляем данные в бд для пользователя с указанным имейлом
    $res = Model_Driver::get_instance()->update('users', ['oauth_uid_facebook'], [''], ['email'=>$email]);
    if(!$res) redirectError('Error data update!', '/profile');
    exit(json_encode(['response'=>'true']));
    //redirectSuccess('Update success!', '/profile');
}

function pathFacebook(){
    //выполняем проверку на существование аккаунта
    $res = Model_Driver::get_instance()->select(['oauth_uid_facebook'], 'users', ['email'=>$_SESSION['auth_email']]);
    //var_dump($res[0]['oauth_uid_facebook']);exit;
    if(empty($res[0]['oauth_uid_facebook'])){
        $pathFacebook ='<a href="' . URL_AUTH ."?"."client_id=".CLIENT_ID."&redirect_uri=".urlencode(REDIRECT)."&response_type=code&scope=email" . '">Add Facebook</a>';
    }else{
        $pathFacebook = '<a href="#" class="unbindFB" id="unbindFB">Unbind Facebook account</a>';
    }
    return $pathFacebook;
}