<?php
defined("CATALOG") or die("Access denied");
require_once "Model_Driver.php";

function clear_string($cl_str)
{   global $link;
    $cl_str = trim(strip_tags($cl_str));
    $cl_str = mysqli_real_escape_string($link, $cl_str);
    return $cl_str;
}

function addslashes_once($input){
    //These characters are single quote ('), double quote ("), backslash (\) and NUL (the NULL byte).
    $pattern = array("\\'", "\\\"", "\\\\", "\\0");
    $replace = array("", "", "", "");
    if(preg_match("/[\\\\'\"\\0]/", str_replace($pattern, $replace, $input))){
        return addslashes($input);
    }
    else{
        return $input;
    }
}

function clear_content($cl_str){
    global $link;
    $cl_str = htmlspecialchars($cl_str);
    $cl_str = mysqli_real_escape_string($link, $cl_str);
    $cl_str = trim($cl_str);
    return $cl_str;
}

function clear_float($param){
    $param = clear_string($param);
    if(!param) return false;
    $param = round(floatval(preg_replace("#,#",".",$param )), 2);
    return $param;
}

function debug_arr($array){
    echo "<pre>" .print_r($array, true) . "</pre>";
}

/**
 * Получение ID дочерних категорий
 **/
function cats_id($array, $id){
    if(!$id) return false;
    $data ='';
    if(is_array($array)){
        foreach($array as $item){
            if($item['parent'] == $id){
                $data .= $item['id'] . ",";
                $data .= cats_id($array, $item['id']);
            }
        }
    }
    return $data;
}

//количество страниц
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

/**
 * Получение alias, title, только дочерних категорий
 **/
function cats_info($ids, $id = false){
    if(!$ids) return false;
    $query = "SELECT alias, title, id, parent FROM `category` WHERE `view` = '1' AND parent IN($ids)";
    //echo $query;
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if(!$res) return false;
    $data=[];
    foreach ($res as $k=>$v){
       $data[$v['alias']] = $v['title'];
    }
    return $res;
}

function catsAllLevel($arrBreadcrumbs, $cats_info){
    $result =[];
    if(is_array($arrBreadcrumbs) && is_array($cats_info)){
        $result = array_merge ($arrBreadcrumbs, $cats_info);
    }
    if(!is_array($cats_info)){
        $result = $arrBreadcrumbs;
    }
    $data_arr = [];
    $result = (array)$result;
    foreach ($result as $item){
        $data_arr[$item['id']]=$item;
    }
    return $data_arr;
}

//Формируем массив страниц
function get_pages(){
    $res = Model_Driver::get_instance()->select(['title', 'alias', 'parent_section'], 'pages',['status'=>1],'position','ASC');
    if(!$res) return false;
    $arr =[];
    foreach ($res as $item){
        if($item['parent_section'] == 0){ $arr['header'][]=$item; continue; }
        elseif($item['parent_section'] == 1){ $arr['footer'][]=$item; continue; }
        elseif($item['parent_section'] == 2){ $arr['header'][]=$item; $arr['footer'][]=$item; continue; }
        else{ $arr['unknown'][]=$item; continue; }
    }
    return $arr;
}

//Формируем наименование разделов для страниц
function get_page_section(){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM pages_section");
    $section = [];
    while($row = mysqli_fetch_assoc($result)){
        $section[] = $row['title'];
    };
    return $section;

}

//Формируем массив категорий
function get_category_front(){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM category WHERE `view` = '1'");
    $arr_cat = array();
    while($row = mysqli_fetch_assoc($result)){
        $arr_cat[$row['id']] = $row;
    }
    return $arr_cat;
}

//Формируем массив категорий общий
function get_category(){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM category");
    $arr_cat = array();
    while($row = mysqli_fetch_assoc($result)){
        $arr_cat[$row['id']] = $row;
    }
    return $arr_cat;
}

//Формируем массив основных категорий
function primary_category(){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM category WHERE parent='0'");
    $arr_cat = array();
    while($row = mysqli_fetch_assoc($result)){
        $arr_cat[$row['id']] = $row;
    }
    return $arr_cat;
}


/**
 * Построение дерева
 **/
function map_tree($dataset) {
    $tree = array();
    foreach ($dataset as $id=>&$node) {
        if (empty($node['parent'])){
            $tree[$id] = &$node;
        }else{
            $dataset[$node['parent']]['childs'][$id] = &$node;
        }
    }
    return $tree;
}

/**
 * Дерево в строку HTML для категорий
 **/
function category_to_string($data,  $template = false){
    //var_dump($template);
    $string = '';
    foreach($data as $item){
        $string .= category_to_template($item, $template);
    }
    return $string;
}

/**
 * Шаблон вывода категорий
 **/
function category_to_template($category, $template){
    ob_start();
    include "{$_SERVER['DOCUMENT_ROOT']}/views/{$template}";
    return ob_get_clean();
}

/**
 * Дерево в строку HTML
 **/
function data_tree_to_string($data, $template = '', $tab='', $arr=[]){
    //var_dump($template);
    $string = '';
    foreach($data as $item){
        $string .= data_to_template($item, $template,  $tab, $arr);
    }
    return $string;
}

/**
 * Шаблон вывода данных
 **/
function data_to_template($data, $template, $tab, $arr){
    ob_start();
    include "{$template}";
    return ob_get_clean();
}


/**
 * Дерево в строку HTML для комментариев
 **/
function comments_to_string($data, $template = 'comments_template.php'){
    $string='';
    foreach ($data as $item){
        $string .= comments_to_template($item, $template);
    }
    return $string;
}

/**
 * Шаблон вывода комментариев
 **/
function comments_to_template($comments, $template){
    ob_start();
    include "views/{$template}";
    return ob_get_clean();
}

/**
 * Массив в строку HTML для ajax output
 **/
function content_to_string($data, $template = false){
    $string='';
    foreach ($data as $item){
        $string .= content_to_template($item, $template);
    }
    return $string;
}

/**
 * Шаблон вывода ajax content
 **/
function content_to_template($content, $template){
    ob_start();
    include "views/template_to_html/{$template}";
    return ob_get_clean();
}

function getUrlForPage(){
    $uri = "?";
    $url = $_SERVER['REQUEST_URI'];
    $url = explode("?", $url);
    if(isset($url[1]) && $url[1] != ''){
        $params = explode("&", $url[1]);
        foreach($params as $param){
            if(!preg_match("#page=#", $param)) $uri .= "{$param}&amp;";
        }
    }
}

/**
 * Постраничная навигация
 **/
