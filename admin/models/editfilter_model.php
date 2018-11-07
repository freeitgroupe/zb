<?php
defined("CATALOG") or die("Access denied");

//Массив данных о выбранном фильтре
function filter_info_for_edit($pages_id){
    //$db=Model_Driver::get_instance();
    //$result = $db ->select(['*'], 'filter', ['id'=>$pages_id]);
    //Выводим наименование и значение фильтров ()
    global $link;
    $query = "SELECT filter_value.id AS filter_value_id, filter_value.filter_id, filter_value.value_filter, filter.name FROM filter_value INNER JOIN filter ON filter_value.filter_id = filter.id WHERE filter_value.id = {$pages_id}";
    $result = mysqli_query($link,$query); 
    if(!$result) return false;
    $arr=[];    
    while($row = mysqli_fetch_assoc($result)){
        $arr[] = $row; 
    }    
    return $arr[0];
}

//выбранные категории для id фильтра передаваемого в функцию
//передаем id из filter_value и выбираем все category_id
function filter_category_choose($pages_id){
    $db=Model_Driver::get_instance();
    $result = $db ->select(['category_id'], 'filter_value', ['id' => $pages_id]);
    if(!$result) return false;
    //if (($result[0]['category_id'])) return $result[0]['category_id'];
    $result = explode('|', $result[0]['category_id']);
    return $result;
}

//выбранные продукты для id фильтра передаваемого в функцию
//передаем id из filter_value и выбираем все product_id
function filter_product_choose($pages_id){
    $db = Model_Driver::get_instance();
    $result = $db ->select(['product_id'], 'filter_value', ['id' => $pages_id]);
    if(!$result) return false;
    //if (($result[0]['category_id'])) return $result[0]['category_id'];
    $result = explode('|', $result[0]['product_id']);
    return $result;
}


//Добавление нового Фильтра
//$arr_post - POST данный из формы добавления фильтра
//$arr_post
function new_filter_value_res($arr_post){
    /*
     * содержание пост данных
     Array
    (
        [title] => Наименование товара
        [article_number] => Артикул товара
        [price] => Цена товара
        [old_price] => Устаревшая цена товара
        [brand] => Наименование производителя товара
        [description] => Описание товара
        [mini_description] => Короткое описание товара
        [datetime] => Время обновления данных о товаре
        [m_keywords] => Ключевые слова
        [m_description] => Ключевое описание
        [alias] => Алиас для товара
        [visible] => Видимость товара для сайта
        [new] =>  Новинка среди товара
        [leader] => Лидер среди товаров
        [sale] => Скидка на  товар
        [stock] => Количество товара на складе
        [bonuses_count] => Количество бонусов за товар
        [parent] => Категория товара
        [edit_pages_success] => Подтвердить
    )
    */
    //debug_arr($_FILES);exit;

    //обрезаем последний элемент
    $arr_post = array_slice($arr_post,0, 18);

    //проходимся по массиву данных
    //формируем обработанный массив данных $arr_post_clear
    $arr_post_clear=[];
    foreach($arr_post as $key=>$value){
        $arr_post_clear[$key] = clear_string($value);
    }

    //обрабатываем числовые (целые и десятичные данные)
    //целые числовые данные
    $arr_post_clear['visible'] = (int)$arr_post_clear['visible'];
    $arr_post_clear['new'] = (int)$arr_post_clear['new'];
    $arr_post_clear['leader'] = (int)$arr_post_clear['leader'];
    $arr_post_clear['sale'] = (int)$arr_post_clear['sale'];
    $arr_post_clear['stock'] = (int)$arr_post_clear['stock'];
    $arr_post_clear['parent'] = (int)$arr_post_clear['parent'];

    //десятичные данные с округлением
    $arr_post_clear['price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['price'] )), 2);
    $arr_post_clear['old_price'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['old_price'] )), 2);
    $arr_post_clear['bonuses_count'] = round(floatval(preg_replace("#,#",".",$arr_post_clear['bonuses_count'] )), 2);

    //Формирование сессионных данных
    $_SESSION['data'] = [];
    foreach($arr_post_clear as $key=>$value){
        $_SESSION['data'][$key] = $value;
    }

    //проверка обязательных полей
    if(
        empty($arr_post_clear['title']) ||
        empty($arr_post_clear['article_number']) ||
        empty($arr_post_clear['description']))
    {
        $_SESSION['message']['error'] = 'Вы должны заполнить обязательные поля<br/>';

        if (empty($arr_post_clear['title'])) {
            $_SESSION['message']['error'] .= "Наименование товара<br />";
        }
        if (empty($arr_post_clear['article_number'])) {
            $_SESSION['message']['error'] .= "Заполните артикул товара<br />";
        }
        if (empty($arr_post_clear['description'])) {
            $_SESSION['message']['error'] .= "Заполните описание<br />";
        }
        return false;
    }
    //получаем ключи массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);
    //debug_arr($keys_param);
    //var_dump($values_param);
    //exit;

    //Запрос в бд.
    $table_name = 'products';
    $obj_db = Model_Driver::get_instance();

    $result = $obj_db->insert($table_name,$keys_param,$values_param);
    if(!$result)
    {
        $_SESSION['message']['error'] =
            'Ошибка при добавлении данных в бд';
        return false;
    }

    //получаем id последней записи
    $id = mysqli_insert_id($obj_db->ins_db);
    //var_dump($id);exit;

    //Обработка изображения в случае пустого значения
    if(empty($_FILES['file']['tmp_name']))
    {
        $img = NOIMAGE;

        $result = $obj_db ->update($table_name,
            ['image'],
            [$img],
            ['id'=>$id]
        );

        if(!$result){
            $_SESSION['message']['error'] =
                'Ошибка при обновлении данных
                о картинке в бд';
            return false;
        }
        $_SESSION['message']['success'] =
            'Данные о фото успешно обновлены';

        //return true;
    }

    //Обработка изображения в случае загрузки на сервер
    if(!empty($_FILES['file']['tmp_name']))
    {
        if(!empty($_FILES['file']['error']))
        {
            $_SESSION['message']['error'] = "Ошибка при загрузке изображения!";
            return false;
        }

        //данные для загрузки изображения
        $tmp_name = $_FILES['file']['tmp_name'];
        $name_file = $_FILES['file']['name'];
        $type_file = $_FILES['file']['type'];
        $size_file = $_FILES['file']['size'];
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
    if(!empty($_FILES['galleryimg']['name'][0])){

        $arr_gallery_files = $_FILES['galleryimg'];
        $upload_tmp_file = GALLERY_IMG_TMP;
        $upload_base_file = GALLERY_IMG;
        $update_table ='products';
        $update_td_name ='img_gallery';
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
        return true;
    }

    return true;
}

