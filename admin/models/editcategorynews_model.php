<?php defined("CATALOG") or die("Access denied");

function category_news_info_for_edit($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'category_news',['id'=>$pages_id]);
    if(!$result) return false;
    return $result[0];
}

function edit_category_news_res($id, $arr){
    //$id - аргумент для определения выборки в бд
    //$arr - Массив обрабатываемых данных
    //debug_arr($arr);exit;
    $err=[];
    $id = (int)$id;
    $title = clear_string($arr['title']);
    $alias = clear_string($arr['alias']);
    $view = (int)clear_string($arr['view']);

    if(strlen($title) < 6 || strlen($title) > 100){
        $err[$title] = "Для названия страницы количество символов от 6-ти до 100";
    }

    if(strlen($alias) < 4 || strlen($alias) > 20){
        $err[$alias] = "Для алиаса страницы количество символов от 6-ти до 20";
    }
    if(count($err)) {
        $_SESSION['message']['error'] = implode('</br>', $err);
        return false;
        //header("Location:" . $_SESSION['REQUEST_URI']);
        //exit;
    }

    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('category_news', ['title','alias','view'], [$title, $alias, $view], ['id'=>$id]);
    if(!$result){
        $_SESSION['message']['error'] = 'Ошибка обновления данных';
        return false;
    }
    $_SESSION['message']['success'] = "Данные успешно обновлены";
    return $result;
}

function new_category_news_res($arr){
    //$arr - Массив обрабатываемых данных
    $err=[];

    $title = clear_string($arr['title']);
    $alias = clear_string($arr['alias']);
    $view = (int)clear_string($arr['view']);

    if(strlen($title) < 6 || strlen($title) > 100){
        $err[$title] = "Для названия страницы количество символов от 6-ти до 100";
    }

    if(count($err)) {
        $_SESSION['message']['error'] = implode('</br>', $err);
        $_SESSION['new_pages']['title'] = $title;
        $_SESSION['new_pages']['alias'] = $alias;       
        $_SESSION['new_pages']['view'] = $view;
        return false;
    }

    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->insert('category_news', ['title','alias', 'view'], [$title, $alias, $view]);
    if(!$result){
        $_SESSION['message']['error'] = 'Ошибка обновления данных';
        return false;
    }
    $_SESSION['message']['success'] = "Данные успешно обновлены";
    return $result;
}