function pagination($page, $count_pages, $modrew = true, $type_pagination = 'default', $page_count=false){
    // << < 3 4 5 6 7 > >>
    // $back - ссылка НАЗАД
    // $forward - ссылка ВПЕРЕД
    // $startpage - ссылка В НАЧАЛО
    // $endpage - ссылка В КОНЕЦ
    // $page2left - вторая страница слева
    // $page1left - первая страница слева
    // $page2right - вторая страница справа
    // $page1right - первая страница справа

    $page2left = '';
    $page1left = '';
    $page2right = '';
    $page1right = '';
    $startpage ='';
    $back='';
    $endpage='';
    $forward='';

    $uri = "?";
    if(!$modrew)
        {
            // если есть параметры в запросе
            if($_SERVER['QUERY_STRING'] ){
                foreach ($_GET as $key => $value) {
                    if( $key != 'page' ) $uri .= "{$key}=$value&amp;";
                }
            }
        }
    else
        {
            $url = $_SERVER['REQUEST_URI'];
            $url = explode("?", $url);
            if(isset($url[1]) && $url[1] != ''){
                $params = explode("&", $url[1]);
                foreach($params as $param){
                    if(!preg_match("#page=#", $param)) $uri .= "{$param}&amp;";
                }
            }
        }
    if($type_pagination == 'default')
        {
            if( $page > 1 ){
                $back = "<a class='nav-link' href='{$uri}page=" .($page-1). "'>&lt;</a>";
            }
            if( $page < $count_pages ){
                $forward = "<a class='nav-link' href='{$uri}page=" .($page+1). "'>&gt;</a>";
            }
            if( $page > 3 ){
                $startpage = "<a class='nav-link' href='{$uri}page=1'>&laquo;</a>";
            }
            if( $page < ($count_pages - 2) ){
                $endpage = "<a class='nav-link' href='{$uri}page={$count_pages}'>&raquo;</a>";
            }
            if( $page - 2 > 0 ){
                $page2left = "<a class='nav-link' href='{$uri}page=" .($page-2). "'>" .($page-2). "</a>";
            }
            if( $page - 1 > 0 ){
                $page1left = "<a class='nav-link' href='{$uri}page=" .($page-1). "'>" .($page-1). "</a>";
            }
            if( $page + 1 <= $count_pages ){
                $page1right = "<a class='nav-link' href='{$uri}page=" .($page+1). "'>" .($page+1). "</a>";
            }
            if( $page + 2 <= $count_pages ){
                $page2right = "<a class='nav-link' href='{$uri}page=" .($page+2). "'>" .($page+2). "</a>";
            }

            return $startpage.$back.$page2left.$page1left.'<a class="nav-active">'.$page.'</a>'.$page1right.$page2right.$forward.$endpage;
        }
    else
        {
             $pageOutNav = '';
             if(((int)$page-1) > 0){
                 $pageOutNav .= "<a href='{$uri}page=";
                 $pageOutNav .= (int)$page - 1;
                 $pageOutNav .= "'><i class='icons'>keyboard_arrow_left</i>Previous</a>";
             }
             $pageOutNav .= "<i class='icons fat'>linear_scale</i>";

            if(((int)$page) < $count_pages){
                $pageOutNav .= "<a href='{$uri}page=".((int)$page + 1)."'>Next<i class='icons'>keyboard_arrow_right</i></a>";
            }
            $pageOutNav .= "<select name='pagination' id='pagination' class='top'>";

            foreach($page_count['page'] as $item){
                $pageOutNav .= "<option value='{$uri}page={$item}'";
                $pageOutNav .= "data-link='{$uri}page={$item}'";
                if($item == $page_count['page_active']){$pageOutNav .= 'selected';}
                $pageOutNav .= ">$item</option>";
            }
            $pageOutNav .= "</select>";
            return $pageOutNav;
        }
}


function ResPagination(){}

/**
 * Навигационная цепочка
 **/
function breadcrumbs($array, $id=false){
    if(!$id) return false;
    //debug_arr($array);
    $count = count($array);
    $breadcrumbs_array = [];
    for($i = 0; $i < $count; $i++){
        if(isset($array[$id])){
            $breadcrumbs_array[$array[$id]['alias']] = $array[$id]['title'];
            $id = $array[$id]['parent'];
        }else break;
    }
    return array_reverse($breadcrumbs_array, true);
}

function catsAllLineChilds($array, $id=false){
    if(!$id) return false;
    //debug_arr($array);
    $count = count($array);
    $breadcrumbs_array = [];
    for($i = 0; $i < $count; $i++){
        if(isset($array[$id])){
            $breadcrumbs_array[$array[$id]['id']] = $array[$id];
            $id = $array[$id]['parent'];
        }else break;
    }
    //return debug_arr($breadcrumbs_array);
    return array_reverse($breadcrumbs_array, true);
}

/**
 * генерация случайного кода
 **/
function  gen_code ($max)  {//генератор кода
    $chars = "qazxswedcvfrtgbnhyujmkiolp1234567890QAZXSWEDCVFRTGBNHYUJMKIOLP";
    $size = strlen($chars) - 1;
    $code = null;
    while ($max--)
        $code .= $chars[rand(0, $size)];
    return $code;
}

/**
 * Формирование mail
 **/
function send_mail($thema,$msg_old,$email) {//отправка емейла
    if (preg_match('/@outlook|@hotmail|@live/',$email)) {
        $subject = $thema."\r\n";
    } else {
        $subject=iconv('UTF-8','Windows-1251',$thema."\r\n");
    }
    $header = "Reply-To: ".EMAIL."\r\n";
    $header .= "MIME-Version: 1.0\r\n";
    $header .="Content-type: text/html; charset=\"Windows-1251\"\r\n";
    $header .="Content-Transfer-Encoding: 8bit\r\n";
    $header.="From: \"WodSportsUA\" <".EMAIL.">\r\n";
    $header.="To: \"{$email}\" <{$email}>\r\n";
    $header.="Return-Path: ".EMAIL." <".EMAIL.">\r\n";
    $header.="List-Unsubscribe: <mailto:".EMAIL.">\r\n\r\n";
    $header = iconv('UTF-8','Windows-1251',$header);
    $message = iconv('UTF-8','Windows-1251',$msg_old);
    mail($email, $subject, $message, $header);
    return true;
}


/**
 * Достаем id пользователя
 **/
function get_user($email,$password) {
    $pass   = md5(clear_string($password));
    $pass   = strrev($pass);
    $pass   = strtolower("9nm2rv8q".$pass."2yo6z");
    $obj_db = Model_Driver::get_instance();
    //формируем запрос
    $result = $obj_db->select(
        ['id'],
        'users',[
        'email'=>$email,
        'pass'=>$pass
    ]);

    //вывод сообщения о неудачной авторизации
    if($result == NULL || $result == FALSE) {
        return FALSE;
    }

    //в случае успешной попытки возвращаем результат запроса
    if(is_array($result)) {
        return $result[0]['id'];
    }
}

/**
 * Проверяем колличество неудач при авторизации
 **/
function get_fealtures($ip) {
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $result = $obj_db->select(
        ['fealtures'],
        'fealtures',
        ['ip'=>$ip]
    );

    //проверяем если  0 тогда возвращаем нулл
    if(count($result) == 0) {
        return NULL;
    }
    //возвращаем результат запрос
    return $result[0]['fealtures'];
}


//записываем ip адрес при неудачной попытке авторизации
function insert_fealt($ip) {
    $obj_db = Model_Driver::get_instance();
    $obj_db->insert(
        'fealtures',
        array('fealtures','ip','time'),
        array('1',$ip,time()));
}

//обновляем данные  по ip при неудачной попытке авторизации
function update_fealt($ip,$fealtures) {
    $fealtures++;
    $obj_db = Model_Driver::get_instance();
    $obj_db->update(
        'fealtures',
        array('fealtures','time'),
        array($fealtures,time()),
        array('ip' => $ip)
    );
}

/**
 * Очищаем таблицу блокировок пользователя
 **/
function clean_fealtures($time) {
    $obj_db = Model_Driver::get_instance();
    $obj_db->delete('fealtures',['time'=>$time],['<=']);
}

/**
 * Очищаем таблицу блокировок пользователя по id
 **/
