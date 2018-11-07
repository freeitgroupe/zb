<?php
defined("CATALOG") or die("Access denied");

//Массив данных выбранной категории товара
//$id - id категории товара
function product_info_category($id){
    $db = Model_Driver::get_instance();
    $result = $db ->select(['*'], 'category', ['id'=>$id]);
    if(!$result) return false;
    return $result[0];
}

//продукты с раздела upsell
function product_upsell(){
    $db = Model_Driver::get_instance();
    $query = "SELECT `upsell`.*, `products`.title  FROM `upsell` INNER JOIN  `products` ON `upsell`.product_id=`products`.id";
    $result = $db->sqlQuery($query);
    if(!$result) return false;
    return $result;
}

//Массив дополнительных данных о товаре согласно категории товара
//$id - id категории товара
function product_additional_info($id){
    $db = Model_Driver::get_instance();
    $result = $db ->select(['*'], 'category', ['id'=>$id]);
    if(!$result) return false;
    return $result[0];
}

//Добавление нового продукта
//$arr_post - POST данный из формы долбавления продукта
//$arr_post
function new_product_res($arr_post){

    //обрезаем последний элемент
    $del_key = array_pop($arr_post);

    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];

    //Обработка чекбоксов
    $arr_checkbox = ['mark_hit','mark_expert', 'mark_available', 'mark_discontinued', 'mark_stock','mark_view', 'fast_delivery', 'free_delivery', 'perfect_delivery', 'exchange_prod','warranty_months', 'watermark'];

    //Формируем массив сессионных данных для склада
    foreach ($arr_post['warehouse'] as $k=>$v){
        $_SESSION['data'][$k] = [$v];
    }

    foreach($arr_post as $key=>$value):
        if($key == 'warehouse') continue;
        if($key == 'suppliers_id') continue;
        if($key == 'upsell_product') continue;
        if($key == 'price' && $value >''){
            $arr_post_clear[$key] = round(floatval(preg_replace("#,#",".",clear_string($value) )), 2);
            continue;
        }
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

    //приведение типа к числу
    $arr_post_clear['position'] = (int)$arr_post_clear['position'];
    $arr_post_clear['category_id'] = (int)$arr_post_clear['category_id'];
    $arr_post_clear['related_category'] = (int)$arr_post_clear['related_category'];

    //Обрабатываем пустые чекбоксы
    foreach ($arr_checkbox as $item):
        if(!array_key_exists ($item, $arr_post_clear)):
            $arr_post_clear[$item] = 0;
        endif;
    endforeach;

    //проверка обязательных полей
    if(
        empty($arr_post_clear['title']) ||
        empty($arr_post_clear['article']))
    {
        $_SESSION['message']['error'] = 'fill in all fields<br/>';

        if (empty($arr_post_clear['title'])) {
            $_SESSION['message']['error'] .= "title for product<br />";
        }
        if (empty($arr_post_clear['article_number'])) {
            $_SESSION['message']['error'] .= "Fill in the article number<br />";
        }
        return false;
    }
    //получаем ключи массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);

    //Запрос в бд.
    $table_name = 'products';
    $obj_db = Model_Driver::get_instance();

    $result = $obj_db->insert($table_name,$keys_param,$values_param);

    //debug_arr($result);
    if(!$result)
    {
        $_SESSION['message']['error'] =  'Error added param in table';
        return false;
    }

    //получаем id последней записи
    $id = mysqli_insert_id($obj_db->ins_db);
    //var_dump($id);exit;
    $alias = get_alias($table_name, 'alias', $arr_post_clear['title'], $id);

    //Записываем алиас
    $res_alias = $obj_db->update($table_name, ['alias'],[$alias],['id'=>$id]);
    //debug_arr($res_alias);
    //exit;
    if(!$res_alias){
        $_SESSION['message']['error'] .=  'Err updated alias';
        return false;
    }
    //Обработка изображения в случае пустого значения
    if(empty($_FILES['file']['tmp_name']))
    {
        $img = NOIMAGE;
        $result = $obj_db ->update($table_name,['image'],[$img], ['id'=>$id]
        );
        if(!$result){
            $_SESSION['message']['error'] ='Ошибка при обновлении данных о картинке в бд';
            return false;
        }
        $_SESSION['message']['success'] = 'Photo info updated successfully <br/>';
        //return true;
    }
    //Обработка изображения в случае загрузки на сервер
    if(!empty($_FILES['image']['tmp_name']))
    {
        if(!empty($_FILES['image']['error']))
        {
            $_SESSION['message']['error'] .= "Ошибка при загрузке изображения!<br/>";
            return false;
        }

        //данные для загрузки изображения
        $tmp_name = $_FILES['image']['tmp_name'];
        $name_file = $_FILES['image']['name'];
        $type_file = $_FILES['image']['type'];
        $size_file = $_FILES['image']['size'];
        $upload_tmp_file = PROD_IMG_TMP;
        $upload_base_file = PROD_IMG;
        $update_table ='products';
        $update_td_name ='image';
        $update_td_id ='id';
        $update_td_id_last_id_added = $id;
        //$
        $res_upload = downloadImage(
            $tmp_name,
            $name_file,
            $type_file,
            $size_file,
            $upload_tmp_file,
            $upload_base_file,
            $update_table,
            $update_td_name,
            $update_td_id,
            $update_td_id_last_id_added
        );

        if(!$res_upload) return false;

        //if($res_upload) return true;
    }
    //Обработка фото для галереи
    if(!empty($_FILES['gallery_image']['name'][0])){

        $arr_gallery_files = $_FILES['gallery_image'];
        $upload_tmp_file = GALLERY_IMG_TMP;
        $upload_base_file = GALLERY_IMG;
        $update_table ='products';
        $update_td_name ='gallery_image';
        $update_td_id ='id';
        $update_td_id_last_id_added = $id;

        $res_upload_gallery = downloadImageGallery(
            $arr_gallery_files,
            $upload_tmp_file,
            $upload_base_file,
            $update_table,
            $update_td_name,
            $update_td_id,
            $update_td_id_last_id_added
        );

        if(!$res_upload_gallery) return false;
        //return true;
    }

    //Добавление складов к продукту
    $res_warehouse = add_warehouse_for_prod($arr_post, $id);
    if(!$res_warehouse)
    {
       header("Location: edit-product/" . $res_alias);
       exit();
    }

    //Добавление upsell product
    if(isset($arr_post['upsell_product'])):
        $AddUpsellProductForNewProduct = AddUpsellProductForNewProduct($arr_post['upsell_product'],  $id, 'rel_upsell_prod', ['upsell_id', 'product_id']);
        if($AddUpsellProductForNewProduct===false):
            $_SESSION['message']['error'] .='Err Add Upsell Product For New Product </br>';
        else:
            $_SESSION['message']['success'] .='Succes Add Upsell Product For New Product </br>';
        endif;
    endif;

    return true;
}

