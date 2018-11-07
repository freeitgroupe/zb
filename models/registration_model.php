<?php
defined("CATALOG") or die("Access denied");

function registration_user($email, $pass, $pass_again){
    $error = [];
    if (!preg_match("/^(?:[a-z0-9]+(?:[-_.]?[a-z0-9]+)?@[a-z0-9_.-]+(?:\.?[a-z0-9]+)?\.[a-z]{2,5})$/i",trim($email))) $error[] = "Please enter a valid email!";
    if(validate_email($email) == false) $error[] = "Please enter a valid email!";
    if (strlen($pass) < 6 or strlen($pass) > 15) $error[] = "Enter a password from 6 to 15 characters!";
    if ($pass != $pass_again) $error[] = "The passwords you entered do not match!";

    if (count($error))
        {
            echo implode('<br />',$error);exit();
        }
        else
        {
            $pass = md5($pass);
            $pass = strrev($pass);
            $pass = "9nm2rv8q".$pass."2yo6z";
            $ip = $_SERVER['REMOTE_ADDR'];
            $code = gen_code (10);

            //Формируем запрос в бд
            $query = "INSERT INTO users(email, pass, datetime, ip, code) VALUES('".$email."','".$pass."', NOW(),'".$ip."','".$code."')";

            //echo $query;exit;

            global $link;
            $result = mysqli_query($link, $query);
            if($result)
            {
                $message='';
                //подключаем макет
                //Формируем email. для клиента
                //require_once "mail/template/template.php";

                $to = "$email";
                $subject = 'Успешная регистрация';
                $message .= 'ZupplyBox - Registration';
                $headers  = "Content-type: text/html; charset=utf-8 \r\n"; //Кодировка письма
                $headers .= "From: ZupplyBox - Registration <support@ZupplyBox.com>\r\n"; //Наименование и почта отправителя
                $send_mail = mail($to, $subject, $message, $headers); //Отправка письма с помощью функции mail
                if(!$send_mail) {exit('false');}

                unset($_SESSION);
                exit('true');
            }
            else
            {
                exit('false');
            }
        }
}

function validate_email($email){
    global $link;
    $result = mysqli_query($link, "SELECT email FROM users WHERE email = '$email'");
    if(mysqli_num_rows($result) > 0)
    {
        return false;
    }
    else
    {
        return true;
    }
}