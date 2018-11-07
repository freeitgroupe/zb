<?php
defined("CATALOG") or die("Access denied");

function edit_warehouse_res($pages_id, $arr_post){
    //обрезаем последний элемент
    $del_key = array_pop($arr_post);
    //проходимся по массиву данных
    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];

    foreach($arr_post as $key=>$value):
        if(is_array($value) && (count($value) > 0)):
            $n='';
            $i=0;
            foreach ($value as $k=>$v):
                if(clear_string($v) == NULL) continue;
                $arr_post_clear[$key][$k] = clear_string($v);
                $n .= $arr_post_clear[$key][$k] . '|';
                $n = str_replace('||', '|', $n);
                $i++;
            endforeach;
            if($i > 1):
                $arr_post_clear[$key] = substr($n, 0, -1);
            else:
                $arr_post_clear[$key] = $n;
            endif;
        else:
            if($key == 'tax_summ'){
                $arr_post_clear[$key] = round(floatval(preg_replace("#,#",".",clear_string($value) )), 2);
                continue;
            }
            $arr_post_clear[$key] = clear_string($value);
        endif;
    endforeach;

    //проверка обязательных полей
    if(
        empty($arr_post_clear['name']) ||
        empty($arr_post_clear['state_id']) || empty($arr_post_clear['city']) )
    {
        $_SESSION['message']['error'] = 'You must fill in the required fields<br/>';

        if (empty($arr_post_clear['name'])) {
            $_SESSION['message']['error'] .= "Warehouse name<br />";
        }
        if (empty($arr_post_clear['state_id'])) {
            $_SESSION['message']['error'] .= "Enter State<br />";
        }
        if (empty($arr_post_clear['city'])) {
            $_SESSION['message']['error'] .= "Enter City<br />";
        }
        return false;
    }
    //получаем ключи массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);

    //Запрос в бд.
    $table_name = 'warehouse';
    $obj_db = Model_Driver::get_instance();

    $result = $obj_db->update($table_name,$keys_param,$values_param, ['id'=>$pages_id]);
    if(!$result):
        $_SESSION['message']['error'] = 'Error while adding data to the database';
        return false;
    endif;
    $_SESSION['message']['success'] = 'Data successfully updated';
    return true;
}

function new_warehouse_res($arr_post){
    //обрезаем последний элемент
    $del_key = array_pop($arr_post);
    //проходимся по массиву данных
    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];
    $param_id = [];

    foreach($arr_post as $key=>$value):
        if(is_array($value) && (count($value) > 0)):
            $n='';
            $i=0;
            foreach ($value as $k=>$v):
                if(clear_string($v) == NULL) continue;
                $arr_post_clear[$key][$k] = clear_string($v);
                $n .= $arr_post_clear[$key][$k] . '|';
                $n = str_replace('||', '|', $n);
                $i++;
            endforeach;
            if($i > 1):
                $arr_post_clear[$key] = substr($n, 0, -1);
            else:
                $arr_post_clear[$key] = $n;
            endif;
        else:
            if($key == 'tax_summ'){
                $_SESSION['data'][$key] = $arr_post_clear[$key] = round(floatval(preg_replace("#,#",".",clear_string($value) )), 2);
                continue;
            }
            $_SESSION['data'][$key] = $arr_post_clear[$key] = clear_string($value);
        endif;
    endforeach;

    foreach($_SESSION['data'] as $k=>$v) {
        $param_id[$k] = $v;
    }

    //проверка обязательных полей
    if(
        empty($arr_post_clear['name']) ||
        empty($arr_post_clear['state_id']) || empty($arr_post_clear['city']) )
    {
        $_SESSION['message']['error'] = 'You must fill in the required fields<br/>';

        if (empty($arr_post_clear['name'])) {
            $_SESSION['message']['error'] .= "Warehouse name<br />";
        }
        if (empty($arr_post_clear['state_id'])) {
            $_SESSION['message']['error'] .= "Enter State<br />";
        }
        if (empty($arr_post_clear['city'])) {
            $_SESSION['message']['error'] .= "Enter City<br />";
        }
        return false;
    }
    //получаем ключи массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);

    //Запрос в бд.
    $table_name = 'warehouse';
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->insert($table_name,$keys_param,$values_param);
    if(!$result):
        $_SESSION['message']['error'] = 'Error while adding data to the database';
        return false;
    endif;
    $_SESSION['message']['success'] = 'Data successfully updated';
    return true;
}