//добавление склада к продукту
function add_warehouse_for_prod($arr_post, $last_add_id){
    //если нет id последнего продукта тогда выходим
    if(!$last_add_id) return false;

    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];
    //$arr_post_clear['price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['price'] )), 2);
    //Обработка складов
    //debug_arr($arr_post);
    //debug_arr($last_add_id);

    if($arr_post['warehouse'])
    {
        foreach($arr_post['warehouse'] as $item){
            //echo  $item['warehouse_price'] . '/////////'; exit;
            if(empty($item['warehouse_id']) || empty($item['warehouse_price'])) continue;
            if($item['warehouse_price'])
                $arr_post_clear['warehouse_price'] = round(floatval(preg_replace("#,#",".",$item['warehouse_price'] )), 2);
            if($item['warehouse_tax'])
                $arr_post_clear['warehouse_tax'] = round(floatval(preg_replace("#,#",".",$item['warehouse_tax'] )), 2);
            if($item['warehouse_discount'])
                $arr_post_clear['warehouse_discount'] = round(floatval(preg_replace("#,#",".",$item['warehouse_discount'] )), 2);
            if($item['warehouse_stock'])
                $arr_post_clear['warehouse_stock'] = (int)$item['warehouse_stock'];
            if($item['warehouse_availability'])
                $arr_post_clear['warehouse_availability'] = (int)$item['warehouse_availability'];
            if($item['warehouse_id'])
                $arr_post_clear['warehouse_id'] = (int)$item['warehouse_id'];
            if($item['warehouse_count'])
                $arr_post_clear['warehouse_count'] = (int)$item['warehouse_count'];
            //debug_arr($item); exit;

            //Добавляем id продукта в массив
            $arr_post_clear['product_id'] = $last_add_id;

            //получаем ключи массива
            $keys_param =  array_keys($arr_post_clear);
            $values_param =  array_values($arr_post_clear);
            //debug_arr($keys_param);
            //Запрос в бд.

            $table_name = 'rel_warehouse_product';
            $obj_db = Model_Driver::get_instance();
            $result = $obj_db->insert($table_name,$keys_param,$values_param);
            //debug_arr($result); exit;
            if(!$result)
            {
                $_SESSION['message']['error'] .=  'Err inner Db<br>';
                return false;
            }
        }
        $_SESSION['message']['success'] .=  'info for warehouse updated<br>';
        return true;
    }
}

//добавление upsell продуктов для основного продуктв
function AddUpsellProductForNewProduct($arr_post, $last_add_id, $table_name, $param_table=[]){
    //если нет id последнего продукта тогда выходим
    if(!$last_add_id) return false;

    //$param_table_for_arr_post - параметры которы приходит масссивом в $arr_post
    //$param_table_for_last_add_id - постоянный параметр в таблице для $last_add_id
    list($param_table_for_arr_post, $param_table_for_last_add_id) = $param_table;

    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];
    $i=0;
    $s=0;
    if(count($arr_post) != 0)
    {
        foreach ($arr_post as $item){
            if((int)clear_string($item) == 0) continue;
            $arr_post_clear['param_arr'][] = clear_string($item);
        }

        if(count($arr_post_clear['param_arr']) == 0) return NULL;
        //отключаем автокоммит
        mysqli_autocommit(Model_Driver::get_instance()->ins_db, FALSE);
        foreach ($arr_post_clear['param_arr'] as $item){
            try
            {
                //проверяем есть ли данная запись в бд если есть то пропускаем добавление данных
                $res = Model_Driver::get_instance()->select(['*'], $table_name, [$param_table_for_arr_post=>$item,$param_table_for_last_add_id=>$last_add_id]);
                //считаем количество выбраных элементов
                if($res): $res=['select'=>$s++];  continue; endif;

                //добавление данных
                $res = Model_Driver::get_instance()->insert($table_name, $param_table, [$item, $last_add_id]);
                //считаем количество добавленных элементов
                if($res): $res=['insert'=>$i++];  continue; endif;
                if(!$res){
                    throw new Exception(e);
                }
            }
            catch(Exception $e)
            {
                mysqli_rollback(Model_Driver::get_instance()->ins_db);
                return FALSE;
            }
        }
        mysqli_commit(Model_Driver::get_instance()->ins_db);
        return $res;
    }
    return NULL;
}