function delete_fealtures($ip) {
    $obj_db = Model_Driver::get_instance();
    $obj_db->delete('fealtures',['ip'=>$ip],['=']);
}

function logout_res($event_user, $session_auth){
    $event_user = clear_string($event_user);
    //проверяем существование сессии
    if(!empty($event_user) && $event_user == 'logout'){
        //var_dump($session_auth);exit();
        //session_start();
        session_unset($session_auth);
        if(isset($_COOKIE['user'])){
            setcookie('user','', 0, '/');
        }
        echo 'logout'; exit();
    }else{echo 'false';exit();}
}

/**
 * Проверяем существование продукта
 **/
function findOneProduct($id){
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $result = $obj_db->select(
        ['id'],
        'products',
        ['id'=>$id]
    );
    if(!$result) return false;
    if($result) return $result[0];
}

/**
 * Поиск id категории по алиасу
 **/
function findOneCategoryId($alias){
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $alias = clear_string($alias);
    $result = $obj_db->select(['id'],'category', ['alias'=>$alias]);
    //debug_arr($result);
    if(!$result) return false;
    if($result) return $result[0]['id'];
}

/**
 * Поиск id продукта по алиасу
 **/
function findOneProductId($alias){
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $alias = clear_string($alias);
    $result = $obj_db->select(['id'],'products', ['alias'=>$alias]);
    if(!$result) return false;
    if($result) return $result[0]['id'];
}

/**
 * Данные о выбранном продукте
 **/
function findOneProductInfo($id){
    $id = (int)$id;
    $obj_db = Model_Driver::get_instance();
    //пишем запрос в бд
    $result = $obj_db->select(
        ['*'],'products',['id'=>$id]);
    if(!$result) return false;
    return $result[0];
}

//проверка существования параметров в бд (таблица критерий)
function findOneParam($table, $param_table, $param_variable, $arr_response=false){
    $table = clear_string($table);
    $param_table = clear_string($param_table);
    $param_variable = clear_string($param_variable);
    $obj_bd = Model_Driver::get_instance();
    $result = $obj_bd->select(['*'], $table, [$param_table => $param_variable]);
    if(!$result) return false;
    if($arr_response == true) return $result;
    return $result[0];
}

//удаление параметра из бд
function DeleteOneParamFromTable($table, $paramTable, $searchParam){
    $table = clear_string($table);
    $paramTable = clear_string($paramTable);
    $searchParam = clear_string($searchParam);
    $obj_db = Model_Driver::get_instance();
    if(!findOneParam($table, $paramTable, $searchParam)) return false;
    $res = $obj_db ->delete($table, [$paramTable =>$searchParam], ['=']);
    if(!$res) return false;
    return true;
}

//поиск алиаса
//$table - талица с которой работаем
//$field - поле алиаса с которым работаем
//$str - строка алиаса
//$id - id поле которое пристыкуем в случае не уканильности алиаса
function get_alias($table, $field, $str, $id, $event='', $nameId=''){
    global $link;
    $str = str2url($str);
    if($event == 'edit'){
        $query = "SELECT $field FROM $table WHERE $field = '$str' AND $nameId <> $id";
        //echo $query;
    }else{
        $query = "SELECT $field FROM $table WHERE $field = '$str'";
    }
    $res = mysqli_query($link, $query);
    if(mysqli_num_rows($res)) {
        $str = "{$str}-{$id}";
        $res = mysqli_query($link, $query);
        if (mysqli_num_rows($res)) {
            $str = get_alias($table, $field, $str, $id, $event='', $nameId='');
        }
    }
    return $str;
}

function rus2translit($string) {

    $converter = array(

        'а' => 'a',   'б' => 'b',   'в' => 'v',

        'г' => 'g',   'д' => 'd',   'е' => 'e',

        'ё' => 'e',   'ж' => 'zh',  'з' => 'z',

        'и' => 'i',   'й' => 'y',   'к' => 'k',

        'л' => 'l',   'м' => 'm',   'н' => 'n',

        'о' => 'o',   'п' => 'p',   'р' => 'r',

        'с' => 's',   'т' => 't',   'у' => 'u',

        'ф' => 'f',   'х' => 'h',   'ц' => 'c',

        'ч' => 'ch',  'ш' => 'sh',  'щ' => 'sch',

        'ь' => '\'',  'ы' => 'y',   'ъ' => '\'',

        'э' => 'e',   'ю' => 'yu',  'я' => 'ya',

        'А' => 'A',   'Б' => 'B',   'В' => 'V',

        'Г' => 'G',   'Д' => 'D',   'Е' => 'E',

        'Ё' => 'E',   'Ж' => 'Zh',  'З' => 'Z',

        'И' => 'I',   'Й' => 'Y',   'К' => 'K',

        'Л' => 'L',   'М' => 'M',   'Н' => 'N',

        'О' => 'O',   'П' => 'P',   'Р' => 'R',

        'С' => 'S',   'Т' => 'T',   'У' => 'U',

        'Ф' => 'F',   'Х' => 'H',   'Ц' => 'C',

        'Ч' => 'Ch',  'Ш' => 'Sh',  'Щ' => 'Sch',

        'Ь' => '\'',  'Ы' => 'Y',   'Ъ' => '\'',

        'Э' => 'E',   'Ю' => 'Yu',  'Я' => 'Ya',

    );

    return strtr($string, $converter);

}

function str2url($str) {
    // переводим в транслит
    $str = rus2translit($str);
    // в нижний регистр
    $str = strtolower($str);
    // заменям все ненужное нам на "-"
    $str = preg_replace('~[^-a-z0-9_]+~u', '-', $str);
    // удаляем начальные и конечные '-'
    $str = trim($str, "-");
    return $str;
}

function res_alias(){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db ->select(['*'], 'products');
    if($res){
        for($i=0, $count = count($res); $i<$count; $i++){
            //$str_title = str_replace(" ","",$res[$i]['title']);
            $str_title =$res[$i]['title'];
            $str_title =  $str_title .'_' . $res[$i]['id'];
            $res_update = $obj_db -> update('products', ['title'], [$str_title], ['id'=>$res[$i]['id']]);
            if(!$res_update) return false;
        }
    }
}

//проверка ajax запроса
function safePostAjaxRequest(){
    header('Content-Type: application/json');
    $headers = apache_request_headers();
    if (isset($headers['CsrfToken']) && $headers['CsrfToken'] == $_SESSION['csrf_token'])
    {
        return true;
    }
    else
    {
        return false;
    }
}

//Информация о акциях
function get_stock(){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db -> select(['*'], 'stock', ['activation'=>1]);
    if(!$res) return false;
    return $res;
}

//Информация о акциях на товар
function get_stock_info($stock_id){
    $obj_db = Model_Driver::get_instance();
    $res = $obj_db -> select(['*'], 'stock', ['id'=>$stock_id]);
    if(!$res) return false;
    $date_now = gmdate('Y-m-d H:i:s',time());
    $res[0]['date_now'] = $date_now;
    return $res[0];
}

