<?php
defined("CATALOG") or die("Access denied");
function fungenpass() {
    $number = 7;
    $arr = array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','r','s','t','u','v','x','y','z',
        '1','2','3','4','5','6','7','8','9','0');
    // Генерируем пароль
    $pass = "";
    for($i = 0; $i < $number; $i++)
    {
        // Вычисляем случайный индекс массива
        $index = rand(0, count($arr) - 1);
        $pass .= $arr[$index];
    }
    return $pass;
}

function remind_pass($email){
    $email = clear_string($email);
    if ($email != "")
    {
        global $link;
        $result = mysqli_query($link, "SELECT * FROM users WHERE email='$email'");
        if($result && mysqli_num_rows($result) > 0)
        {    
            $row = mysqli_fetch_array($result);
            //Формируем письмо с сылкой для восстановления пароля
            //Формируем email. для клиента
            $to = "$email";
            $subject = 'Password recovery <strong>“'.$_SERVER['SERVER_NAME'].'”</strong>.';
            $msg = 'Hello user with email: <strong>'.$row['email'].'</strong><br>';
            $msg .= 'You have requested to change your password <strong>“'.$_SERVER['SERVER_NAME'].'”</strong>. ';
            $msg .= 'To change your password, please click the following link:<br>';
            $msg .= '<a href="'.PATH.'recovery/'.$row['code'].'">Password recovery link</a><br>';
            $msg .= 'If you received this email and did not perform any actions on the site <strong>“'.$_SERVER['SERVER_NAME'].'”</strong>, ignore this letter.<br><br>';
            $msg .= ' Sincerely, the administration of the site <strong>“'.$_SERVER['SERVER_NAME'].'”</strong>';
            $headers  = "Content-type: text/html; charset=utf-8 \r\n"; //Кодировка письма
            $headers .= "From: zupplybox-recovery <from@zupplybox.com>\r\n"; //Наименование и почта отправителя
            $send_mail = mail($to, $subject, $msg, $headers); //Отправка письма
            echo 'yes';
            exit();
        }else {
            echo 'This e-mail was not found!';exit();
        }
    }
    else {
        echo 'Enter your email address';exit();
    }
}
?>