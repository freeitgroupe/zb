<?php
defined("CATALOG") or die("Access denied");

//достаем дополнительные свойства и формируем вложенны массив
function ResAttrcategory($attr){
    if($attr == NULL) return false;
    $attr = json_decode($attr, true);
    //$attr = array_diff($attr, []);
    $new_arr=[];
    if(!isset($attr[0])){
        $new_arr[0] = $attr; return $new_arr;
    }
    return $attr;
}

//добавление дополнительных полей к категории
function new_fields_for_category($arr_post){
    //обрезаем последний элемент
    $del_key = array_pop($arr_post);

    $arr_post_clear =[];
    $_SESSION['data']['id'] = $arr_post_clear['id'] = $arr_post['id'];
    $arr_post['additional_attribute'][0]['init_id'] = time();
    //debug_arr($arr_post['additional_attribute'][0]);exit;

    //Формируем массив сессионных данных для склада
    foreach ($arr_post['additional_attribute'][0] as $k=>$v){
        $_SESSION['data'][$k] = clear_string($v);
        $arr_post_clear['additional_attribute'][$k] = $v;
        //$arr_post_clear['additional_attribute']['init_id'] = random_bytes(5);
    }


    //проверяем на пустоту и возвращаем сообщение с ошибкой
    if(empty($arr_post_clear['additional_attribute']['additionaltext_label'])){
        $_SESSION['message']['error'] = 'Empty name! Please fill in the name field!';
        return false;
    }
    //debug_arr($_SESSION['data']);exit;
    //проверить существуют ли дополнительные параметры в категории
    $IssetAdditionalParamInCategory = find_one_param_table('category', 'id', $arr_post_clear['id']);
    //debug_arr($IssetAdditionalParamInCategory);

    //Если нет дополнитльных параметров сразу пишем данные
    if($IssetAdditionalParamInCategory[0]['additional_attribute_category'] == NULL):
        //кодируем массив
        $additional_attr = json_encode($arr_post_clear['additional_attribute']);
        $additional_attr = clear_string($additional_attr);
        //debug_arr($additional_attr);
        //формируем запрос в бд
        $res = Model_Driver::get_instance()->update('`category`', ['additional_attribute_category'],[$additional_attr], ['id'=>$arr_post_clear['id']],['=']);
        //debug_arr($res);exit;
        if(!$res) return false;
        $_SESSION['message']['success'] = 'Successful!';
        return $res;
    //Данные по атрибутам есть, обновляем существующие
    else:
        $new_arr=[];
        $res = json_decode($IssetAdditionalParamInCategory[0]['additional_attribute_category'], true);
        //debug_arr($res);

        if(!isset($res[0])):
            $new_arr[] = $res;
        else:
            $new_arr = $res;
        endif;
        $new_arr[] = $arr_post_clear['additional_attribute'];
//        debug_arr($new_arr);exit;

        $ser_new_arr = json_encode($new_arr);
        $ser_new_arr = clear_string($ser_new_arr);
        $res = Model_Driver::get_instance()->update('`category`', ['additional_attribute_category'],[$ser_new_arr], ['id'=>$arr_post_clear['id']],['=']);
        //debug_arr($res);exit;
        if(!$res) return false;
        $_SESSION['message']['success'] = 'Successful!';
        return $res;
    endif;
}

function DeleteAttributesInCategory($param_name, $pages_id){
    //проверить существуют ли дополнительные параметры в категории
    $IssetAdditionalParamInCategory = find_one_param_table('category', 'id', $pages_id);
    if($IssetAdditionalParamInCategory[0]['additional_attribute_category'] == NULL) return false;
    $new_arr=[];
    $res = json_decode($IssetAdditionalParamInCategory[0]['additional_attribute_category'], true);
    //debug_arr($res);
    if(!isset($res[0])):
        $new_arr[] = $res;
    else:
        $new_arr = $res;
    endif;
    $update_arr=[];
    foreach ($new_arr as $k=>$v){
        if($param_name == $v['init_id']){
            continue;
        }
        if(empty($v)){
            continue;
        }
        $update_arr[$k]=$v;
    }
    //debug_arr($update_arr);
    if(count($update_arr) == 0):
        $ser_new_arr = NULL;
    else:
        $ser_new_arr = json_encode($update_arr);
    endif;
    $ser_new_arr = clear_string($ser_new_arr);
    //debug_arr($update_arr);exit;
    $res = Model_Driver::get_instance()->update('`category`', ['additional_attribute_category'],[$ser_new_arr], ['id'=>$pages_id],['=']);
    if(!$res) return false;
    //$_SESSION['message']['success'] = 'Successful!';
    return $res;
    //debug_arr($update_arr);

}