//Формирование рейтинга для товара
function res_rate($postID, $rating_num, $ratingPoints){
    //проверка рейтинг поинтс $raitingPoints не более 5
    if($ratingPoints > 5){ $ratingPoints = 5;}
    if($ratingPoints <= 0){ $ratingPoints = 1;}
    $db = Model_Driver::get_instance();
    //Check the rating row with same post ID
    $prevRatingQuery = "SELECT * FROM `prod_rating` WHERE product_id = ".$postID;
    $prevRatingResult = $db->sqlQuery($prevRatingQuery);

    //var_dump($prevRatingResult);exit;
    if($prevRatingResult != FALSE):
        $prevRatingRow = $prevRatingResult[0];
        $rating_num = (int)$rating_num + (int)$prevRatingRow['rating_number'];
        $ratingPoints = (int)$ratingPoints + (int)$prevRatingRow['total_points'];
        $modif_date = date("Y-m-d H:i:s");

        //проверка на привязку ip usera к продукту.
        $user_ip_info = $db ->select(['*'], 'prod_info_rating', ['user_ip'=>$_SERVER['REMOTE_ADDR'], 'prod_rating_id'=>$postID]);

        //есть ли данные ip юзера в базе
        if(is_array($user_ip_info)){
            $ratingRow['status']='isset_rate';
            exit(json_encode($ratingRow));
        }

        //Update rating data into the database
        //$query = "UPDATE `prod_rating` SET rating_number= '".$rating_num."', total_points = '".$ratingPoints."', modified = '".date("Y-m-d H:i:s")."' WHERE product_id= ".$postID;
        $update = $db->update('prod_rating', ['rating_number', 'total_points', 'modified'],[$rating_num, $ratingPoints,  $modif_date],['product_id'=>$postID]);

    else:
        $created_date = date("Y-m-d H:i:s");
        $modif_date = date("Y-m-d H:i:s");
        $insert = $db->insert('prod_rating',['product_id', 'rating_number', 'total_points', 'created', 'modified'], [$postID, $rating_num, $ratingPoints, $created_date, $modif_date]);

        //записываем ip пользователя
        $insert_for_info_rating = $db->insert('prod_info_rating',['user_ip', 'ip_locale_address', 'prod_rating_id', 'created'], [$_SERVER['REMOTE_ADDR'], gethostbyaddr($_SERVER['REMOTE_ADDR']), $postID, $created_date]);
    endif;

    //Fetch rating deatails from database
    $query2 = "SELECT rating_number, FORMAT((total_points / rating_number),1) as average_rating FROM prod_rating WHERE product_id = ".$postID." AND status = 1";
    $result = $db->sqlQuery($query2);
    $ratingRow = $result[0];

    if($ratingRow){
        $ratingRow['status'] = 'ok';
    }else{
        $ratingRow['status'] = 'err';
    }
    //Return json formatted rating data
    exit(json_encode($ratingRow));
}

//Информация о орейтинге для товара
function product_rating($id){
    $db = Model_Driver::get_instance();
    $query2 = "SELECT rating_number, FORMAT((total_points / rating_number),1) as average_rating FROM prod_rating WHERE product_id = ".$id." AND status = 1";
    $result = $db->sqlQuery($query2);
    //var_dump($result);
    if(!$result) return false;
    return $result[0];
}

//Информация о таблице
function find_all_from_table($table){
    $db = Model_Driver::get_instance();
    $res = $db->select(['*'], $table);
    if(!$res) return false;
    return $res;
}

//Информация о не совпадающих значениях в таблице
function find_not_in_param_table($table, $param_table, $arr_search_param){
    if(!$arr_search_param) return false;
    $db = Model_Driver::get_instance();
    $search_param = implode(',',$arr_search_param);
    $query = "SELECT * FROM $table WHERE $param_table NOT IN ($search_param)";
    //echo  $query;
    $res = $db->sqlQuery($query);
    if(!$res) return false;
    return $res;
}

//Информация о таблице
function find_one_param_table($table, $table_param, $search_param, $sort=false){
    $db = Model_Driver::get_instance();
    if($sort>false){
        $sorting="";
    }
    $res = $db->select(['*'], $table, [$table_param => $search_param], 'id','DESC');
    if(!$res) return false;
    return $res;
}

//Информация склады - продукт
function warehouse_all_info_rel_prod($id){
    if(empty($id)) return false;
    $db = Model_Driver::get_instance();
    $res = $db->sqlQuery("SELECT `warehouse`.id as id_warehouse,`warehouse`.name, `warehouse`.state_id, `warehouse`.warehouse_article, `warehouse`.tax_summ, `warehouse`.notice, `rel_warehouse_product`.* FROM `warehouse` LEFT JOIN `rel_warehouse_product` ON `warehouse`.id=`rel_warehouse_product`.warehouse_id WHERE product_id={$id}");
    if(!$res) return false;
    return $res;
}

//Информация о существующих складах для продукта
function id_isset_warehouse($isset_warehouse){
    if(!is_array($isset_warehouse)){ return false;}
    $arr_id = [];
    for($i=0, $count=count($isset_warehouse); $i<$count;$i++){
        $arr_id[] = $isset_warehouse[$i]['id_warehouse'];
    }
    return $arr_id;
}

//Информация склады где нет данного продукта
function warehouse_all_info_empty_prod($id){
    $db = Model_Driver::get_instance();
    $res = $db->sqlQuery("SELECT `warehouse`.id as id_warehouse,`warehouse`.name, `warehouse`.state_id, `warehouse`.warehouse_article, `warehouse`.tax_summ, `warehouse`.notice, `rel_warehouse_product`.* FROM `warehouse` LEFT JOIN `rel_warehouse_product` ON `warehouse`.id=`rel_warehouse_product`.warehouse_id WHERE product_id<>{$id}");
    if(!$res) return false;
    return $res;
}

//Информация о складах
function warehouse_info(){
    $db = Model_Driver::get_instance();
    $res = $db->sqlQuery("SELECT `warehouse`.* FROM `warehouse` ORDER BY id");
    if(!$res) return false;
    return $res;
}
//Активный склад по умолчанию возвращаем id по умолчанию
function WarehouseDefaultIdForUsers(){
    $res = findOneParam('warehouse','main_warehouse', '1' );
    if(!$res) return false;
    return $res['id'];
}


//выбор склада пользователем
function  WarehouseForUsers($warehouse_arr){
    //$warehouse_arr - список всех складов
    //Если пользователь авторизован
    if(isset($_SESSION['auth'])){
        $Warehouse = (int)$_SESSION['auth_warehouse'];
        if(!$Warehouse) $Warehouse = WarehouseDefaultIdForUsers();
        return  $Warehouse;
    }else{
        return WarehouseDefaultIdForUsers();
    }
}

function UserChoiceWarehouse($id){
    $id= (int)$id;
    $res = findOneParam('warehouse', 'id', $id);
    if(!$res) return false;
    return $res['id'];
}

function WarehouseArrWithChoiceUserWarehouse($warehouse, $id_warehouse){
    if(!$warehouse or !$id_warehouse) return false;
    $id_warehouse = (int)$id_warehouse;
    $arr = [];
    foreach($warehouse as $k=>$v){
        if($v['id'] == $id_warehouse){
            $arr[$k]=$v;
            $arr[$k]['selected'] = 'selected';
        }else{
            $arr[$k]=$v;
        }
    }
    return $arr;
}


//оформируем анонс новостей(обрезаем часть текста)
function get_cut_text($text = ''){
    $text = substr($text, 0 , 200 );
    $text =  substr($text, 0, strrpos($text, ' ')) . "...";
    return $text;
}


