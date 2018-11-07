<?php defined("CATALOG") or die("Access denied");

//инфа о апселл продукте
function OneProductForUpsell($id){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT `upsell`.*, `products`.title FROM upsell INNER JOIN `products` ON `upsell`.product_id=`products`.id WHERE `upsell`.id = {$id}");
    if(!$res) return false;
    return $res[0];
}

//Редактирование upsell в базу данных
function EditProductsForUpsell($arr_post, $post_id){
    //обрезаем последний элемент
    $del_key = array_pop($arr_post);
    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];

    foreach($arr_post as $key=>$value):
        //if($key == '') continue;
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
            $arr_post_clear[$key] = clear_string($value);
        endif;
    endforeach;

    //проверка обязательных полей
    if( empty($arr_post_clear['default_price']) || empty($arr_post_clear['upsell_price']))
    {
        $_SESSION['message']['error'] = 'Fill in all fields<br/>';

        if (empty($arr_post_clear['default_price'])) {
            $_SESSION['message']['error'] .= "Default price for upsell product<br />";
        }
        if (empty($arr_post_clear['upsell_price'])) {
            $_SESSION['message']['error'] .= "Upsell price for upsell product<br />";
        }
        return false;
    }

    //Обработка десятичных чисел
    $arr_post_clear['default_price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['default_price'] )), 2);
    $arr_post_clear['upsell_price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['upsell_price'] )), 2);

    //получаем ключи  и значения массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);

    //Запрос в бд.
    //таблица в бд
    $table_name = 'upsell';
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update($table_name,$keys_param,$values_param, ['id'=>$post_id]);
    //debug_arr($result);
    if(!$result)
    {
        $_SESSION['message']['error'] =  'Ошибка при добавлении данных в бд';
        return false;
    }
    $_SESSION['message']['success'] = "Success!<br />";
    return true;
}

