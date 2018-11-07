<?php defined("CATALOG") or die("Access denied");

function auth($login, $pass, $response){
    //получаем ip пользователя
    $ip_u = $_SERVER['REMOTE_ADDR'];
    $login = clear_string($login);
    $pass = md5(clear_string($pass));
    $pass = strrev($pass);
    $pass = strtolower("9nm2rv8q".$pass."2yo6z");

    //формирование счетчика в секундах для подсчета времени блокировки времени
    $time_clean = time() - (3600 * 24 * FEALT);

    //останавливаем блокировку через
    clean_fealtures($time_clean);

    $fealtures = get_fealtures($ip_u);
    $result='';

    if($fealtures < 3){
        global $link;
        $result = mysqli_query($link, "SELECT * FROM users WHERE email = '$login' AND pass= '$pass'");
    }else{
        if($response > '')
        {
            global $link;
            $result = mysqli_query($link, "SELECT * FROM users WHERE email = '$login' AND pass = '$pass'");
        }
    }

    if ($result && mysqli_num_rows($result) > 0)
    {
        if($fealtures){
            delete_fealtures($ip_u);
        }

        $row = mysqli_fetch_array($result);
        //формируем куку
        setCookieUser($row['id']);

        //Формируем данные о телефоне в массив
        if(strripos($row['phone'], ",")){
            $phone = explode(",", $row['phone']);
            $_SESSION['auth_phone']=[];
            for($i=0, $count= count($phone); $i <$count; $i++){
                $_SESSION['auth_phone'][] = $phone[$i];
            }
        }else{
            $_SESSION['auth_phone'] = $row['phone'];
        }

        $_SESSION['auth'] = 'yes_auth';
        $_SESSION['auth_role'] = $row['role'];
        $_SESSION['auth_id'] = $row['id'];
        //$_SESSION['auth_avatar'] = $row['avatar'];
        //$_SESSION['auth_pass'] = $row["pass"];
        //$_SESSION['auth_surname'] = $row["surname"];
        $_SESSION['auth_name'] = $row["name"];
        //$_SESSION['auth_patronymic'] = $row["patronymic"];
        //$_SESSION['auth_sex'] = $row["sex"];
        //$_SESSION['auth_birthday'] = $row["birthday"];
        $_SESSION['auth_city'] = $row["city"];
        $_SESSION['auth_address'] = $row["address"];
        //$_SESSION['auth_type'] = $row["type"];
        $_SESSION['auth_email'] = $row["email"];
        $_SESSION['auth_facebook'] = $row["oauth_uid_facebook"];
        //$_SESSION['auth_google'] = $row["oauth_uid_google"];
        echo json_encode($res = ['auth' => 'yes']);

        //после авторизации, проверяем наличие куки с идентификатором, если такая кука есть, и есть добавленный товар с данным идентификатором в таблице с корзиной то обновляем user_id в этой таблице.
        //поиск на наличие куки у пользователя
        //поиск на наличие идентификатора куки в таблице с корзиной
        //если найдено тогда обновляем user_id где есть данный идентификатор
        //если нет то просто выходим
        $resCookiekey = checkCookieForBuyerInShoppingCart('reg_buyer', $_SERVER['REMOTE_ADDR']);
        if($resCookiekey){
            $resUpdate = updateCookiekeyForBuyerInShoppingCart($resCookiekey, $_SERVER['REMOTE_ADDR'], $_SESSION['auth_id']);
            if(!$resUpdate){
                my_log('Error updateCookiekeyForBuyerInShoppingCart'.__FUNCTION__);
            }
        }

        exit();

    }else
    {
        //были ли у пользователя попытки
        if($fealtures == NULL) {
            //записываем ip в бд
            insert_fealt($ip_u);
        }
        //обновляем данные по конкретному ip
        elseif($fealtures > 0) {
            update_fealt($ip_u,$fealtures); // увеличили на 1
        }

        $_SESSION['fealtures'] = $fealtures;
        //если уже имеем 2 попытки тогда
        if($_SESSION['fealtures'] >= 2){
            echo json_encode($res = ['fealt'=>$fealtures, 'auth' => 'no', 'protect'=>'true', 'text'=>'Authorization error']);
            exit();
        }
        echo json_encode($res = ['fealt'=>$fealtures, 'auth' => 'no', 'text'=>'Authorization error']);
        exit();
    }
}
//капча google
function protect_auth($response=false){
    //если капча пустая
    if(empty($response)) {
        return false;
        echo json_encode($res = ['auth' => 'no', 'grecaptcha' => 'fls']);
        exit();
    }

    $url = 'https://www.google.com/recaptcha/api/siteverify';
    //data POST
    $secret = '6LexWEEUAAAAAN-32saOdkYGYXabzjVMnsh0rr8l';
    $recaptcha = $response;
    $ip = $_SERVER['REMOTE_ADDR'];

    $url_data = $url.'?secret='.$secret.'&response='.$recaptcha.'&remoteip='.$ip;

    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url_data);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, FALSE);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);

    $res = curl_exec($curl);
    curl_close($curl);

    $res=json_decode($res);
    if($res->success) {
        return true;
    }else {
        exit('error_prot_auth');
    }
}

function oauthSocialFacebook($socialUid){
    $ip_u = $_SERVER['REMOTE_ADDR'];
    //делаем запрос в бд с id users
    $res = Model_Driver::get_instance()->sqlQuery("SELECT * FROM `users` WHERE `oauth_uid_facebook`= '$socialUid'");
//    var_dump($res);
//    debug_arr($res);exit;
    if($res > false && $res != NULL){
        $fealtures = get_fealtures($ip_u);
        if($fealtures){
            delete_fealtures($ip_u);
        }
        $row =$res[0];
        setCookieUser($row['id']);
        //Формируем данные о телефоне в массив
        if(strripos($row['phone'], ",")){
            $phone = explode(",", $row['phone']);
            $_SESSION['auth_phone']=[];
            for($i=0, $count= count($phone); $i <$count; $i++){
                $_SESSION['auth_phone'][] = $phone[$i];
            }
        }else{
            $_SESSION['auth_phone'] = $row['phone'];
        }
        $_SESSION['auth'] = 'yes_auth';
        $_SESSION['auth_role'] = $row['role'];
        $_SESSION['auth_id'] = $row['id'];
        $_SESSION['auth_name'] = $row["name"];
        $_SESSION['auth_city'] = $row["city"];
        $_SESSION['auth_address'] = $row["address"];
        $_SESSION['auth_email'] = $row["email"];
        exit('<META HTTP-EQUIV="refresh" CONTENT="0" url="/profile">');

    }else{
        $_SESSION['message']['error'] = 'Account not found!';
        header("Location: /login");
        exit;
    }
}





















