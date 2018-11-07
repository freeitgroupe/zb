<?php
defined("CATALOG") or die("Access denied");

//Получаем данные по выбранной новости
function news_info_for_edit($pages_id){
    $obj_db = Model_Driver::get_instance();
    //$result = $obj_db->select(['*'], 'news', ['id'=>$pages_id]);
    global $link;
    $result = mysqli_query($link, "SELECT news.*, category_news.title AS title_cat FROM news, category_news WHERE news.id='$pages_id' AND news.category_news_id=category_news.id");
    if(!$result) return false;
    $arr=[];
    while($row=mysqli_fetch_assoc($result)) {
        $arr[] = $row;
    }
    return $arr[0];
}

//Редактирование или обновление новости
function edit_news_res($pages_id, $arr_post){
    $obj_db = Model_Driver::get_instance();
    $id = $pages_id;
    $title = addslashes(clear_string($arr_post['title']));
    $date = addslashes(clear_string($arr_post['date']));
    $description = addslashes(clear_string($arr_post['description']));
    $m_keywords = addslashes(clear_string($arr_post['m_keywords']));
    $m_description = addslashes(clear_string($arr_post['m_description']));
    $alias = addslashes(clear_string($arr_post['alias']));
    $view = (int)$arr_post['view'];
    $cat_news = (int)$arr_post['cat_news'];

    //Формируем сессионные данные
    $_SESSION['data']['title'] = $title;
    $_SESSION['data']['description'] = $description;
    $_SESSION['data']['date'] = $date;
    $_SESSION['data']['m_keywords'] = $m_keywords;
    $_SESSION['data']['m_description'] = $m_description;
    $_SESSION['data']['alias'] = $alias;
    $_SESSION['data']['view'] = $view;
    $_SESSION['data']['cat_news'] = $cat_news;


    //смотрим обязательные поля
    //Если Пустые тогда
    if(empty($title) || empty($description)) {
        $_SESSION['message']['error'] = 'Вы должны заполнить обязательные поля<br/>';
        if (empty($title)) {
            $_SESSION['message']['error'] .= "Заполните заголовок<br />";
        }
        if (empty($description)) {
            $_SESSION['message']['error'] .= "Заполните описание новости<br />";
        }
        return false;
    }

    //Если заполнены
    //Делаем запрос в бд
    $result = $obj_db->update('news', ['title','description', 'date', 'm_keywords', 'm_description','alias','view','category_news_id'],[$title, $description, $date, $m_keywords,$m_description, $alias,$view, $cat_news],['id'=>$id]);
    if(!$result)
    {
        $_SESSION['message']['error'] = 'Ошибка при обновлении данных в бд';
        return false;
    }

    //Работаем с изображением
    if (empty($_FILES['file']['tmp_name']))
    {
        $img = NOIMAGE;
        $_SESSION['message']['success'] = 'Данные успешно обновлены';
        return true;
    }
    else
    {
        if(!empty($_FILES['file']['error'])) {
            $_SESSION['message']['error'] = "Слишком большое изображение<br/>";
            return false;
        }
        
        $baseimgExt = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $_FILES['file']['name'])); // расширение картинки
        $baseimgName = date("mdy") . "_" . gen_code(9) .'.' .  $baseimgExt;
        $baseimgTmpName = $_FILES['file']['tmp_name']; // временное имя файла       

        $img_types = array('jpeg' => 'image/jpeg', 'png'=>'image/png');
        $type_img = array_search($_FILES['file']['type'], $img_types);
        if (!$type_img) {
            $_SESSION['message']['error'] .= "Неправильный формат изображения<br/>";
            return false;
        }

        if ($_FILES['file']['size'] > (2 * 1024 * 1024)) {
            $_SESSION['message'] .= "Слишком большое изображение<br/>";
            return false;
        }

        // если нет ошибок
        if(empty($_SESSION['message']['error'])){
            if(move_uploaded_file($baseimgTmpName, $_SERVER['DOCUMENT_ROOT'] . NEWS_IMG_TMP . $baseimgName))
            {
                resizing($_SERVER['DOCUMENT_ROOT'] . NEWS_IMG_TMP . $baseimgName,  $_SERVER['DOCUMENT_ROOT'] . NEWS_IMG . $baseimgName, 600, 600, $baseimgExt);

                if(!unlink($_SERVER['DOCUMENT_ROOT'] . NEWS_IMG_TMP. $baseimgName)){
                    $_SESSION['message']['error'] .= "Не удалось удалить временное изображение";
                    return false;
                }

                if(!$result_upd = $obj_db->update('news', ['img'], [$baseimgName], ['id' => $id])){
                    $_SESSION['message']['error'] .= "Данные о картинке в базе даннных необновлены";
                    return false;
                };
                $_SESSION['message']['success'] = 'Данные успешно обновлены';
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

//Создание новости
function new_news_res($arr_post){
    $obj_db = Model_Driver::get_instance();
    
    $title = addslashes(trim($arr_post['title']));
    $date = addslashes(trim($arr_post['date']));
    $description = addslashes(trim($arr_post['description']));
    $m_keywords = addslashes(trim($arr_post['m_keywords']));
    $m_description = addslashes(trim($arr_post['m_description']));
    $alias = addslashes(trim($arr_post['alias']));
    $view = (int)$arr_post['view'];
    $cat_news = (int)$arr_post['cat_news'];

    //Формируем сессионные данные
    $_SESSION['data']['title'] = $title;
    $_SESSION['data']['description'] = $description;
    $_SESSION['data']['date'] = $date;
    $_SESSION['data']['m_keywords'] = $m_keywords;
    $_SESSION['data']['m_description'] = $m_description;
    $_SESSION['data']['alias'] = $alias;
    $_SESSION['data']['view'] = $view;
    $_SESSION['data']['cat_news'] = $cat_news;


    //смотрим обязательные поля
    //Если Пустые тогда
    if(empty($title) || empty($description)) {
        $_SESSION['message']['error'] = 'Вы должны заполнить обязательные поля<br/>';
        if (empty($title)) {
            $_SESSION['message']['error'] .= "Заполните заголовок<br />";
        }
        if (empty($description)) {
            $_SESSION['message']['error'] .= "Заполните описание новости<br />";
        }
        return false;
    }

    //Если заполнены
    //Делаем запрос в бд
    $result = $obj_db->insert('news', ['title','description', 'date', 'm_keywords', 'm_description','alias','view','category_news_id'],[$title, $description, $date, $m_keywords,$m_description, $alias,$view, $cat_news]);
    if(!$result)
    {
        $_SESSION['message']['error'] = 'Ошибка при добавлении данных в бд';
        return false;
    }

    //получаем id последней записи
    $id = mysqli_insert_id($obj_db->ins_db);
    //var_dump($id);exit;

    //Работаем с изображением
    if (empty($_FILES['file']['tmp_name']))
    {
        $img = NOIMAGE;
        $_SESSION['message']['success'] = 'Данные успешно добавлены';
        return true;
    }
    else
    {
        if(!empty($_FILES['file']['error'])) {
            $_SESSION['message']['error'] = "Слишком большое изображение<br/>";
            return false;
        }

        $baseimgExt = strtolower(preg_replace("#.+\.([a-z]+)$#i", "$1", $_FILES['file']['name'])); // расширение картинки
        $baseimgName = date("mdy") . "_" . gen_code(9) .'.' .  $baseimgExt;
        $baseimgTmpName = $_FILES['file']['tmp_name']; // временное имя файла

        $img_types = array('jpeg' => 'image/jpeg', 'png'=>'image/png');
        $type_img = array_search($_FILES['file']['type'], $img_types);
        if (!$type_img) {
            $_SESSION['message']['error'] .= "Неправильный формат изображения<br/>";
            return false;
        }

        if ($_FILES['file']['size'] > (2 * 1024 * 1024)) {
            $_SESSION['message'] .= "Слишком большое изображение<br/>";
            return false;
        }

        // если нет ошибок
        if(empty($_SESSION['message']['error']))
        {
            if(move_uploaded_file($baseimgTmpName, $_SERVER['DOCUMENT_ROOT'] . NEWS_IMG_TMP . $baseimgName))
            {
                resizing($_SERVER['DOCUMENT_ROOT'] . NEWS_IMG_TMP . $baseimgName,  $_SERVER['DOCUMENT_ROOT'] . NEWS_IMG . $baseimgName, 600, 600, $baseimgExt);

                if(!unlink($_SERVER['DOCUMENT_ROOT'] . NEWS_IMG_TMP. $baseimgName)){
                    $_SESSION['message']['error'] .= "Не удалось удалить временное изображение";
                    return false;
                }

                if(!$result_upd = $obj_db->update('news', ['img'], [$baseimgName], ['id' => $id])){
                    $_SESSION['message']['error'] .= "Данные о фото в базе  не обновлены";
                    return false;
                };
                $_SESSION['message']['success'] = 'Данные успешно обновлены';
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
