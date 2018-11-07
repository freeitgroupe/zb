<?php
defined("CATALOG") or die("Access denied");

//Массив данных о продукте
function product_info_for_edit($pages_id){
    $db = Model_Driver::get_instance();
    $result = $db ->select(['*'], 'products', ['id'=>$pages_id]);
    if(!$result) return false;
    return $result[0];
}

//Массив данных выбранной категории товара
//$id - id категории товара
function product_info_category($id){
    $db = Model_Driver::get_instance();
    $result = $db ->select(['*'], 'category', ['id'=>$id]);
    if(!$result) return false;
    return $result[0];
}

//получение продуктов из раздела upsell
function product_upsell(){
    $db = Model_Driver::get_instance();
    $query = "SELECT `upsell`.*, `products`.title  FROM `upsell` INNER JOIN  `products` ON `upsell`.product_id=`products`.id";
    $result = $db->sqlQuery($query);
    if(!$result) return false;
    return $result;
}

//получение поставщиков из раздела suppliers

//Массив дополнительных данных о товаре согласно категории товара
//$id - id категории товара
function product_additional_info($id){
    $db = Model_Driver::get_instance();
    $result = $db ->select(['*'], 'category', ['id'=>$id]);
    if(!$result) return false;
    return $result[0];
}


function add_warehouse_for_prod($arr_post, $last_add_id){
    //если нет id последнего продукта тогда выходим

    if(!$last_add_id) return false;

    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];
    //$arr_post_clear['price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['price'] )), 2);
    //Обработка складов

    if($arr_post['warehouse'])
    {
        foreach($arr_post['warehouse'] as $item){
            if(empty($item['id']) || empty($item['price'])) continue;
            if($item['price'])  $arr_post_clear['price'] = round(floatval(preg_replace("#,#",".",$item['price'] )), 2);
            if($item['warehouse_tax'])  $arr_post_clear['warehouse_tax'] = round(floatval(preg_replace("#,#",".",$item['warehouse_tax'] )), 2);
            if($item['warehouse_discount'])  $arr_post_clear['warehouse_discount'] = round(floatval(preg_replace("#,#",".",$item['warehouse_discount'] )), 2);
            if($item['warehouse_stock']) $arr_post_clear['warehouse_stock'] = (int)$item['warehouse_stock'];
            if($item['warehouse_availability']) $arr_post_clear['warehouse_availability'] = (int)$item['warehouse_availability'];
            if($item['id']) $arr_post_clear['id'] = (int)$item['id'];
            if($item['warehouse_count']) $arr_post_clear['warehouse_count'] = (int)$item['warehouse_availability'];

            //Добавляем id продукта в массив
            $arr_post_clear['product_id'] = $last_add_id;
            debug_arr($arr_post_clear);exit;
            //получаем ключи массива
            $keys_param =  array_keys($arr_post_clear);
            $values_param =  array_values($arr_post_clear);
            //debug_arr($keys_param);
            //Запрос в бд.

            $table_name = 'rel_warehouse_product';
            $obj_db = Model_Driver::get_instance();
            $result = $obj_db->insert($table_name,$keys_param,$values_param);
            //debug_arr($result);
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

//редактирование продукта
function edit_product_res($pages_id, $arr_post){

    //обрезаем последний элемент
     $del_key = array_pop($arr_post);

    //проходимся по массиву данных
    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];

    //Обработка чекбоксов
    $arr_checkbox = ['mark_hit','mark_expert', 'mark_available', 'mark_discontinued', 'mark_stock','mark_view', 'fast_delivery', 'free_delivery', 'perfect_delivery', 'exchange_prod','warranty_months', 'watermark'];

    //debug_arr($arr_post);

    foreach($arr_post as $key=>$value):
        if($key == 'upsell_product') continue;
        if($key == 'suppliers_id') continue;
        if($key == 'price' && $value >''){
            $arr_post_clear[$key] = round(floatval(preg_replace("#,#",".",clear_string($value) )), 2);
            continue;
        }
        if($key == 'price' && $value ==''){
            $arr_post_clear[$key] = 0.00;
            continue;
        }
        if($key == 'position' && $value == '') $value = 0;
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
   //debug_arr($arr_post_clear);exit;

    //Обрабатываем пустые чекбоксы
    foreach ($arr_checkbox as $item):
        if(!array_key_exists ($item, $arr_post_clear)):
            $arr_post_clear[$item] = 0;
        endif;
    endforeach;

    //Обрабатываем пустой upsell
    if(!array_key_exists('upsell_product', $arr_post)){
        $arr_post['upsell_product'] = [0];
    }

    //проверка обязательных полей
    if(
        empty($arr_post_clear['title']) ||
        empty($arr_post_clear['article']))
    {
        $_SESSION['message']['error'] = 'You must fill in the required fields<br/>';

        if (empty($arr_post_clear['title'])) {
            $_SESSION['message']['error'] .= "Name of product<br />";
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

    $result = $obj_db->update($table_name,$keys_param,$values_param, ['id'=>$pages_id]);
    if(!$result):
        $_SESSION['message']['error'] = 'Ошибка при добавлении данных в бд';
        return false;
    endif;
    $_SESSION['message']['success'] = "Update product info!<br/>";

    //debug_arr($result);
    //var_dump($_FILES['image']['tmp_name']);

    //Обработка изображения в случае загрузки на сервер
    if(!empty($_FILES['image']['tmp_name']))
    {
        if(!empty($_FILES['image']['error']))
        {
            $_SESSION['message']['error'] = "Ошибка при загрузке изображения!";
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
        $update_td_id_last_id_added = $pages_id;
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
    }

    if(!empty($_FILES['gallery_image']['name'][0])){

        $arr_gallery_files = $_FILES['gallery_image'];
        $upload_tmp_file = GALLERY_IMG_TMP;
        $upload_base_file = GALLERY_IMG;
        $update_table ='products';
        $update_td_name ='gallery_image';
        $update_td_id = 'id';
        $update_td_id_last_id_added = $pages_id;

        $res_upload_gallery = downloadImageGallery(
            $arr_gallery_files,
            $upload_tmp_file,
            $upload_base_file,
            $update_table,
            $update_td_name,
            $update_td_id,
            $update_td_id_last_id_added
        );

        //var_dump($res_upload_gallery);
        //debug_arr($_SESSION['message']);
        //exit;

        if(!$res_upload_gallery) return false;
        //return true;
    }

    //Редактирование upsell
    if(isset($arr_post['upsell_product'])):
        $EditUpsellProductForNewProduct = EditUpsellProductForProduct($arr_post['upsell_product'], $pages_id, 'rel_upsell_prod', ['upsell_id', 'product_id']);
        if($EditUpsellProductForNewProduct===false):
            $_SESSION['message']['error'] .='Err Edit Upsell Product For New Product </br>';
        else:
            $_SESSION['message']['success'] .='Succes Edit Upsell Product For New Product </br>';
        endif;
    endif;

     //добавляем новые id
    //Добавление upsell product
    if(isset($arr_post['upsell_product'])):
        $AddUpsellProductForNewProduct = AddUpsellProductForNewProduct($arr_post['upsell_product'],  $pages_id, 'rel_upsell_prod', ['upsell_id', 'product_id']);
        if($AddUpsellProductForNewProduct===false):
            $_SESSION['message']['error'] .='Err Add Upsell Product For New Product </br>';
        else:
            $_SESSION['message']['success'] .='Succes Add Upsell Product For New Product </br>';
        endif;
    endif;

    $_SESSION['message']['success'] .= 'Data successfully updated';
    return true;

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
    $arr_post_clear['param_arr']=[];
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
                if($res): $res=['select'=>$s++];  continue; endif;

                //добавление данных
                $res = Model_Driver::get_instance()->insert($table_name, $param_table, [$item, $last_add_id]);
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


//==Редактирование и удаление данных о upsell
//Проверить есть ли информация о абселл по данному продукту, делаем селект для таблицы->
//->есть ли есть тогда сверяем с массивом upsell по по полю upsell id и оставляем из первого(полученного из бд после селект) только те которые не совпадают.
//->формруем данные для удаления из бд
function EditUpsellProductForProduct($arr_post, $product_editable_id, $table_name, $param_table=[]){

    //если нет id последнего продукта тогда выходим
    if(!$product_editable_id) return false;

    //$param_table_for_arr_post - параметры которы приходит масссивом в $arr_post
    //$param_table_for_last_add_id - постоянный параметр в таблице для $last_add_id
    list($param_table_for_arr_post, $param_table_for_product_editable_id) = $param_table; //'upsell_id', 'product_id'

    //формируем обработанный массив данных $arr_post_clear
    //$arr_post_clear['param_arr']=[];
    $arr_post_clear=[];
    $d=0;
    $s=0;
    if(count($arr_post) == 0):
        $arr_post_clear['param_arr'][] = 0;
    else:
        foreach ($arr_post as $item){
            if((int)clear_string($item) == 0):
                $arr_post_clear['param_arr'][] = 0;
                //continue;
            endif;
            $arr_post_clear['param_arr'][] = clear_string($item);
        }
    endif;

    //Формруем запрос в бд где нет совпадений по данным массива и редактируемому id
    $query = "SELECT * FROM $table_name WHERE $param_table_for_product_editable_id = $product_editable_id AND $param_table_for_arr_post NOT IN(";

    foreach ($arr_post_clear['param_arr'] as $item){
        $query .= "$item,";
    }
    $query = substr($query, 0,-1);
    $query .=")";
    $res = Model_Driver::get_instance()->sqlQuery($query);

    //Если есть совпадения значит данные по $param_table_for_product_editable_id обновлены и необходимы удалить ненужные записи
    if($res > NULL):
        $arr_param_id=[];
        foreach ($res as $item):
            $arr_param_id[] = $item[$param_table_for_arr_post];
        endforeach;
        $query_1 = "DELETE FROM {$table_name} WHERE $param_table_for_product_editable_id=$product_editable_id AND $param_table_for_arr_post IN(" . implode(",", $arr_param_id) .")";
        $res = Model_Driver::get_instance()->sqlQuery($query_1, true);
        if(!$res) return false;
        return true;
    else:
        return NULL;
    endif;
}

//Удаление изображения из галереи
function deleteImageGallery($pages_id, $img_name){
    //достаем имя галереи
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['gallery_image'], 'products',['id'=>$pages_id]);
    if(!$result) return false;

    //Имя хранимое в бд
    $name_gallery = $result[0]['gallery_image'];
    
    //Формируем массив данных
    $name_gallery = explode('|', $name_gallery);
    //var_dump($img_name);//exit;
    //var_dump(in_array($img_name, $name_gallery));//exit;
    $name_gallery = array_diff($name_gallery, ['']);

    if(!in_array("$img_name", $name_gallery)){
        return false;
    }
    
    $new_name_gallery ='';
    foreach ($name_gallery as $item)
    {
        if($img_name == $item)
        {
            continue;
        }else
        {
            $new_name_gallery .= $item . '|';
        }
    }
    if(!empty($new_name_gallery))
    {
        $new_name_gallery = substr($new_name_gallery, 0, -1);
    }
    if(empty($new_name_gallery))  $new_name_gallery = 'nophoto.jpg';
    //$new_name_gallery = str_replace('||', '|', $new_name_gallery);
    //$name_gallery = preg_replace("#$gallery_id#","", $name_gallery);
    $result =$obj_db->update('products', ['gallery_image'], [$new_name_gallery], ['id'=>$pages_id]);
    
    if(!$result) return 'false_update';

    if($img_name !='nophoto.jpg'){
        if(!unlink($_SERVER['DOCUMENT_ROOT'] . GALLERY_IMG . $img_name))
        {
            return 'false_unlink_img';
        }
    }

    return $result;
}

//Удаление основного изображения
//перезаписываем параметр в nophoto.jpg
function deleteImagePhoto($pages_id, $img_name='false'){
    $img_name = 'nophoto.jpg';
    $obj_db= Model_Driver::get_instance();
    $result = $obj_db ->update('products', ['image'],[$img_name], ['id'=>$pages_id]);
    if(!$result) return false;
    return true;
}

//Асинхронные подгрузка фото
function uploadImageAjax($pages_id, $file){
    $obj_db = Model_Driver::get_instance();

    if(!empty($file['tmp_name']))
    {
        if(!empty($file['error']))
        {
            //$_SESSION['message']['error'] = "Ошибка при загрузке изображения!";
            return false;
        }
        //данные для загрузки изображения
        $tmp_name = $file['tmp_name'];
        $name_file = $file['name'];
        $type_file = $file['type'];
        $size_file = $file['size'];
        $upload_tmp_file = PROD_IMG_TMP;
        $upload_base_file = PROD_IMG;
        $update_table ='products';
        $update_td_name ='image';
        $update_td_id ='id';
        $update_td_id_last_id_added = $pages_id;
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

        if($res_upload) return true;
    }


}

//Ассинхронная подгрузка фото для галереи
function uploadImageGallery($pages_id, $file){

    if(!empty($file['name'][0]))
    {
        $arr_gallery_files = $file;
        $upload_tmp_file = GALLERY_IMG_TMP;
        $upload_base_file = GALLERY_IMG;
        $update_table ='products';
        $update_td_name ='img_gallery';
        $update_td_id ='id';
        $update_td_id_last_id_added = $pages_id;

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
        return true;
    }
    return false;


}

//поиск совпадений (редактируемый продукт, продукты upsell)
function product_upsell_rel_prod($arr_upsell, $arr_prod_upsell, $arr_param=false){

    $new_arr_1=[];
    $arr=[];

    if($arr_param == false):
        if ($arr_prod_upsell == false)  return $arr_upsell;

        if($arr_prod_upsell > ''){
            $arr = explode("|", $arr_prod_upsell);
            $arr = array_diff($arr,['']);
        }else{
            return $arr_upsell;
        }
    else:
     if ($arr_prod_upsell == false)  return $arr_upsell;
     $arr = $arr_prod_upsell;
    endif;

    foreach ($arr_upsell as $item) {
        $new_arr_1[$item['id']] = $item;
    }

    foreach ($new_arr_1 as $k=>$v){
        foreach ($arr as $item){
            if($k == $item['upsell_id']){
                $new_arr_1[$k]['selected'] ='true';
            }
        }
    }

    return $new_arr_1;

}

function product_info_suppliers($pages_id){
$query = "SELECT `suppliers`.*, `rel_suppliers_products`.id AS rel_suppliers_products_id, `rel_suppliers_products`.product_id, `rel_suppliers_products`.supplier_id FROM `suppliers` INNER JOIN `rel_suppliers_products` ON `suppliers`.supplier_id = `rel_suppliers_products`.supplier_id AND `suppliers`.visible = '1' AND `rel_suppliers_products`.product_id=$pages_id";
$res = Model_Driver::get_instance()->sqlQuery($query);
if(!$res) return false;
return $res;
}

function product_suppliers_rel_prod($suppliers, $product_info_suppliers){
    $new_arr_1=[];
    $arr=[];
    if ($product_info_suppliers == false)  return $suppliers;
    $arr = $product_info_suppliers;

    foreach ($product_info_suppliers as $item) {
        $new_arr_1[$item['supplier_id']] = $item;
    }
    //выделяем совпадения
    foreach ($new_arr_1 as $k=>$v){
        foreach ($arr as $item){
            if($k == $item['supplier_id']){
                $new_arr_1[$k]['selected'] ='true';
            }
        }
    }
    $new_arr_2=[];

    foreach ($suppliers as $k=>$v){
        $new_arr_2[$v['supplier_id']] = $v;
    }
    $res_arr = $new_arr_1 + $new_arr_2;
    return $res_arr;
}

//работа блока Склад
function edit_warehouse_res($post_id, $arr_post){
    //$arr Информация о складах
    $db = Model_Driver::get_instance();
    /*
    [warehouse_id] => 1
    [warehouse_price] => 249.99
    [warehouse_tax] => 5
    [warehouse_discount] => 10
    [warehouse_stock] => 1
    [warehouse_availability] => 2
    [edit_warehouse_success] => Confirm
     */

    //обрезаем последний элемент
    $del_key = array_pop($arr_post);
    //debug_arr($arr_post);exit;
    foreach($arr_post as $key=>$value):
        if(is_array($value) && (count($value) > 0)):
            $n='';
            $i=0;
            foreach ($value as $k=>$v):
                //роверяем на пустоту
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
            if(empty(clear_string($value))){
                $value = 0;
                //$_SESSION['message']['error'] ='Укажите все поля при заполнени данных о складе!';
                //return false;
            }
            if($key == 'warehouse_tax' || $key == 'warehouse_discount' || $key == 'warehouse_price'){
                $arr_post_clear[$key] = round(floatval(preg_replace("#,#",".",clear_string($value) )), 2);
            }else{
                $arr_post_clear[$key] = clear_string($value);
            }

        endif;
    endforeach;

    $arr_post_clear['warehouse_price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['warehouse_price'] )), 2);
    $arr_post_clear['warehouse_discount'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['warehouse_discount'] )), 2);
    $arr_post_clear['warehouse_count'] =(int)$arr_post_clear['warehouse_count'];

    //получаем ключи массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);
    //Запрос в бд.
    $table_name = 'rel_warehouse_product';

    //проверяем привязку склада к продукту
    $prevRatingQuery = "SELECT * FROM `rel_warehouse_product` WHERE product_id = ".$post_id . " AND warehouse_id=" . $arr_post_clear['warehouse_id'];
    $prevRatingResult = $db->sqlQuery($prevRatingQuery);
    //debug_arr( $prevRatingResult);exit;
    if($prevRatingResult != FALSE):
        $query ="UPDATE $table_name SET ";
        foreach ($arr_post_clear  as $k=>$v) {
            $query .= $k . '=' . $v . ',';
        }
        $query = substr($query, 0, -1);
        $query .=" WHERE product_id=" . $post_id . " AND warehouse_id=" . $arr_post_clear['warehouse_id'];
       // debug_arr($query);exit;
        $result = $db->sqlQuery($query, true);

        if(!$result):
            $_SESSION['message']['error'] = 'Ошибка при добавлении данных в бд';
            return false;
        endif;
        $_SESSION['message']['success'] = 'Stock Information Updated!';
    else:
        //добавим в массивы ключей и значений информацию о продукте
        $keys_param[]='product_id';
        $values_param[]=$post_id;
        $result = $db->insert($table_name,$keys_param,$values_param);
        if(!$result):
            $_SESSION['message']['error'] ='Ошибка при добавлении данных в бд';
            return false;
        endif;
        $_SESSION['message']['success'] = 'Stock information added!';
    endif;

}

//удаление продукта из склада
function delete_product_from_warehouse_res($pages_id, $arr_post){
    //$pages_id - id склада
    //$arr_post - массив данных из формы
    $warehouse_id = $arr_post['warehouse_id'];
    $res = Model_Driver::get_instance()->sqlQuery("DELETE FROM `rel_warehouse_product` WHERE warehouse_id={$warehouse_id} AND product_id={$pages_id}", true);
    //debug_arr($res);exit;
    if(!$res){
        $_SESSION['message']['error'] = 'Product deleted from warehouse!';
        return false ;
    }
    $_SESSION['message']['success'] = 'Product deleted from warehouse!';
    return $res;
}

function EditSuppliersForProduct($arr_post, $editId, $tableName){
    //$tableName='rel_suppliers_products';
    if($arr_post==false){
        //удаляем все записи с id данного продукта
        $query_1 = "DELETE FROM $tableName WHERE product_id = $editId";
        $res = Model_Driver::get_instance()->sqlQuery($query_1, true);
        if(!$res) return false;
        return $res;
    }
    if(count($arr_post) != 0) {
        //очищаем аргументы массива
        foreach ($arr_post as $item) {
            if ((int)clear_string($item) == 0) continue;
            $arr_post_clear[] = (int)clear_string($item);
        }
        if (count($arr_post_clear) == 0) return false;
    }

    //Формруем запрос в бд где нет совпадений по данным массива и редактируемому id
    $query = "SELECT * FROM $tableName WHERE product_id = $editId AND supplier_id NOT IN(";
    foreach ($arr_post_clear as $item){
        $query .= "$item,";
    }
    $query = substr($query, 0,-1);
    $query .=")";
    //debug_arr($query);
    //return $query;
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if($res > NULL):
        $arr_param_id=[];
        foreach ($res as $item):
            $arr_param_id[] = $item['supplier_id'];
        endforeach;
        //удаляем записи которых нет в диапозоне переданных supplier_id
        $query_1 = "DELETE FROM $tableName WHERE product_id = $editId AND supplier_id IN(" . implode(",", $arr_param_id) .")";
        $res = Model_Driver::get_instance()->sqlQuery($query_1, true);
        if(!$res) return false;
    endif;

    //проверяем необходимо ли добавить новые записи
    $res = Model_Driver::get_instance()->select(['supplier_id'],$tableName, ['product_id'=>$editId]);
    //формируем массив только с данными которые необходимо добавить в таблицу
    $arrAddToTable=[];
    if($res > NULL){
        foreach ($arr_post_clear as $item){
            foreach ($res as $k=>$v){
                if($item == $v){ continue; }
                $arrAddToTable[]=$item;
            }
        }
    }else{
        $arrAddToTable = $arr_post_clear;
    }
    //debug_arr($arrAddToTable);exit;
    //добавляем данные в таблицу используя сформированный массив
    if(!AddSuppliersForProduct($arrAddToTable, $editId, $tableName)) return false;
    return $arrAddToTable;
}

