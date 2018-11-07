<?php


function deletePhotoFromTable($table, $tableId, $tableParam, $namePhoto, $savePath,$nameNoImage){
    $_SESSION['message']['error'] ='';
    $_SESSION['message']['success'] ='';
    $err=[];
    $success=[];

    //проверяем  имя изображения
    if (NOIMAGE == clear_string($namePhoto)){
        $err[]='This image not deleted!';
        $_SESSION['message']['error'] .= implode('\n', $err);
        $res = ['action_pages_mess'=>$_SESSION['message']['error']];
        return $res;
    }
    //найдено такое изображение или нет
    $res = Model_Driver::get_instance()->select(['*'], $table, ['id'=>$tableId, $tableParam=>clear_string($namePhoto)]);
    if(!$res[0]){return 'Err param for delete!';}

    $res = editDataInTable($table,[$tableParam=>$nameNoImage], ['id'=>$tableId],['=']);
    if (!$res){
        $err[] = 'Err updated data in table';
        $_SESSION['message']['error'] .= implode('\n', $err);
        $res = ['action_pages_mess'=>$_SESSION['message']['error']];
        return $res;
    }

    $success[]='Data in table updated!';
    //Удаление изображение из папки
    $res = unlink($_SERVER['DOCUMENT_ROOT'] . $savePath . clear_string($namePhoto));
    if (!$res){
        $err[] = 'err delete img from table';
        $_SESSION['message']['error'] .= implode('\n', $err);
        $_SESSION['message']['success'] .= implode("\r\n", $success);
        $res = ['action_pages_mess'=>$_SESSION['message']['error'] . $_SESSION['message']['success']];
        return $res;
    }
    $success[]='Image is deleted!';
    $_SESSION['message']['success'] .= implode("\r\n", $success);
    $res = ['action_pages_mess'=>$_SESSION['message']['success'], 'action_pages_res' => true];
    return $res;
}

//Параметры для поставщиков()


