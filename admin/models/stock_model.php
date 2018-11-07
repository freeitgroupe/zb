<?php
defined("CATALOG") or die("Access denied");

//редактирование статуса акции или удаление акции
function editStock($pages_id, $deleteAction = false){
    $err=[];
    $success=[];
    $mess ='';
    $pages_id = (int)$pages_id;
    if(!$pages_id)  exit(json_encode('err_id_stock'));
    //существует ли акция в таблице акций
    $res = findOneParam('stock', 'id', $pages_id);
    if(!$res)  return 'err_id_stock in table';

    //проверка id акции в таблице продуктов
    $res = findOneParam('products', 'id', $pages_id);
    if($res){
        //очищаем запись
        $res = updateParamInTable('products', ['stock_id'], ['0'], ['stock_id'=>$pages_id]);
        if(!$res){
            $err[]='err update stock info in products table!';
        }else{
            $success[] ='success update stock info in products table!';
        }
    }

    //проверка id акции в таблице склад продукды
    $res = findOneParam('rel_warehouse_product', 'warehouse_stock', $pages_id);
    if($res){
        //очищаем запись в таблице со складами
        $res = updateParamInTable('rel_warehouse_product', ['warehouse_stock'], ['0'], ['warehouse_stock'=>$pages_id]);
        if(!$res){
            $err[]='err update stock info in rel_warehouse_product table!';
        }else{
            $success[] ='success update stock info in rel_warehouse_product table!';
        }
    }

    //если есть ошибки выводим данные в админ панель
    if(!empty($err)){
        if(!isset($_SESSION['message']['error'])){
            $_SESSION['message']['error']='';
        }
        $_SESSION['message']['error'] .= implode('<br/>', $err);
        $res = ['delete_pages_mess'=>$_SESSION['message']['error']];
        return $res;
    }

    //после всех проверок аннулируем акцию
    $res = updateParamInTable('stock', ['activation'], ['0'],['id'=>$pages_id]);
    if(!$res){
        $err[]='err update stock info in stock table!';
    }else{
        $success[] ='success update stock info in stock table!';
    }

    //удаление акции, ghjdthbnm ,skj kb j,yektybt frwbb
    if($res > false && $deleteAction > false) {
        $res = DeleteOneParamFromTable('stock', 'id', $pages_id);
        if (!$res) {
            $err[] = 'err dell stock info in stock table!';
        } else {
            $success[] = 'success delete stock info in stock table!';
        }
    }

    if(!empty($err)){
        if(!isset($_SESSION['message']['error'])){
            $_SESSION['message']['error']='';
        }
        $_SESSION['message']['error'] .= implode('\n', $err);
        $res = ['action_pages_mess'=>$_SESSION['message']['error']];
        return $res;
    }

    if(!empty($success)){
        if(!isset($_SESSION['message']['success'])){
            $_SESSION['message']['success']='';
        }
        $_SESSION['message']['success'] .= implode("\r\n", $success);
        $res = ['action_pages_mess'=>$_SESSION['message']['success'], 'action_pages_res' => true];
        return $res;
    }
}