//водный знак
//$img – идентификатор изображения, на которое добавляется водяной знак
//$text – текст надписи
//$font – имя файла шрифта .ttf
//$r,$g,$b – цвет надписи в формате RGB
//$alpha – уровень прозрачности , от 0 до 128
//$image = add_watermark($img2,'Grigorieff.ru','erasbd.ttf');
function add_watermark($img, $text, $font, $r = 128, $g = 128, $b = 128, $alpha = 100)
{
//    //получаем ширину и высоту исходного изображения
//    $width = imagesx($img);
//    $height = imagesy($img);
//    //угол поворота текста
//    $angle =  -rad2deg(atan2((-$height),($width)));
//
//    //добавляем пробелы к строке
//    $text = " ".$text." ";
//
//    $c = imagecolorallocatealpha($img, $r, $g, $b, $alpha);
//    $size = (($width+$height)/2)*2/strlen($text);
//    $box  = imagettfbbox ( $size, $angle, $font, $text );
//    $x = $width/2 - abs($box[4] - $box[0])/2;
//    $y = $height/2 + abs($box[5] - $box[1])/2;
//    //записываем строку на изображение
//    imagettftext($img,$size ,$angle, $x, $y, $c, $font, $text);
//    return $img;
}

//Изменение размера изображения
function resizing($target, $dest, $wmax, $hmax, $ext){
    /*
    $target - путь к оригинальному файлу
    $dest - путь сохранения обработанного файла
    $wmax - максимальная ширина
    $hmax - максимальная высота
    $ext - расширение файла
    */
    list($w_orig, $h_orig) = getimagesize($target);
    $ratio = $w_orig / $h_orig; // =1 - квадрат, <1 - альбомная, >1 - книжная

    if(($wmax / $hmax) > $ratio){
        $wmax = $hmax * $ratio;
    }else{
        $hmax = $wmax / $ratio;
    }

    $img = "";
    // imagecreatefromjpeg | imagecreatefromgif | imagecreatefrompng
    switch($ext){
        case("gif"):
            $img = imagecreatefromgif($target);
            break;
        case("png"):
            $img = imagecreatefrompng($target);
            break;
        default:
            $img = imagecreatefromjpeg($target);
    }
    $newImg = imagecreatetruecolor($wmax, $hmax); // создаем оболочку для новой картинки

    if($ext == "png"){
        imagesavealpha($newImg, true); // сохранение альфа канала
        $transPng = imagecolorallocatealpha($newImg,0,0,0,127); // добавляем прозрачность
        imagefill($newImg, 0, 0, $transPng); // заливка
    }

    imagecopyresampled($newImg, $img, 0, 0, 0, 0, $wmax, $hmax, $w_orig, $h_orig); // копируем и ресайзим изображение
    switch($ext){
        case("gif"):
            imagegif($newImg, $dest);
            break;
        case("png"):
            imagepng($newImg, $dest);
            break;
        default:
            //imagejpeg($newImg, $dest);
            add_watermark(imagejpeg($newImg, $dest),'Grigorieff.ru','erasbd.ttf');
    }
    imagedestroy($newImg);
}

//поиск файла для изображения
function img_exists($path_img, $name_img, $nophoto, $resizing = false){
    if($resizing > false){
        $filename = $nophoto;
    }
    $file = $_SERVER["DOCUMENT_ROOT"] . $path_img . $name_img;
    if(!file_exists( $file)) return $nophoto;
    return $path_img . $name_img;
}

//проверка на пусоту
//field_check - наименование ключа для проверки
function check_empty($arr_post_clear, $field_check_arr){
    //проверка полей на пустоту
    foreach ($arr_post_clear as $k=>$v){
        foreach ($field_check_arr as $k1=>$v1){
            if($k == $v1){
                if(clear_string($v)==''){
                    return false;
                }
            }
        }
    }
    return true;
}

//проверка на целочисленное хначение
function check_integer($arr_post_clear, $field_check_arr){
    foreach ($arr_post_clear as $k=>$v){
        foreach ($field_check_arr as $k1=>$v1){
            if($k == $v1){
                if(clear_string($v)==''){
                    return false;
                }
            }
        }
    }
    return true;
}

//добавление данных
function addDataToTable($table, $arr_post, $not_empty_arr = false, $int_arr = false, $files_arr= false){
    $arr_post_clear=[];
    foreach($arr_post as $key=>$value):
        if(is_array($value) && (count($value) > 0)):
            $n='';
            $i=0;
            foreach ($value as $k=>$v):
                if(clear_string($v) == NULL) continue;
                $arr_post_clear[$key][$k] = clear_string($v);
                $n .= $arr_post_clear[$key][$k] . '|';
                $n = str_replace('||', '|', $n);
                $i++;
            endforeach;
            if($i > 1):
                $arr_post_clear[$key] = substr($n, 0, -1);
            else:
                $arr_post_clear[$key] = $n;
            endif;
        else:
            //проверяем на наличие целочисленных значений
            if($int_arr > false && in_array($key, $int_arr)){
                foreach ($int_arr as $k1=>$v1) {
                    if ($key == $v1) {
                        $arr_post_clear[$key] = (int)$value;
                    }
                }
                continue;
            }
            $arr_post_clear[$key] = clear_string($value);
        endif;
    endforeach;

    if($not_empty_arr > false){
        if(!check_empty($arr_post_clear, $not_empty_arr)){
            $_SESSION['message']['error'] = 'Fill out the required field.</br>';
            return false;
        }
    }
    //получаем значения массива
    $values_param =  array_values($arr_post_clear);
    $keys_param =  array_keys($arr_post_clear);
    $res = Model_Driver::get_instance()->insert($table, $keys_param, $values_param);
    if(!$res){
        $_SESSION['message']['error'] ='err added to' . $table;
        return false;
    }
    $_SESSION['message']['success'] = 'Success';
    return true;
}

//добавление сессионных данных
function createSessionData($session_name, $arr_post ){
    if(!is_array($arr_post)){return false;}
    foreach ($arr_post as $key => $value):
        $_SESSION["{$session_name}"]["{$key}"] = clear_string($value);
    endforeach;
}

//добавление сессионных данных
function createSessionEmptyData($session_name, $arr_post){
    if(!is_array($arr_post)){return false;}
    foreach ($arr_post as $key => $value):
        $_SESSION["{$session_name}"]["{$value}"] = '';
    endforeach;
}

//Редактирование и обновление данных
// exmaple
//editDataInTable('tableName', ['tablecolumn'=>$_POST['senParam']], ['id_column'=>$_POST['senParamId'], ['='], [$_POST['senParamCheckforEmpty']]])
function editDataInTable($table, $arr_post, $param_update, $equity_option, $not_empty_arr = false, $int_arr = false, $clearContent = 'false'){
    $arr_post_clear=[];
    foreach($arr_post as $key=>$value):
        if(is_array($value) && (count($value) > 0)):
            $n='';
            $i=0;
            foreach ($value as $k=>$v):
                if(clear_string($v) == NULL) continue;
                $arr_post_clear[$key][$k] = clear_string($v);
                $n .= $arr_post_clear[$key][$k] . '|';
                $n = str_replace('||', '|', $n);
                $i++;
            endforeach;
            if($i > 1):
                $arr_post_clear[$key] = substr($n, 0, -1);
            else:
                $arr_post_clear[$key] = $n;
            endif;
        else:
            if($clearContent == 'false'){
            $arr_post_clear[$key] = clear_string($value);
            }else{
                $arr_post_clear[$key] = clear_content($value);
            }
        endif;
    endforeach;

    //прооверка на пустоту
    if($not_empty_arr > false){
        if(!check_empty($arr_post_clear, $not_empty_arr)){
            $_SESSION['message']['error']='Fill out the required field';
            return false;
        }
    }

    $values_param =  array_values($arr_post_clear);
    $keys_param =  array_keys($arr_post_clear);
    $res = Model_Driver::get_instance()->update($table,$keys_param ,$values_param,$param_update,$equity_option);
    if(!$res){
        return false;
    }
    return true;
}

