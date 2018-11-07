<?php
defined("CATALOG") or die("Access denied");

function auth_cookie($user_id){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM users WHERE id ={$user_id}");
    if($result && mysqli_num_rows($result) > 0)
    {
        $row = mysqli_fetch_array($result);
        $_SESSION['auth'] = 'yes_auth';
        $_SESSION['auth_role'] = $row['role'];
        $_SESSION['auth_id'] = $row['id'];
        //$_SESSION['auth_avatar'] = $row['avatar'];
        //$_SESSION['auth_pass'] = $row["pass"];
        //$_SESSION['auth_surname'] = $row["surname"];
        $_SESSION['auth_name'] = $row["name"];
        //$_SESSION['auth_patronymic'] = $row["patronymic"];
        $_SESSION['auth_sex'] = $row["sex"];
        //$_SESSION['auth_birthday'] = $row["birthday"];
        $_SESSION['auth_city'] = $row["city"];
        $_SESSION['auth_address'] = $row["address"];
        $_SESSION['auth_type'] = $row["type"];
        $_SESSION['auth_email'] = $row["email"];
        return true;

    }
    return false;
}

function check_id_user($id = FALSE) {
    $cookie_name = 'user';
    //если пришел id возвращаем его
    if($id) {return $id;}
    //пытаемся вытащить id пользователя из кук
    else {
        //проверяем наличие ключа
        if(array_key_exists($cookie_name,$_COOKIE)) {
            //если массив есть тогда
            unpackageCookieAuth($_COOKIE[$cookie_name]);
        }
        else {
            //если кук нет
            //throw new Exception('Доступ запрещен');
            return false;
        }
    }
}

//Формирование кук
function setCookieUser($user_id){
    $cookie_name = 'user';
    $cookie_text = package($user_id);
    //выполняем проверку
    if($cookie_text) {
        //формируем куку Имя, значение, врямя жизни кук 0, путь создания кук
        setcookie($cookie_name,$cookie_text,0,PATH);
        //если все гуд возвращаем TRUE
        return TRUE;
    }
}

//шифрования текста cookie
function package($user_id) {
    //проверяем id пользователя
    if ($user_id) {
        //массив данных которые будем писать в куки
        $arr = array($user_id, time(), VERSION);
        //формируем строку для записи в файл кук
        $str = implode("|", $arr);
        //покуем строку и возвращаем ее
        return encrypt($str);
    } else {
        return false;
    }
}

function encrypt($str) {
    //вектор инициализации
    $td = mcrypt_module_open(MCRYPT_BLOWFISH,'',MCRYPT_MODE_CFB,'');
    $iv = mcrypt_create_iv(mcrypt_enc_get_iv_size($td),MCRYPT_RAND);
    //открываем буфер обмена
    mcrypt_generic_init($td,KEY,$iv);
    //шифруем строку
    $crypt_text = mcrypt_generic($td,$str);
    //закрываем буфер
    mcrypt_generic_deinit($td);
    //возвращаем вектор инициализации и зашифрованную строку
    return $iv.$crypt_text;
}

function unpackageCookieAuth($str) {
    //расшифровуем куку
    $result = decrypt($str);
    //записываем массив со свойствами
    list($user_id,$created,$version) = explode('|',$result);

    if(!$user_id || !$version || !$created) {
        return false;
    }

    //сверяем свойства version полученное из кук с куками из конфига
    if($version != VERSION) {
        //throw new Exception("НЕ правильная версия файла кук");
        return false;
    }
    if((time() - $created) > EXPIRATION) {
        //throw new Exception("Закончилось время сессии");
        return false;
    }

    if((time() - $created) > VARNING_TIME) {
        //создаем новую куку
        if(!auth_cookie($user_id)) return false;
        setCookie($user_id);
    }
    return TRUE;
}

//Расшифровуем куку
function decrypt($str) {
    $td = mcrypt_module_open(MCRYPT_BLOWFISH,'',MCRYPT_MODE_CFB,'');
    //получаем длину вектора инициализации
    $iv_size = mcrypt_enc_get_iv_size($td);
    //получаем вектор инициализации
    $iv = substr($str,0,$iv_size);
    //получаем шифрованный текст
    $crypt_text = substr($str,$iv_size);
    //открываем буфер
    mcrypt_generic_init($td,KEY,$iv);
    //расшифровуем данные
    $text = mdecrypt_generic($td,$crypt_text);
    //закрываем буфер
    mcrypt_generic_deinit($td);
    //возвращаем полученный текст
    return $text;
}
