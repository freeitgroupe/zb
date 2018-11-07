<?php
defined("CATALOG") or die("Access denied");

//выбранная категория
function category_product_for_edit($pages_id){
    $obj_db=Model_Driver::get_instance();
    $result=$obj_db->select(['*'], 'category', ['id'=>$pages_id]);
    if(!$result) return false;
    return $result[0];
}

//Редактирование или обновление данных о категории
function edit_category_product_res($pages_id, $arr_post){
    $obj_db = Model_Driver::get_instance();
    $id = $pages_id;
    $title = clear_content($arr_post['title']);
    $description = clear_content($arr_post['description']);
    $m_keywords = clear_content($arr_post['m_keywords']);
    $m_description = clear_content($arr_post['m_description']);
    $view = (int)$arr_post['view'];
    $parent = (int)$arr_post['cat_parent'];

    //Формируем сессионные данные
    $_SESSION['data']['title'] = $title;
    $_SESSION['data']['description'] = $description;
    $_SESSION['data']['m_keywords'] = $m_keywords;
    $_SESSION['data']['m_description'] = $m_description;
    $_SESSION['data']['view'] = $view;
    $_SESSION['data']['parent'] = $parent;

    //проверяем оязательные поля
    //Если Пустые тогда
    if(empty($title) || empty($description)) {
        $_SESSION['message']['error'] = 'You must fill in the required fields<br/>';
        if (empty($title)) {
            $_SESSION['message']['error'] .= "Fill in the title<br />";
        }
        if (empty($description)) {
            $_SESSION['message']['error'] .= "Complete the description<br />";
        }
        return false;
    }

    //Делаем запрос в базу данных
    $result = $obj_db->update('category', ['title', 'description', 'm_keywords', 'm_description', 'view', 'parent'], [$title, $description, $m_keywords, $m_description, $view, $parent], ['id'=>$pages_id]);

    if(!$result)
    {
        $_SESSION['message']['error'] = 'Ошибка при добавлении данных в бд';
        return false;
    }

    //Обработка изображения
    if(empty($_FILES['file']['tmp_name']))
    {
        $img = NOIMAGE;
        $_SESSION['message']['success'] = 'Data successfully updated';
        return true;
    }

    if(!empty($_FILES['file']['tmp_name']))
    {
        if(!empty($_FILES['file']['error']))
        {
            $_SESSION['message']['error'] = "Error loading image!";
            return false;
        }

        //расширение картинки
        $baseimgExt = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $_FILES['file']['name']));

        //имя картинки
        $baseimgName = date("mdy") . "_" . gen_code(9) .'.' .  $baseimgExt;

        //временное имя файла
        $baseimgTmpName = $_FILES['file']['tmp_name'];

        //проверка рсширения файла
        $img_types = array('jpeg' => 'image/jpeg', 'png'=>'image/png');
        $type_img = array_search($_FILES['file']['type'], $img_types);
        if (!$type_img) {
            $_SESSION['message']['error'] .= "Wrong image format<br/>";
            return false;
        }

        //проверка размера файла
        if ($_FILES['file']['size'] > (2 * 1024 * 1024)) {
            $_SESSION['message'] .= "Image is too large<br/>";
            return false;
        }

        // если нет ошибок загружаем на сервер картинку
        if(empty($_SESSION['message']['error']))
        {
            if(move_uploaded_file($baseimgTmpName, $_SERVER['DOCUMENT_ROOT'] . CAT_IMG_TMP . $baseimgName))
            {
                resizing($_SERVER['DOCUMENT_ROOT'] . CAT_IMG_TMP . $baseimgName,  $_SERVER['DOCUMENT_ROOT'] . CAT_IMG . $baseimgName, 1200, 280, $baseimgExt);

                if(!unlink($_SERVER['DOCUMENT_ROOT'] . CAT_IMG_TMP. $baseimgName))
                {
                    $_SESSION['message']['error'] .= "Не удалось удалить временное изображение";
                    return false;
                }

                if(!$result_upd = $obj_db->update('category', ['image'], [$baseimgName], ['id' => $id])){
                    $_SESSION['message']['error'] .= "Данные о картинке в базе даннных необновлены";
                    return false;
                };
                $_SESSION['message']['success'] = 'Data successfully updated';
                return true;

            }
            else
            {
                $_SESSION['message']['error'] .= "Не удалось переместить загруженную картинку на сервер.";
                return false;
            }
        }
    }
}