//редактирование фильтра
function edit_filter_value_res($pages_id, $arr_post){

    //обрезаем последний элемент с кнопкой
    $arr_post = array_slice($arr_post, 0, -1);

    //Обрезаем элемент с именем фильтра
    $arr_post = array_slice($arr_post, 0);

    if(!isset($arr_post['category_id'])){
        $arr_post['category_id'] = 0;
    }

    //проходимся по массиву данных
    //формируем обработанный массив данных $arr_post_clear
    //debug_arr($arr_post);//exit;

    $arr_post_clear=[];
    $arr_post_child = [];

    //Для хранения массива с катеориями
    $new_arr=[];

    foreach($arr_post as $key=>$value){
        if(!is_array($arr_post[$key])){
            $arr_post_clear[$key] = clear_string($value);
            continue;
        }

        foreach ($arr_post[$key] as $k=>$v){
            $new_arr[$k] = clear_string($v);
        }

        //$arr_post_clear[$key] = $new_arr;
        $arr_post_clear[$key]= implode('|',$new_arr);
        continue;
    }

    //debug_arr($new_arr);exit();
    /*debug_arr($arr_post_clear);
    debug_arr($new_arr);
    exit;*/

    //проверка обязательных полей
    if(empty($arr_post_clear['value_filter']))
    {
        $_SESSION['message']['error'] = 'Вы должны заполнить обязательные поля<br/>';

        if (empty($arr_post_clear['filter'])) {
            $_SESSION['message']['error'] .= "Наименование фильтра<br />";
        }

        if (empty($arr_post_clear['value_filter'])) {
            $_SESSION['message']['error'] .= "Заполните параметр фильтра<br />";
        }

        return false;
    }

    //получаем ключи массива
    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);
    //debug_arr($keys_param);
    //var_dump($values_param);
    //exit;

    //Запрос в бд.
    $table_name = 'filter_value';
    $obj_db = Model_Driver::get_instance();

    $result = $obj_db->update($table_name,$keys_param,$values_param, ['id'=>$pages_id]);
    if(!$result)
    {
        $_SESSION['message']['error'] =
            'Ошибка при добавлении данных в бд';
        return false;
    }
    $_SESSION['message']['success'] = 'Данные для админ панели обновлены!</br>';

    //Формируем запрос в таблицу relations_filval_cat
    for ($i = 0, $cnt = count($new_arr); $i < $cnt; $i++){
        $res_1 = $obj_db->update('relations_filval_cat', ['filter_category_id'],[$new_arr[$i]], ['filter_value_id' =>$pages_id]);
        if(!$res_1) return false;
    }

    $_SESSION['message']['success'] .= 'Данные для фильтров обновлены!';
    return true;

}

//Выводим продукты согласно категориям в которых используется фильтр
//$arr массив категорий сравниваем с категорией продукта
function edit_table_filter_for_product($arr, $arr_prod=[]){
    global $link;
    $query = "SELECT * FROM products WHERE ";
    $query_param = '';
    //переберем массив категорий
    foreach ($arr as $item){
        $query_param .= 'parent='.$item . ' OR ' ;
    }
    $query_param = substr($query_param, 0, -3);
    $query_param = $query_param;
    $query =  $query . $query_param;
    //var_dump($query);

    $result = mysqli_query($link,$query);
    if(!$result) return false;
    $arr=[];
    while($row = mysqli_fetch_assoc($result)){
        if($arr_prod > 0)
        {
            foreach ($arr_prod as $item)
            {
                if($row['id'] == $item )
                {
                   $row['filter_value'] = 'true';
                    break;
                }
            }
        }
        
        $arr[] = $row;
    }
    return $arr;
}

