<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
//var_dump($_GET); exit;
if(isset($_SESSION['auth'])) header('Location: /');
if (isset($_GET['code'])) {
    $params = array(
        'client_id'     => CLIENT_ID_G,
        'client_secret' => CLIENT_SECRET_G,
        'redirect_uri'  => REDIRECT_G,
        'grant_type'    => 'authorization_code',
        'code'          => $_GET['code']
    );
    $url = 'https://accounts.google.com/o/oauth2/token';
    $curl = curl_init();
    curl_setopt($curl, CURLOPT_URL, $url);
    curl_setopt($curl, CURLOPT_POST, 1);
    curl_setopt($curl, CURLOPT_POSTFIELDS, urldecode(http_build_query($params)));
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
    $result = curl_exec($curl);
    curl_close($curl);
    $tokenInfo = json_decode($result, true);
    if (!isset($tokenInfo['access_token'])) header('Location: /');

    $params['access_token'] = $tokenInfo['access_token'];
    $userInfo = json_decode(file_get_contents('https://www.googleapis.com/oauth2/v1/userinfo' . '?' . urldecode(http_build_query($params))), true);
    if (!isset($userInfo['id'])) header('Location: /');
    /*
    $_SESSION['user_google'] -
    Array
        (
            [id] => 103371983416498966204
            [email] => email@gmail.com
            [verified_email] => 1
            [name] => name name
            [given_name] => Name
            [family_name] => name
            [link] => https://plus.google.com/103371983416498966204
            [picture] => https://lh3.googleusercontent.com/-VD8q2pINtZs/AAAAAAAAAAI/AAAAAAAAAXY/ei2Nx1xwHzI/photo.jpg
            [gender] => male
            [locale] => ru
        )
    */
    $_SESSION['user_google'] = $userInfo = $userInfo;
    header('Location: /profile');
    exit;
}
if (isset($_GET['unlink_google'])) {
    if(isset($_SESSION['user_google'])){unset($_SESSION['user_google']);}
    header('Location: /profile');
}