//Добавление новой категории
function new_category_product_res($arr_post){
    $obj_db = Model_Driver::get_instance();

    $title = clear_content($arr_post['title']);
    $description = clear_content($arr_post['description']);
    $m_keywords = clear_content($arr_post['m_keywords']);
    $m_description = clear_content($arr_post['m_description']);
    $view = (int)$arr_post['view'];
    $parent = (int)$arr_post['cat_parent'];

    //Формируем сессионные данные
    $_SESSION['data']['title'] = $title;
    $_SESSION['data']['description'] = $description;
    $_SESSION['data']['m_keywords'] = $m_keywords;
    $_SESSION['data']['m_description'] = $m_description;
    $_SESSION['data']['view'] = $view;
    $_SESSION['data']['parent'] = $parent;

    //проверяем оязательные поля
    //Если Пустые тогда
    if(empty($title) || empty($description)) {
        $_SESSION['message']['error'] = 'You must fill in the required fields<br/>';
        if (empty($title)) {
            $_SESSION['message']['error'] .= "Fill in the title<br />";
        }
        if (empty($description)) {
            $_SESSION['message']['error'] .= "Complete the description<br />";
        }
        return false;
    }

    //Делаем запрос в базу данных
    //debug_arr($_SESSION['data']);
    $result = $obj_db->insert('category', ['title', 'description', 'm_keywords', 'm_description', '`view`', 'parent'], [$title, $description, $m_keywords, $m_description, $view, $parent]);
    //debug_arr($_SESSION['data']);exit;
    if(!$result) 
    {
        $_SESSION['message']['error'] = 'Ошибка при добавлении данных в бд';
        return false;
    }

    //получаем id последней записи
    $id = mysqli_insert_id($obj_db->ins_db);
    //var_dump($id);exit;
    //получаем id последней записи

    $alias = get_alias('category', 'alias', $_SESSION['data']['title'], $id);

    //Записываем алиас
    $res_alias = $obj_db->update('category', ['alias'],[$alias],['id'=>$id]);
    //debug_arr($res_alias);
    //exit;
    if(!$res_alias){
        $_SESSION['message']['error'] .=  'Ошибка создания алиаса';
        return false;
    }

    
    
    //Обработка изображения
    if(empty($_FILES['file']['tmp_name']))
    {
        $img = NOIMAGE;
        $result = $obj_db ->update('category',
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

        $_SESSION['message']['success'] = 'Data successfully updated';
        return true;
    }

    if(!empty($_FILES['file']['tmp_name']))
    {
        if(!empty($_FILES['file']['error']))
        {
            $_SESSION['message']['error'] = "Ошибка при загрузке изображения!";
            return false;
        }

        // расширение картинки
        $baseimgExt = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $_FILES['file']['name']));
        // имя картинки
        $baseimgName = date("mdy") . "_" . gen_code(9) .'.' .  $baseimgExt;

        // временное имя файла
        $baseimgTmpName = $_FILES['file']['tmp_name'];

        // проверка рсширения файла
        $img_types = array('jpeg' => 'image/jpeg', 'png'=>'image/png');
        $type_img = array_search($_FILES['file']['type'], $img_types);
        if (!$type_img) {
            $_SESSION['message']['error'] .= "Неправильный формат изображения<br/>";
            return false;
        }

        // проверка размера файла
        if ($_FILES['file']['size'] > (2 * 1024 * 1024)) {
            $_SESSION['message'] .= "Слишком большое изображение<br/>";
            return false;
        }

        // если нет ошибок загружаем на сервер картинку
        if(empty($_SESSION['message']['error']))
        {
            if(move_uploaded_file($baseimgTmpName, $_SERVER['DOCUMENT_ROOT'] . CAT_IMG_TMP . $baseimgName))
            {
                resizing($_SERVER['DOCUMENT_ROOT'] . CAT_IMG_TMP . $baseimgName,  $_SERVER['DOCUMENT_ROOT'] . CAT_IMG . $baseimgName, 300, 300, $baseimgExt);

                if(!unlink($_SERVER['DOCUMENT_ROOT'] . CAT_IMG_TMP. $baseimgName))
                {
                    $_SESSION['message']['error'] .= "Не удалось удалить временное изображение";
                    return false;
                }

                if(!$result_upd = $obj_db->update('category', ['image'], [$baseimgName], ['id' => $id])){
                    $_SESSION['message']['error'] .= "Данные о картинке в базе даннных необновлены";
                    return false;
                };
                $_SESSION['message']['success'] = 'Data successfully updated';
                return true;

            }
            else
            {
                $_SESSION['message']['error'] .= "Не удалось переместить загруженную картинку на сервер.";
                return false;
            }
        }
    }

}

