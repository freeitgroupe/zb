<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

//читаем Get запос при поиске доступных товаров для добавлении в upsell
if(isset($_POST['term']) && (strlen($_POST['term']) >= 2)){
    //поиск продукта по артиклу или заголовку
    $res = SearchProductsForUpsell($_POST['term']);
    exit($res);
}

//количество продуктов upsell
$CountProductsForUpsel = CountProductsForUpsell();
//debug_arr($CountProductsForUpsel);

//кол-во контента на страницу
$perpage = (isset($_COOKIE['per_page_product']) && (int)$_COOKIE['per_page_product']) ? $_COOKIE['per_page_product'] : PERPAGE;
//необходимое кол-во страниц
$count_pages = ceil($CountProductsForUpsel / $perpage);
//минимум 1 страница
if (!$count_pages) $count_pages = 1;
//если больше одной страницы
function page_count($count_pages){
    if ($count_pages > 1){
        $arr_page=[];
        //пронумеровали страницы
        for($i=1; $i<=$count_pages; $i++){
            $arr_page['page'][] = $i;
        }
    }
    else{
        $arr_page['page'][] = 1;
    }

    if(isset($_GET['page']) && (int)$_GET['page'] > 0){
        $arr_page['page_active'] = (int)$_GET['page'];
    }else{
        $arr_page['page_active'] = 0;
    }
    return $arr_page;
}
$page_count = page_count($count_pages);
// получение текущей страницы
if (isset($_GET['page'])){
    $page = (int)$_GET['page'];
    if($page < 1 || $page > $count_pages) $page = 1;
}
else{$page = 1;}
// начальная позиция для запроса
$start_pos = ($page - 1) * $perpage;
$pagination = pagination($page, $count_pages, $modrew = true, 'new', $page_count);
//получаем продукты согласно навигации
$ProductsForUpsell = ProductsForUpsell($start_pos, $perpage);
if(!$ProductsForUpsell){$ProductsForUpsell = 'EMPTY';}
//debug_arr($ProductsForUpsell);exit;

//добавляем upsell в базу
if(isset($_POST['upsell_confirm'])){
    $arr_post = $_POST;
    $res = AddProductsForUpsell($arr_post);
    if(!$res){
        header("Location: /admin/upsell/");
        exit();
    }else{
        header("Location: /admin/upsell/");
        exit();
    }
}

//Удаление
if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
    $pages_id =(int)$_POST['delete_pages_id'];
    if (!$pages_id)
        exit(json_encode(['delete_pages_mess'=>'Ошибка при удалении!']));


    if(find_one_param_table('rel_upsell_prod', 'upsell_id', $pages_id)):
        if(!DeleteOneParamFromTable('rel_upsell_prod', 'upsell_id', $pages_id))
            exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления prod upsell!']));
    endif;

    $delete_product_res = DeleteOneParamFromTable('upsell', 'id', $pages_id);
    if (!$delete_product_res)
        exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));
    exit(json_encode(['delete_pages_res'=>'true']));
}

require_once TMP_ADM . $view .'.php';