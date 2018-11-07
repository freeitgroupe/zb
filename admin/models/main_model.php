<?php
defined("CATALOG") or die("Access denied");

/**
 * Меню для админ панели
 **/
function menu_admin(){
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $result = $obj_db->select(
        ['*'],'menu_admin',['view'=>1]);
    if(!$result) return false;
    $arr_new=[];
    for($i=0;$i<count($result); $i++){
        $arr_new[$result[$i]['id']]=$result[$i];
    }
    return  $arr_new;
}

/**
 * Загрузка основного фото для товара
 **/
function downloadImage(
    $tmp_name,
    $name_file,
    $type_file,
    $size_file,
    $upload_tmp_file,
    $upload_base_file,
    $update_table,
    $update_td_name,
    $update_td_id,
    $update_td_id_last_id_added,
    $widthMax = false,
    $heightMax = false
)
{

    // расширение картинки
    $baseimgExt = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $name_file));

    // имя картинки
    $baseimgName = date("mdy") . "_" . $update_td_id_last_id_added . "_" . gen_code(9) .'.' .  $baseimgExt;

    // временное имя файла
    $baseimgTmpName = $tmp_name;

    // проверка рсширения файла
    $img_types = array('jpeg' => 'image/jpeg', 'png'=>'image/png');
    $type_img = array_search($type_file, $img_types);
    if (!$type_img) {
        $_SESSION['message']['error'] .= "Error type images!<br/>";
        return false;
    }

    // проверка размера файла
    if ($size_file > (2 * 1024 * 1024)) {
        $_SESSION['message'] .= "Image have big size!<br/>";
        return false;
    }

    // если нет ошибок загружаем на сервер картинку
    if(empty($_SESSION['message']['error']))
    {
        if(move_uploaded_file($baseimgTmpName, $_SERVER['DOCUMENT_ROOT'] . $upload_tmp_file . $baseimgName))
        {
            if($widthMax == false || $heightMax == false ){
                $wMax = 500;
                $hMax = 500;
            }else{
                $wMax = $widthMax;
                $hMax = $heightMax;
            }
            resizing($_SERVER['DOCUMENT_ROOT'] . $upload_tmp_file . $baseimgName,  $_SERVER['DOCUMENT_ROOT'] . $upload_base_file . $baseimgName, $wMax, $hMax, $baseimgExt);

            if(!unlink($_SERVER['DOCUMENT_ROOT'] . $upload_tmp_file . $baseimgName))
            {
                $_SESSION['message']['error'] .= "Не удалось удалить временное изображение!";
                return false;
            }
            $obj_db = Model_Driver::get_instance(); 
            if(!$result_upd = $obj_db->update($update_table, [$update_td_name], [$baseimgName], [$update_td_id => $update_td_id_last_id_added])){
                $_SESSION['message']['error'] .= "Данные о картинке в базе даннных не обновлены!";
                return false;
            };
            $_SESSION['message']['success'] = 'Update successful!<br>';
            return true;
        }
        else
        {
            $_SESSION['message']['error'] .= "Не удалось переместить загруженную картинку на сервер.";
            return false;
        }
    }
}

/*
**
* Загрузка фото для галереи
**/
function downloadImageGallery(
    $arr_gallery_files,
    $upload_tmp_file,
    $upload_base_file,
    $update_table,
    $update_td_name,
    $update_td_id,
    $update_td_id_last_id_added

)
{
    for($i=0, $count=count($arr_gallery_files['name']);$i<$count; $i++)
    {
        $tmp_name  = $arr_gallery_files['tmp_name'][$i];
        $name_file = $arr_gallery_files['name'][$i];
        $type_file = $arr_gallery_files['type'][$i];
        $size_file = $arr_gallery_files['size'][$i];

        // расширение картинки
        $baseimgExt = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $name_file));

        // имя картинки
        $baseimgName = date("mdy") . "_" . $update_td_id_last_id_added . "_" . gen_code(9) .'.' .  $baseimgExt;

        // временное имя файла
        $baseimgTmpName = $tmp_name;

        // проверка рсширения файла
        $img_types = array('jpeg' => 'image/jpeg', 'png'=>'image/png');
        $type_img = array_search($type_file, $img_types);
        //return debug_arr($type_file);
        if (!$type_img) {
            $_SESSION['message']['error'] = "Неправильный формат изображения для галереи!<br/>";
            return false;
        }

        // проверка размера файла
        if ($size_file > (2 * 1024 * 1024)) {
            $_SESSION['message'] .= "Слишком большое изображение<br/>";
            return false;
        }

        // если нет ошибок загружаем на сервер картинку
        if(empty($_SESSION['message']['error']))
        {
            if(move_uploaded_file($baseimgTmpName, $_SERVER['DOCUMENT_ROOT'] . $upload_tmp_file . $baseimgName))
            {
                resizing($_SERVER['DOCUMENT_ROOT'] . $upload_tmp_file . $baseimgName,  $_SERVER['DOCUMENT_ROOT'] . $upload_base_file . $baseimgName, 500, 500, $baseimgExt);

                if(!unlink($_SERVER['DOCUMENT_ROOT'] . $upload_tmp_file . $baseimgName))
                {
                    $_SESSION['message']['error'] .= "Не удалось удалить временное изображение!";
                    return false;
                }

                //Формируем имя для записи
                if(!isset($name_gallery_items))
                {
                    $name_gallery_items = $baseimgName;
                }
                else
                {
                    $name_gallery_items .= '|'. $baseimgName;
                }
                
            }
            else
            {
                $_SESSION['message']['error'] .= "Не удалось переместить загруженную картинку на сервер.";
                return false;
            }
        }
    }

    //проверяем запись имени файла для галереи
    //используем элемент предыдущего счетчика
    if($i < 2){
        $name_gallery_items = $name_gallery_items . '|';
    }

    //Работа с таблицей данных
    $obj_db = Model_Driver::get_instance();

    //проверяем наличие записи в таблице
    $result = $obj_db->select([$update_td_name], $update_table, [$update_td_id =>$update_td_id_last_id_added]);
    if(!$result) {$_SESSION['message']['error'] = "Ошибка при выборке имен для галереи!"; exit;}

    if(!empty($result[0][$update_td_name])){
        //При необходимости формируем массив
        //$arr_name_gallery = explode('|', $result[0][$update_td_name]);
        //Если есть убираем пустые значения массива
        //$arr_name_gallery = array_diff( $arr_name_gallery, ['']);

        //Добавляем имена файлов из бд
        $name_gallery_items .= '|' . $result[0][$update_td_name];
        $name_gallery_items = str_replace('||', '|', $name_gallery_items);
        // обрезаем последний символ '|'
        //$name_gallery_items = substr($name_gallery_items, 0, -1);
    }
    //Формирование запроса в бд
    //debug_arr($name_gallery_items); exit;
    if(!$result_upd = $obj_db->update($update_table, [$update_td_name], [$name_gallery_items], [$update_td_id => $update_td_id_last_id_added])){
        $_SESSION['message']['error'] .= "Данные о картинке в базе даннных не обновлены!";
        return false;
    };
    $_SESSION['message']['success'] = 'Данные успешно обновлены!';
    return true;

}


