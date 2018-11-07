<?php
defined("CATALOG") or die("Access denied");
function geoLocationUsers(){
    $stringLocation=NULL;
    if(!isset($_COOKIE['stringLocation'])) {
        $PublicIP = geoLocationIp();
        $response = file_get_contents("http://api.ipinfodb.com/v3/ip-city/?key=f32121c88c4786b04c98378032615ef7c0655c39beec7a6e79d5e0553bdeea39&ip=" . $PublicIP . "&format=json");
        if(!$response) return  $stringLocation = 'not found';
        $url = json_decode($response);
        //debug_arr($url);
        if(!empty($url->statusCode)){
            $stringLocation = $url->cityName . ', ' . $url->zipCode;
        }else{
            $stringLocation = 'not found';
        }
        //setcookie('stringLocation', $stringLocation, time() + 600, '/'); // Set cookie for 6 min
    }else{
        //$stringLocation = $_COOKIE['stringLocation'];
    }
    return $stringLocation;
}
//$geoLocationUsers = geoLocationUsers();
$geoLocationUsers = 'error connect!';