//
//Работа с фильтрами//
//

//Добавляем фильтры, при редактировании категории
//
function edit_filter_category_res($pages_id, $arr_post){

    //debug_arr($arr_post);exit;
    //убираем пустые значения в массиве с фильтрами
    if(isset($arr_post['filter_value_id']))
    {
        $arr_clear_value = [];
        for($i=0, $count=count($arr_post['filter_value_id']); $i < $count; $i++ )
        {
            $arr_clear_value[] = clear_string($arr_post['filter_value_id'][$i]);
        }
        $arr_clear_value = array_diff($arr_clear_value, ['']);
        $res_ser = serialize($arr_clear_value);
    }

    if(!isset($arr_post['filter_value_id']))
    {
       $res_ser = 0;
    }

    //debug_arr($res_ser);
    //debug_arr(unserialize($res_ser));

    //проверить наличие айди категории, которую обрабатываем
    $res_exist = exist_id($pages_id, 'relations_filval_cat', 'filter_category_id');

    //debug_arr($res_exist);
    $obj_db = Model_Driver::get_instance();

    //Обновляем данные если категория есть
    if($res_exist > 0)
    {
        $res = $obj_db->update('relations_filval_cat', ['filter_value_id'],[$res_ser],['filter_category_id'=>$pages_id]);
        if(!$res) return false;
    }
    else
    {
        //добавляем данные если категории нет
        $res = $obj_db->insert('relations_filval_cat', ['filter_category_id','filter_value_id'],[$pages_id, $res_ser]);
        if(!$res) return false;
    }
    //debug_arr( $obj_db->select(['*'], 'relations_filval_cat', ['filter_category_id'=>$pages_id]) );

    $_SESSION['message']['success'] = 'Данные для фильтров успешно обновлены!';
    return true;
   

}

//Достаем активные фильтры для категории возращаем массив
function get_choose_filter($pages_id){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db->select(['filter_value_id'], 'relations_filval_cat', ['filter_category_id'=>$pages_id]);
    //var_dump($res[0]['filter_value_id']);
    if(!$res) return false;
    if(strlen($res[0]['filter_value_id']) < 2) return 'empty';
    $res_1 = unserialize($res[0]['filter_value_id'] );
    return $res_1;
}

function relation_cat_fil($get_all_filters, $get_choose_filter){
    if($get_choose_filter > false) {
        for ($i = 0, $count = count($get_all_filters); $i < $count; $i++) {
            foreach ($get_choose_filter as $item) {
                if ($get_all_filters[$i]['id'] == $item) {
                    $get_all_filters[$i]['active'] = 'true';
                }
            }
        }
        return $get_all_filters;
    }else{
        return $get_all_filters;
    }

   
}