/**
 * Выделение активного меню
 **/
function active_url($str = ''){
    $uri = $_SERVER['REQUEST_URI'];
    $uri = preg_replace("#/admin/#", "",$uri );
    //поиск в строке
    if(strpos($uri, '?'))
    $uri = stristr($uri, '?', true);
    // разбиваем строку по разделителю
    $uri = explode("/", $uri);
    //var_dump($uri);
    if(in_array($str, $uri)){
        // если в массиве параметров есть строка - это активный пункт меню
        return 'active';
    }
}

/**
 * Прверка регистрации пользователя по имейл
 **/
function check_user_reg($email, $table, $id_table,$email_table){
    //обращение в бд.
    global $link;
    $query=("SELECT `$id_table` FROM `$table` WHERE `$email_table` = '$email'");
    $result = mysqli_query($link, $query);
    // var_dump($result);
    if(!$result) return false;
    $arr = [];
    while($row = mysqli_fetch_assoc($result)){
        $arr[] = $row;
    }

    return $arr[0][$id_table];
}

//список доступных фильтров
function  get_all_filters(){
    //$obj_db = Model_Driver::get_instance();
    //$result = $obj_db->select(['*'], 'filters',[],'id','ASC', $start_pos.','.$perpage);

    //Формируем запрос в таблицу фильтров и в таблицу значений фильтров
    global $link;
    $query = "SELECT filter_value.*, filter.name, filter.visible FROM filter_value INNER JOIN filter ON filter_value.filter_id = filter.id";
    $result = mysqli_query($link,$query);
    if(!$result) return false;
    $arr =[];
    while($row = mysqli_fetch_assoc($result)){
        $arr[]=$row;
    }
    return $arr;
}

//проверить наличие айди в бд, которое будем обрабатывать
function exist_id($id, $table, $table_id){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db ->select(['count(*)'],$table, [$table_id =>$id]);
    if(!$res) return 'Ошибка при проверка!';
    return $res[0]['count(*)'];
}

//Информация о статусах заказа
function order_status(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'order_status');
    if(!$result) return false;
    return $result;
}

//Информация о статусе оплаты
function pay_status(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db ->select(['*'], 'pay_status');
    if(!$result) return false;
    return $result;
}

//специальные метки наличия товара
function special_meta_available(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'availability_products');
    if(!$result) return false;
    return $result;
}

//специальные метки для товара
function special_meta(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'special_mark');
    if(!$result) return false;
    return $result;
}

//Доступные штаты
function states_of_usa(){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'states');
    if(!$result) return false;
    return $result;
}

function AddSuppliersForProduct($arr_post, $lastAddId, $tableName){
    if(count($arr_post) == 0) return false;
    //очищаем аргументы массива
    foreach ($arr_post as $item){
        if((int)clear_string($item) == 0) continue;
        $arr_post_clear[] = (int)clear_string($item);
    }
    //проверяем кол-во элементов в массиве после очистки
    if(count($arr_post_clear) == 0) return false;

    //Отключаем автоматическую фиксацию баз данных
    mysqli_autocommit(Model_Driver::get_instance()->ins_db, FALSE);
    foreach ($arr_post_clear as $item){
        //проверяем есть ли добавляемые параметры в базе
        $res = Model_Driver::get_instance()->select(['*'], $tableName, ['supplier_id'=>$item, 'product_id'=>$lastAddId]);
        if($res != NULL) continue;

        try{
            $res = Model_Driver::get_instance()->insert($tableName, ['supplier_id', 'product_id'], [$item, $lastAddId]);
            if(!$res){
                throw new Exception(e);
            }
        }catch (Exception $e){
            mysqli_rollback(Model_Driver::get_instance()->ins_db);
            mysqli_autocommit(Model_Driver::get_instance()->ins_db, TRUE);
            mysqli_close(Model_Driver::get_instance()->ins_db);
            $_SESSION['message']['error']='Error add suppliers';
            return FALSE;
        }
    }
    mysqli_commit(Model_Driver::get_instance()->ins_db);
    mysqli_autocommit(Model_Driver::get_instance()->ins_db, TRUE);
    mysqli_close(Model_Driver::get_instance()->ins_db);
    return $res;
}



