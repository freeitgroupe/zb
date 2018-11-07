<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/remindPass_model.php";

if(isset($_POST['email']) && isset($_POST['event_remind'])){
    $email = $_POST['email'];      
    $remind_pass = remind_pass($email);
}
require_once "views/{$view}.php";


