<?php defined("CATALOG") or die("Access denied");

function authManager($login, $pass, $response){
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

    if($fealtures < 3){
        global $link;
        $result = mysqli_query($link, "SELECT * FROM team_admin_users WHERE email = '$login' AND pass= '$pass'");
    }else{
        if($response > '')
        {
            global $link;
            $result = mysqli_query($link, "SELECT * FROM team_admin_users WHERE email = '$login' AND pass = '$pass'");
        }
    }

    if ($result && mysqli_num_rows($result) > 0){
        if($fealtures) delete_fealtures($ip_u);
        $row = mysqli_fetch_array($result);
        $_SESSION['auth_phoneManager'] = $row['phone'];
        $_SESSION['authManager'] = 'yes_auth';
        $_SESSION['auth_roleManager'] = $row['role'];
        $_SESSION['auth_idManager'] = $row['admin_access_id'];
        $_SESSION['auth_nameManager'] = $row["name"];
        $_SESSION['auth_emailManager'] = $row["email"];
        echo json_encode($res = ['auth' => 'yes']);
        exit();

    }else {
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
function protectAuthManager($response=false){
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





