//удаление даннных
function delDataTable($table, $arr_post, $equity_option){
    $res = Model_Driver::get_instance()->delete($table, $arr_post, $equity_option);
    if(!$res){
        return false;
    }
    return true;
}

//подсчет количества полей в таблице
function countRowTable($table,$where_arr = false){
    if(!$where_arr){
        $res = Model_Driver::get_instance()->select(['count(*)'],$table);
    }else{
        $res = Model_Driver::get_instance()->select(['count(*)'],$table,$where_arr);
    }
    if(!$res) return false;
    return $res[0]['count(*)'];
}

//подсчет суммы определенного поля в таблице
function countSummColomnTable($table,$column_name, $where_arr = false){
    if(!$where_arr){
        $res = Model_Driver::get_instance()->select(['SUM('.$column_name.')'],$table);
    }else{
        $res = Model_Driver::get_instance()->select(['SUM('.$column_name.')'],$table,$where_arr);
    }
    if(!$res) return false;
    return $res[0]['SUM('.$column_name.')'];
}


//параметры таблицы с учетом пагинации
function get_pagination_param($table, $sort_param, $direction, $start_pos, $perpage, $sqlquery = false){
    $query = "SELECT * FROM {$table} ORDER BY {$sort_param} {$direction} LIMIT {$start_pos}, {$perpage}";
    if($sqlquery){
        $query = $sqlquery;
    }
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if(!$res){ return false;}
    return $res;
}

function upload_image($name_files_arr,$temporary_folder_img,$base_folder_img,$update_table,$update_td_name,$update_td_id,$update_td_id_last_id_added){
    if(!empty($name_files_arr['tmp_name']))
    {
        if(!empty($name_files_arr['error']))
        {
            $_SESSION['message']['error'] .= "err upload images!<br/>";
            return false;
        }

        //данные для загрузки изображения
//        $tmp_name = $_FILES['image']['tmp_name'];
//        $name_file = $_FILES['image']['name'];
//        $type_file = $_FILES['image']['type'];
//        $size_file = $_FILES['image']['size'];
//        $upload_tmp_file = PROD_IMG_TMP;
//        $upload_base_file = PROD_IMG;
//        $update_table ='products';
//        $update_td_name ='image';
//        $update_td_id ='id';
//        $update_td_id_last_id_added = $id;
//        //$
        $res_upload = downloadImage(
            $name_files_arr['tmp_name'],
            $name_files_arr['name'],
            $name_files_arr['type'],
            $name_files_arr['size'],
            $temporary_folder_img,
            $base_folder_img,
            $update_table,
            $update_td_name,
            $update_td_id,
            $update_td_id_last_id_added
        );

        if(!$res_upload) return false;
        //if($res_upload) return true;
    }
}

//максимальная строка в бд
function maxParamInTable($tableName, $paramInTable){
    $query = "SELECT MAX({$paramInTable}) FROM {$tableName}";
    $res= Model_Driver::get_instance()->sqlQuery($query);
    if(!$res) return false;
    return $res[0]["MAX({$paramInTable})"];
}

//$searchParam_arr=['paramIntable'=>$paramSearch]
function updateParamInTable($table, $paramUpdateIntable_arr, $newParam_arr, $searchParam_arr){
    $res = Model_Driver::get_instance()->update($table, $paramUpdateIntable_arr, $newParam_arr,$searchParam_arr);
    if(!$res){ return false;}
    return $res;
}

//проверяем время акций
function checkTimeForStock(){
    //делаем запрос в бд на поиск активных акций
    $newArr=[];
    $res = Model_Driver::get_instance()->select(['*'],'stock', ['activation'=>1]);
    if($res){
        foreach ($res as $item){
            $newArr[$item['id']]=$item;
        }
        //подсчет времени акций
        foreach ($newArr as $item) {
            $finalTime = strtotime($item['end_time']) .PHP_EOL;
            $endTime = time().PHP_EOL;
            $interval = $finalTime-$endTime;
            if(($interval) <= 0){
                //поиск акционных товаров в таблице продуктов
                $res = findOneParam('products', 'id', $item['id']);
                if($res){
                    //очищаем запись
                    $res = updateParamInTable('products', ['stock_id'], ['0'], ['stock_id'=>$item['id']]);
                    if(!$res){
                        $err[]='err update stock info in products table!';
                    }else{
                        $success[] ='success update stock info in products table!';
                    }
                }
                //проверка id акции в таблице склад продукды
                $res = findOneParam('rel_warehouse_product', 'warehouse_stock', $item['id']);
                if($res){
                    //очищаем запись в таблице со складами
                    $res = updateParamInTable('rel_warehouse_product', ['warehouse_stock'], ['0'], ['warehouse_stock'=>$item['id']]);
                    if(!$res){
                        $err[]='err update stock info in rel_warehouse_product table!';
                    }else{
                        $success[] ='success update stock info in rel_warehouse_product table!';
                    }
                }
                //если есть ошибки выводим данные в админ панель
                if(!empty($err)){
                    $mess = implode('<br/>', $err);
                    return my_log($mess);
                }
                //после всех проверок аннулируем акцию
                $res = updateParamInTable('stock', ['activation'], ['0'],['id'=>$item['id']]);
                if(!$res){
                    $err[]='err update stock info in stock table!';
                    $mess = implode('<br/>', $err);
                }else{
                    $success[] ='success update stock info in stock table!';
                    $mess = implode('<br/>', $success);
                }
                return my_log($mess);
            }
        }
    }
    //debug_arr($newArr);
}

//запись логов
function my_log($string){
    $file_name = $_SERVER['DOCUMENT_ROOT']."/my_log.txt";
    $now = date("Y-m-d H:i:s");
    if(file_exists($file_name)){
        file_put_contents($file_name, $now." ".$string."\r\n", FILE_APPEND);
    }else{
        $fp = fopen ($_SERVER['DOCUMENT_ROOT']."/my_log.txt", "w");
        file_put_contents($file_name, $now." ".$string."\r\n", FILE_APPEND);
    }
}

//запись логов
function my_log_def($string){
    $file_name = $_SERVER['DOCUMENT_ROOT']."/my_log_def.txt";
    $now = date("Y-m-d H:i:s");
    if(file_exists($file_name)){
        file_put_contents($file_name, $now." ".$string."\r\n", FILE_APPEND);
    }else{
        $fp = fopen ($_SERVER['DOCUMENT_ROOT']."/my_log.txt", "w");
        file_put_contents($file_name, $now." ".$string."\r\n", FILE_APPEND);
    }
}

//проверка формата времени для создания акций на товар
//при некорректном значении возвращает + 1 день
function checkFormatTime($time){
    $time = date("Y-m-d H:i:s",strtotime(clear_string($time)));
    if(!$time){
        $time = date("Y-m-d H:i:s", time());
        $time = date('Y-m-d H:i:s', strtotime("$time + 1 day"));
        return $time;
    }
    //проверка с настоящим временем
    $finalTime = strtotime($time);
    $realTime = time();
    $spacing = $finalTime - $realTime;
    if($spacing <= 0){
        $time = date("Y-m-d H:i:s", time());
        $time = date('Y-m-d H:i:s', strtotime("$time + 1 day"));
        return $time;
    }
    return $time;
}

