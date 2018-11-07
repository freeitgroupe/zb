<?php defined("CATALOG") or die("Access denied");

function pages_info_for_edit($pages_id){
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->select(['*'], 'pages',['page_id'=>$pages_id]);
    if(!$result) return false;
    return $result[0];
}

function edit_pages_res($id, $arr){
     //$id - аргумент для определения выборки в бд
    //$arr - Массив обрабатываемых данных
    $err=[];
    $id = (int)$id;
    $title = clear_string($arr['title']);
    $description = clear_string($arr['meta_d']);
    $keywords = clear_string($arr['meta_k']);
    $text = clear_content($arr['text']);
    $status = (int)clear_string($arr['status']);
    $updated = date("Y-m-d H-i-s", time());
    $position = (int)clear_string($arr['position']);
    $parent_section = (int)clear_string($arr['parent_section']);

    if(strlen($title) < 3 || strlen($title) > 100){
        $err[$title] = "For the page title, the number of characters from 3 to 100!";
    }

    if(count($err)) {
        $_SESSION['message']['error'] = implode('</br>', $err);
        return false;
    }

    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->update('pages', ['title','meta_d','meta_k','text','position','status','updated_at', 'parent_section'], [$title, $description, $keywords, $text, $position, $status, $updated, $parent_section], ['page_id'=>$id]);
    if(!$result){
        $_SESSION['message']['error'] = 'Error!';
        return false;
    }
    //Записываем alias,
    $alias = get_alias('pages', 'alias', $title, $id, 'edit', 'page_id');
    //Записываем алиас
    $res_alias = $obj_db->update('pages', ['alias'],[$alias],['page_id'=>$id]);
    //debug_arr($res_alias);
    //exit;
    if(!$res_alias){
        $_SESSION['message']['error'] = 'Error updating alias!';
        return false;
    }

    $_SESSION['message']['success'] = "Success!";
    return $result;
}

function new_pages_res($arr){
    //$arr - Массив обрабатываемых данных
    $err=[];
    $title = clear_string($arr['title']);
    $description = clear_string($arr['meta_d']);
    $keywords = clear_string($arr['meta_k']);
    $text = clear_content($arr['text']);
    $status = (int)clear_string($arr['status']);
    $created = date("Y-m-d H-i-s", time());
    $position = (int)clear_string($arr['position']);
    $parent_section = (int)clear_string($arr['parent_section']);
    if(strlen($title) < 3 || strlen($title) > 100){
        $err[$title] = "For the page title, the number of characters from 3 to 100!";
    }

    if(count($err)) {
        $_SESSION['message']['error'] = implode('</br>', $err);
        $createSessionParam = createSessionData('data',['title'=>$title, 'meta_d'=>$description,'meta_k'=>$keywords,'text'=>$text, 'status'=>$status, 'position'=>$position, 'parent_section'=>$parent_section]);
        return false;        
    }
    $obj_db = Model_Driver::get_instance();
    $result = $obj_db->insert('pages', ['title','meta_d','meta_k','text','status','created_at','updated_at', 'position','parent_section'], [$title, $description, $keywords, $text, $status, $created, $created, $position, $parent_section]);
    if(!$result){
        $_SESSION['message']['error'] = 'Error updating alias';
        return false;
    }
    //получаем id последней записи
    $id = mysqli_insert_id(Model_Driver::get_instance()->ins_db);
    //var_dump($id);exit;
    $alias = get_alias('pages', 'alias', $title, $id);
    //Записываем алиас
    $res_alias = $obj_db->update('pages', ['alias'],[$alias],['page_id'=>$id]);
    //debug_arr($res_alias);
    //exit;
    if(!$res_alias){
        $_SESSION['message']['error'] = 'Error updating alias!';
        return false;
    }
    $_SESSION['message']['success'] = "Success!";
    return $result;
}