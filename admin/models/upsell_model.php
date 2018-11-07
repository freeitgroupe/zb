<?php defined("CATALOG") or die("Access denied");

//поиск продуктов по артиклу товара или заголовку
function SearchProductsForUpsell($search){
    $search = clear_string($search);
    if(!$search) return false;
    $db = Model_Driver::get_instance();
    $query = "SELECT `id`, `article`, `title` FROM `products` WHERE mark_view='1' AND `title` LIKE '%{$search}%' or article LIKE '%{$search}%'";
    //echo  $query; exit;
    $res = $db->sqlQuery($query);
    if(!$res) return false;
    if(!empty($res)) {
        $out = '';
        foreach ($res as $value) {
            $out .= '<option class="option-val" data-productID="'.$value["id"].'" value="'.$value["id"].'">' . $value["title"] .' ('.$value["article"].')'. '</option>';
        }
        return $out;
    }else{
        return false;
    }
}

//количество продуктов upsell
function CountProductsForUpsell(){
    $db = Model_Driver::get_instance();
    $query="SELECT COUNT(*) FROM (SELECT `upsell`.*, `products`.title as title_product, `products`.id as products_ids  FROM `upsell` INNER JOIN `products` ON `upsell`.product_id=`products`.id) as prevSqlparam";
    $res = $db->sqlQuery($query);
    if(!$res) return false;
    return $res[0]['COUNT(*)'];
}

//вывод upsell products
function ProductsForUpsell($start_pos, $perpage){
    $db = Model_Driver::get_instance();
    $query ="SELECT `upsell`.*, `products`.title as title_product, `products`.id as products_id FROM `upsell` INNER JOIN `products` ON `upsell`.product_id=`products`.id ORDER BY `upsell`.id DESC LIMIT {$start_pos}, {$perpage}";
    $res = $db->sqlQuery($query);
    if(!$res) return false;
    return $res;
}

//добавление upsell в базу данных
function AddProductsForUpsell($arr_post){
    //обрезаем последний элемент
    $del_key = array_pop($arr_post);
    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];
    foreach($arr_post as $key=>$value):
        if($key == 'search') continue;
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
            $_SESSION['data'][$key] = $arr_post_clear[$key] = clear_string($value);
        endif;
    endforeach;

    //проверка обязательных полей
    if(
        empty($arr_post_clear['product_id']) ||
        empty($arr_post_clear['default_price']) ||
        empty($arr_post_clear['upsell_price']))
    {
        $_SESSION['message']['error'] = 'Fill in all fields<br/>';
        if (empty($arr_post_clear['product_id'])) {
            $_SESSION['message']['error'] .= "Product for upsell<br />";
        }
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
    //debug_arr($arr_post_clear);exit;

    //получаем ключи  и значения массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);

    //Запрос в бд.
    //таблица в бд
    $table_name = 'upsell';
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->insert($table_name,$keys_param,$values_param);
    //debug_arr($result); exit;
    if(!$result)
    {
        $_SESSION['message']['error'] = 'Error DB';
        return false;
    }
    $_SESSION['message']['success'] = "Success!<br />";
    return true;
}