function checkRangeFormatDate($time){
    if(count($arr_time = explode("/", $time)) >= 2){
        $time_start = date("Y-m-d H:i:s",strtotime(clear_string($arr_time[0])));
        $time_end = date("Y-m-d H:i:s",strtotime(clear_string($arr_time[1])));
        if(!$time_start || !$time_end || $time_end<= $time_start){
            $time_start = date("Y-m-d 00:00:00",time());
            $time_end = date('Y-m-d 00:00:00', strtotime("$time_start + 1 day"));
        }
    }else{
        $time_start = date("1970-01-01 00:00:00",time());
        $time_end = date('Y-m-d 00:00:00', time());
    }
    return ['timeStart'=>$time_start, 'timeEnd'=>$time_end];
}

//Удаление фото или обновление
function deletePhotoFromTable($table, $tableId, $tableParam, $namePhoto, $savePath,$nameNoImage){
    $_SESSION['message']['error'] ='';
    $_SESSION['message']['success'] ='';
    $err=[];
    $success=[];

    //проверяем имя изображения, если это имя изобр. установленного по умолчанию возвращаем ошибку
    if (NOIMAGE == clear_string($namePhoto)){
        $err[]='This image not deleted!';
        $_SESSION['message']['error'] .= implode('\n', $err);
        $res = ['action_pages_mess'=>$_SESSION['message']['error']];
        return $res;
    }
    //найдено такое изображение или нет
    $res = Model_Driver::get_instance()->select(['*'], $table, ['id'=>$tableId, $tableParam=>clear_string($namePhoto)]);
    if(!$res[0]){
        $err[] = 'Err param for delete';
        $_SESSION['message']['error'] .= implode('\n', $err);
        return $res = ['action_pages_mess'=>$_SESSION['message']['error']];
    }

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

//удаление фото из папки по id из таблицы в бд
function delPhotoFromFolder($table, $tableId, $paramForTableId, $rowImgName, $savePath){
    $_SESSION['message']['error'] ='';
    $_SESSION['message']['success'] ='';
    $err=[];
    $success=[];

    //найдено такое изображение или нет
    $res = Model_Driver::get_instance()->select(['*'], $table, [$tableId=>$paramForTableId]);
    if(!$res[0]){
        $err[] = 'Err param for delete';
        $_SESSION['message']['error'] .= implode('\n', $err);
        return $res = ['action_pages_mess'=>$_SESSION['message']['error']];
    }

    //Удаление изображения
    $res = unlink($_SERVER['DOCUMENT_ROOT'] . $savePath . clear_string($res[0][$rowImgName]));
    if (!$res){
        $err[] = 'err delete img from table';
        $_SESSION['message']['error'] .= implode('\n', $err);
        $_SESSION['message']['success'] .= implode("\r\n", $success);
        $res = ['action_pages_mess'=>$_SESSION['message']['error'] . $_SESSION['message']['success']];
        return $res;
    }

    //Формируем сообщенеи об успешном выполнении операции
    $success[]='Image is deleted!';
    $_SESSION['message']['success'] .= implode("\r\n", $success);
    $res = ['action_pages_mess'=>$_SESSION['message']['success'], 'action_pages_res' => true];
    return $res;
}

function page_data_response($query){
    global $link;
    //echo $query;exit;
    $result = mysqli_query($link,$query);
    if(!$result) return false;
    $arr=[];
    while($row = mysqli_fetch_assoc($result)){
        $arr[]=$row;
    }
    return $arr;
}

function renameParam(array  $CheckArr, $CheckArrValue, array $newNameArr){
    $newArr =[];
    //code
    return $newArr;
}

function getAdminSettings(){
    $res = Model_Driver::get_instance()->select(['*'],'settings',[],'','',1);
    if(!$res) return false;
    return $res;
}

function getAdminSettingsStaticText(){
    $res = Model_Driver::get_instance()->select(['*'],'settings_statictext',[],'','',1);
    if(!$res) return false;
    return $res;
}
//Вывод наиболее продаваемых товаров
function getBestBuyProducts(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT p.* FROM `products` p INNER JOIN (SELECT product_id, SUM(qty_item) AS sumQtyItem FROM order_items
GROUP BY product_id ORDER BY sumQtyItem DESC LIMIT 4) as topQty ON p.id= topQty.product_id AND p.`mark_view`='1'");
    //return var_dump($res);
    if(!$res) return false;
    return ['products'=>'getBestBuyProducts','res'=>$res];
}
//Вывод наиболее просматриваемых товаров
function getBestViewProducts(){
    $res = Model_Driver::get_instance()->sqlQuery("SELECT p.* FROM `products` p WHERE p.`mark_view`='1' ORDER BY page_views DESC LIMIT 4");
    //return var_dump($res);
    if(!$res) return false;
    return ['products'=>'getBestViewProducts','res'=>$res];
}

function geoLocationIp(){
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

//доступные поставщики
function suppliers(){
    $res = Model_Driver::get_instance()->select(['*'], 'suppliers',['visible'=>'1']);
    if(!$res) return false;
    return $res;
}

//поставщики просматриваемого товара
function suppliersForOneProduct($pages_id){
    $query = "SELECT `suppliers`.*, `rel_suppliers_products`.id AS rel_suppliers_products_id, `rel_suppliers_products`.product_id, `rel_suppliers_products`.supplier_id FROM `suppliers` INNER JOIN `rel_suppliers_products` ON `suppliers`.supplier_id = `rel_suppliers_products`.supplier_id AND `suppliers`.visible = '1' AND `rel_suppliers_products`.product_id=$pages_id";
    $res = Model_Driver::get_instance()->sqlQuery($query);
    if(!$res) return false;
    return $res;
}

function get_token($code) {
    $ku = curl_init();
    $query = "client_id=".CLIENT_ID."&redirect_uri=".urlencode(REDIRECT)."&client_secret=".SECRET."&code=".$code;
    curl_setopt($ku,CURLOPT_URL,TOKEN."?".$query);
    curl_setopt($ku,CURLOPT_RETURNTRANSFER,TRUE);
    $result = curl_exec($ku);
    if(!$result) {
        //exit(curl_error($ku));
        header("Location: /");
        exit();
    }
    //return json_decode($result)->error->message;

    if(isset(json_decode($result)->error->message)) {
        header("Location: /");
        //exit(curl_error($ku));
        exit();
    } else {
        $result = json_decode($result);
        //parse_str($result,$token);
        //return (var_dump($result->access_token));
        if($result->access_token) {
            return $result->access_token;
        }
    }
}
//Данные от FACEBOOK
//    Array
//(
//    [name] => Roman Tihonenko
//    [first_name] => Roman
//    [last_name] => Tihonenko
//    [email] => pudzia009@gmail.com
//    [link] => https://www.facebook.com/app_scoped_user_id/1587769647943266/
//    [gender] => male
//    [locale] => ru_RU
//    [picture] => Array
//    (
//        [data] => Array
//        (
//            [height] => 50
//            [is_silhouette] =>
//            [url] => https://scontent.xx.fbcdn.net/v/t1.0-1/p50x50/12400865_921406827912888_3704611197822417414_n.jpg?oh=2d3011b03634ccf0209fe345f4cecafd&oe=5B0BBC60
//            [width] => 50
//          )
//    )
//    [id] => 1587769647943266
//)
function get_data($token) {
    $params = array('access_token' => $token);
    $userInfo = json_decode(file_get_contents(GET_DATA . '&' . urldecode(http_build_query($params))),true);
    if (!isset($userInfo['id']))  return false;
    //var_dump($userInfo);exit;
    return $userInfo;
}
//формирование редиректа с сообщением об неудачной операции
function redirectError($textError, $address){
    $_SESSION['message']['error'] = $textError;
    header("Location: {$address}");
    exit;
}
//формирование редиректа с сообщением об успешной операции
function redirectSuccess($textSuccess, $address){
    $_SESSION['message']['success'] = $textSuccess;
    header("Location: {$address}");
    exit;
}

// Проверяем наличие поставщика у выбранного продукта
function issetSuppliersForProduct($productId, $supplierId){
    $res = Model_Driver::get_instance()->select(['*'], 'rel_suppliers_products', ['supplier_id'=>$supplierId, 'product_id'=>$productId]);
    if(!$res) return false;
    return true;
}

//Доступен товар к покупке или нет('markAvaible')
function issetProductForBuy($productId){
    $res = Model_Driver::get_instance()->select(['*'], 'products', ['id'=>$productId, 'mark_available'=>'1']);
    if(!$res) return false;
    return true;
}

//проверим корзину на пустоту, если что возвращаем cart_id_product
function checkCartProductAvailableForUser($ipAddress, $cookie_key, $user_id = false){
    //если пользователь не авторизован
    $query = "SELECT cart_id_product FROM cart WHERE cart.cart_ip = '$ipAddress' AND cart.cookie_key = '$cookie_key'";
    //если пользователь авторизован
    $queryWIthUserId = "SELECT cart_id_product FROM cart WHERE cart.user_id = $user_id";
    $resQuery = $user_id ? $queryWIthUserId : $query;
    $res = Model_Driver::get_instance()->sqlQuery($resQuery);
    if(!$res) return false;
    $newArr = [];
    foreach ($res as $k=>$v){
        $newArr[] = $v['cart_id_product'];
    }
    return $newArr;
}

//Проверка доступности товара в корзине пользователя
function checkCartProductNotAvailableToBuyForUser($arrProductsId){
    if(!is_array($arrProductsId)) return false;
    $productsIdArrForDel = [];
    foreach ($arrProductsId as $item){
        $res = Model_Driver::get_instance()->select(['id'], 'products', ['id'=>$item, 'mark_available'=>'1']);
        if(!$res){
            $productsIdArrForDel[] = $item;
            continue;
        }
        continue;
    }
    if(!count($productsIdArrForDel)) return false;
    return $productsIdArrForDel;
}
//запись логов
function myLogError($string){
    $file_name = $_SERVER['DOCUMENT_ROOT']."/my_log_err.txt";
    $now = date("Y-m-d H:i:s");
    if(file_exists($file_name)){
        file_put_contents($file_name, $now." ".$string."\r\n", FILE_APPEND);
    }else{
        $fp = fopen ($_SERVER['DOCUMENT_ROOT']."/my_log_err.txt", "w");
        file_put_contents($file_name, $now." ".$string."\r\n", FILE_APPEND);
    }
}

//Удаление продукта из корзины юзера
function delProductsFromCartUser($arrProductsId,$ipAddress){
    if(!is_array($arrProductsId)) return false;
    $stringParamArr = implode(",",$arrProductsId);
    $query = "DELETE FROM cart WHERE cart_id_product IN($stringParamArr) AND cart_ip = '$ipAddress'";
    //var_dump($query); exit;
    $res = Model_Driver::get_instance()->sqlQuery($query, true);
    if(!$res) return false;
    return $res;
}

//Проверка на наличие добавляемого товара в корзине пользователя
function issetProductInCartUser($productId, $user_ip, $cookie_key = NULL, $user_id = NULL){
    $resCookieKey = Model_Driver::get_instance()->select(['*'], 'cart', ['cart_id_product'=>$productId, 'cart_ip'=>$user_ip, 'cookie_key'=>$cookie_key]);
    if($resCookieKey) return true;
    $resUserId = Model_Driver::get_instance()->select(['*'], 'cart', ['cart_id_product'=>$productId, 'cart_ip'=>$user_ip, 'user_id'=>$user_id]);
    if($resUserId) return true;
    return false;
}

function resSuppliersForProduct($productId, $suppliersId){
    $res = Model_Driver::get_instance()->select(['*'], 'rel_suppliers_products', ['product_id'=>$productId,'supplier_id'=>$suppliersId]);
    if(!$res) return false;
    return true;
}

function checkZipCode($zipcode){
    $zipcode = (int)$zipcode;
    $url = json_decode(file_get_contents("http://api.geonames.org/postalCodeSearchJSON?country=US&postalcode=$zipcode&maxRows=5&username=zupplybox.com"));
    if(count($url->postalCodes) == 0) return false;
    return $url->postalCodes[0];
}

function selectViewSuppliers($suppliersForOneProduct){
    $res = 'Information about suppliers is updated!';
    if(!is_array($suppliersForOneProduct)) return $res;
    $res = '<select name="suppliersProduct" id="suppliersProduct" class="suppliersProductSelect">';
    foreach ($suppliersForOneProduct as $item){
        $res .= '<option value="' . $item['supplier_id'] .'">' . $item['title'] .' ('. $item['state'] .')</option>';
    }
    $res .= '</select>';
    return $res;
}

function createCookieForBuyer(){
    $res = false;
    if(isset($_COOKIE['reg_buyer'])){
        //поиск по корзине с товарами подобного кода
        $res = Model_Driver::get_instance()->select(['cookie_key'], 'cart', ['cart_ip'=>$_SERVER['REMOTE_ADDR'], 'cookie_key'=>$_COOKIE['reg_buyer']]);
        //var_dump($res[0]['cookie_key']); exit;
        if($res[0]['cookie_key'] > null){
            return $_COOKIE['reg_buyer'];
        }else{
            $key = gen_code(12);
            setcookie('reg_buyer', $key, time()*3600, "/");
            return $key;
        }
    }else{
        $key = gen_code(12);
        setcookie('reg_buyer', $key, time()*3600, "/");
        return $key;
    }
}

function checkCookieForBuyerInShoppingCart($nameCookie, $ipAddress){
    if(isset($_COOKIE[$nameCookie])){
        $res = Model_Driver::get_instance()->sqlQuery("SELECT `cookie_key` FROM `cart` WHERE cart_ip = '{$ipAddress}' AND cookie_key = '{$_COOKIE[$nameCookie]}'");
        if(TRUE > $res) return false;
        return $res[0]['cookie_key'];
    }
    return false;
}

function updateCookiekeyForBuyerInShoppingCart($cookiekey, $ipAddress, $user_id){
    $res = Model_Driver::get_instance()->sqlQuery("UPDATE `cart` SET user_id={$user_id} WHERE cookie_key='{$cookiekey}' AND cart_ip='{$ipAddress}'", true);
    if(!$res) return false;
    return true;
}

function readCookieForBuyer($name, $key){
    if (isset($_COOKIE[$name])){
        return $_COOKIE[$name];
    }
    return false;

}







