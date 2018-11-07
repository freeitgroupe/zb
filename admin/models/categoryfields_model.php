<?php
//категории с заполненными дополнительными свойствами
function CategoryWithAdditionalAttr(){
    $query = "SELECT * FROM `category` WHERE `additional_attribute_category` IS NOT NULL AND `additional_attribute_category`<>''";
    if(!$res = Model_Driver::get_instance()->sqlQuery($query)) return false;
    return $res;
}
//Декодирование JSON свойств в массив
function DecodeJsonObject($object){
    if(!$object) return false;
    return json_decode($object, true);
}
//Возвращаем массив
function ReturnNeArrFromJson($arr){
    $new_arr = [];
    $arrr = [];
    foreach($arr as $v) {
        $arrr = DecodeJsonObject($v['additional_attribute_category']);
        $v['additional_attribute_category'] =  $arrr;
        $new_arr[] = $v;
    }
    return $new_arr;
}
//