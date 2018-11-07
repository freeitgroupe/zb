<?php
//Все скидки
function allDiscount(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT * FROM `discount`");
    if(!$res) return false;
    return $res;
}

function generationCode(){

}