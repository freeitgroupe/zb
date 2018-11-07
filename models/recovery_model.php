<?php
defined("CATALOG") or die("Access denied");

function recovery_res($code){
    $code = clear_string($code);
    if($code != ''){
        global $link;
        $result = mysqli_query($link, "SELECT * FROM users WHERE code = '$code'");
        if($result && mysqli_num_rows($result) > 0){
            $row = mysqli_fetch_array($result);
            $_SESSION['recovery']['recovery_status'] = 1;
            $_SESSION['recovery']['recovery_surname'] = $row["surname"];
            $_SESSION['recovery']['recovery_name'] = $row["name"];
            $_SESSION['recovery']['recovery_patronymic'] = $row["patronymic"];
            $_SESSION['recovery']['recovery_address'] = $row["address"];
            $_SESSION['recovery']['recovery_phone'] = $row["phone"];
            $_SESSION['recovery']['recovery_email'] = $row["email"];            
            return true;
        }else{
            return false;
        }
    }else{return false;}
}

function recovery_pass($pass, $email){
    $error = array();
    if (strlen($pass) < 6 or strlen($pass) > 15) $error[] = "Enter a password between 6 and 15 characters!";
    if (strlen($email) < 6 or strlen($pass) > 30) $error[] = "Invalid user data!";
    if (count($error)) { 
        echo implode('<br />',$error);exit();
        }else  {
        $pass   = md5($pass);
        $pass   = strrev($pass);
        $pass   = "9nm2rv8q".$pass."2yo6z";
        $ip = $_SERVER['REMOTE_ADDR'];
        $code = gen_code (10);

        global $link;
        $result = mysqli_query($link, "UPDATE users SET pass='$pass', code='$code', ip='$ip' WHERE email='$email'");
        if($result){
            //require_once "mail/template/template.php";
            //Формируем email. для клиента
            $to = "$email";
            $subject = 'Successful password recovery!';
            $message = 'Password changed!';
            $headers  = "Content-type: text/html; charset=utf-8 \r\n"; //Кодировка письма
            $headers .= "From: zupplybox-new password <from@zupplybox.com>\r\n"; //Наименование и почта отправителя
            $send_mail = mail($to, $subject, $message, $headers); //Отправка письма с помощью функции mail
            if(!$send_mail){ echo 'false';exit();}
            unset($_SESSION['recovery']);
            echo 'true'; exit();

        } else { echo 'false'; exit();}

    };
}