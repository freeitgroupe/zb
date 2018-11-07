<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('pages_id', $match)) header("Location: /admin");

if($match['pages_id'] != 'new'){
    $pages_id = (int)$match['pages_id'];
    //Поиск по id продукта
    if(($param_id = findOneParam('warehouse', 'id', $pages_id)) > 0){
        $pages_id = $param_id['id'];
    }else{
        header("Location: /admin");
        exit();
    }
    //debug_arr($param_id);

    //Конструктор формы
    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        //debug_arr($arr_post);exit;
        $edit_warehouse_res = edit_warehouse_res($pages_id, $arr_post);
        if (!$edit_warehouse_res) {
            header("Location: ".PATH_ADMIN."edit-warehouse/" . $pages_id);
            exit();
        }
        header("Location: ".PATH_ADMIN."edit-warehouse/" . $pages_id);
        exit();
    }
}

//добавление склада
if($match['pages_id'] == 'new'){
    $pages_id = 'new';
    $param_id = [];

    //формирование сессионных переменных
    if(!isset($_SESSION['data'])){
        $_SESSION['data']['name'] = '';
        $_SESSION['data']['region_code'] = '';
        $_SESSION['data']['license_number'] = '';
        $_SESSION['data']['tax_summ'] = '';
        $_SESSION['data']['state_id'] = '';
        $_SESSION['data']['official_registration'] = '';
        $_SESSION['data']['city'] = '';
        $_SESSION['data']['warehouse_index'] = '';
        $_SESSION['data']['enterprise_id'] = '';
        $_SESSION['data']['coordinate_long'] = '';
        $_SESSION['data']['coordinate_latitude'] = '';
        $_SESSION['data']['address'] = '';
        $_SESSION['data']['responsible_person'] = '';
        $_SESSION['data']['phone'] = '';
        $_SESSION['data']['hotline_phone'] = '';
        $_SESSION['data']['notice'] = '';
    }

    foreach($_SESSION['data'] as $k=>$v) {
     $param_id[$k] = $v;
    }
    //debug_arr($param_id);

    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        //debug_arr($arr_post);exit;
        $new_warehouse_res = new_warehouse_res($arr_post);

        if (!$new_warehouse_res) {
            header("Location: /admin/edit-warehouse/" . $pages_id);
            exit();
        }

        if($new_warehouse_res){
            header("Location: /admin/warehouse-options/");
            exit();
        }

    }
}

require_once TMP_ADM . $view .'.php';