//Обновление продукта из списка фильтров
function prod_for_filter_success($pages_id, $arr_post){

    //обрезаем последний элемент с кнопкой
    $arr_post = array_slice($arr_post, 0, -1);

    //Достаем элемент с именем [table-pages_product_length]
    $param_shift = array_shift($arr_post);
    //debug_arr($arr_post);exit;

    if(!isset ($arr_post['product_id'])){
        $arr_post['product_id'] = 0;
    }

    foreach($arr_post as $key=>$value){
        if(!is_array($arr_post[$key]))
        {
            $arr_post_clear[$key] = clear_string($value);
            continue;
        }

        $arr_post_clear[$key]= implode('|',$arr_post[$key]);
        continue;
    }
    //debug_arr($arr_post_clear);exit;

    $keys_param =  array_keys($arr_post_clear);
    $values_param =  array_values($arr_post_clear);
    
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('filter_value', $keys_param, $values_param, ['id'=>$pages_id]);
    if(!$result) return false;
    $_SESSION['message']['success'] = 'Данные успешно обновлены!';
    return true;

}

function product_active_for_filter($edit_table_filter_for_product, $filter_product_choose){
    $arr_new=[];
    foreach($edit_table_filter_for_product as $item)
    {
        $arr_new[$item['id']] = $item;
        foreach ($filter_product_choose as $itm)
        {
            if($arr_new[$item['id']] == $itm)
            {

            }
        }

    }

    debug_arr($arr_new); exit;

}

/*Array
(
    [name_param] => Диаметр, мм
[value_filter] => Array
(
    [0] => 100
            [1] => 200
            [2] => 300
        )

    [edit_pages_success] => Подтвердить
)*/

function new_filter_res($arr_post){
    //обрезаем последний элемент с кнопкой
    $arr_post = array_slice($arr_post, 0, -1);

    //Обрезаем элемент с именем фильтра
    $arr_post = array_slice($arr_post, 0);
    

    //проходимся по массиву данных
    //формируем обработанный массив данных $arr_post_clear
    //debug_arr($arr_post);//exit;
    $arr_post_clear=[];
    $arr_post_child = [];
    foreach($arr_post as $key=>$value){
        if(!is_array($arr_post[$key]))
        {
            $arr_post_clear[$key] = clear_string($value);
            continue;
        }

        if(is_array($arr_post[$key])){
            $arr_clear_value = [];
            for($i=0, $count=count($arr_post[$key]); $i < $count; $i++ ){
                $arr_clear_value[] = clear_string($arr_post[$key][$i]);
            }

            //Удаляем пустые значения
            $arr_clear_value = array_diff($arr_clear_value, ['']);

            //если необходимо записать в строку
            //$arr_post_clear[$key] = implode('|', $arr_clear_value);
            $arr_post_clear[$key] =  $arr_clear_value;

        }

    }

    //debug_arr($arr_post_clear);
    //exit;

    $obj_db = Model_Driver::get_instance();

    mysqli_autocommit($obj_db->ins_db,FALSE);
    //Значение id категории
    $id ='';
    foreach($arr_post_clear as $k => $itm) {

        if($k == 'name_param'){

            $result1 = $obj_db ->insert('filter', ['name'],[$itm]);
            $id = mysqli_insert_id($obj_db->ins_db);

            if(!$result1) {
                mysqli_rollback($obj_db->ins_db);
                $_SESSION['message']['error'] = 'Ошибка при формировании запроса в таблицу фильтров';
                return;
            }
        }

        $res_max = $obj_db ->select(['MAX(`id`)'], 'filter');
        $id_last = $res_max[0]['MAX(`id`)'];
        //echo  $id; exit;
        //SELECT MAX(`id`) FROM `tab`


        if($k == 'value_filter'){
            foreach($arr_post_clear[$k] as $val_1){
                $result2 = $obj_db ->insert('filter_value', ['value_filter', 'filter_id'],[$val_1, $id_last]);
                if(!$result2) {
                    mysqli_rollback($obj_db->ins_db);
                    $_SESSION['message']['error'] = 'Ошибка при формировании запроса в таблицу значений для фильтров';
                    return;
                }
            }


        }
    }
    $commit = mysqli_commit($obj_db->ins_db);
    //var_dump(mysqli_commit($obj_db->ins_db));exit();
    if(!$commit) return false;
    $_SESSION['message']['success'] = 'Данные обновлены!';
    return true;
}

//
function relations_filval_cat($arr_post){
    $obj_db = Model_Driver::get_instance();
    //debug_arr($arr_post); exit;
}



