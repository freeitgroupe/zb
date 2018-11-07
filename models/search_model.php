<?php defined("CATALOG") or die("Access denied");

//возвращаем категории для поиска
function category_for_search($category_search){
    //проверка параметра категории
    $category_search = clear_string($category_search);
    if((int)$category_search == 0)
    {
       return '';
    }

    //проверка существования категории в бд
    $test_category = findOneParam('category','id', $category_search);
    if($test_category > false)
    {
        // ID дочерних категорий
        $id = $category_search;
        $ids_cat_search = cats_id(get_category(),$id);

        //Дочернии категории + выбранная категория
        $ids_cat_search = !$ids_cat_search ? $id : $ids_cat_search . $id ;
        return $ids_cat_search;
    }
}

//поиск по сайту
function search_autocomplete($category_search=''){
    $search = clear_string($_GET['term']);

    global $link;
    if(isset($category_search) && $category_search > '')
        {
            $query = "SELECT title FROM products WHERE title LIKE '%{$search}%' AND `category_id` IN ($category_search) LIMIT 15";
        }
    else
        {
            $query = "SELECT title FROM products WHERE title LIKE '%{$search}%' LIMIT 15";
        }
    $result = mysqli_query($link, $query);

    $res_arr = [];
    while($row = mysqli_fetch_assoc($result)){
        $res_arr[] = $row['title'];
    }
    return $res_arr;
}

//подрузка товара при нажатии на кнопку refresh
function product_search_response($category_search,$text_search,$num_page_product=''){

    //параметры поиска
    $text_search = clear_string($text_search);

    //Формирование запросов в бд
    if($category_search <= 0)
    {
        $query = "SELECT * FROM `products` WHERE mark_view = '1' AND title LIKE '%{$text_search}%'";
        if($num_page_product > '')
        {
            $query .=" LIMIT " . $num_page_product."," . PERPAGE;
        }
        else
        {
            $query .=" LIMIT ". PERPAGE;
        }
    }
    else
    {
        $query = "SELECT * FROM `products` WHERE mark_view = '1' AND title LIKE '%{$text_search}%' AND category_id IN ($category_search)";
        if($num_page_product > '')
        {
            $query .=" LIMIT " . $num_page_product."," . PERPAGE;
        }
        else
        {
            $query .=" LIMIT ". PERPAGE;
        }
    }
    global $link;
    $result = mysqli_query($link,$query);
    //echo  $query;
    //var_dump($result); exit;

    if(!$result) return false;
    $arr=[];
    while($row = mysqli_fetch_assoc($result)){
        $arr[]=$row;
    }
    return $arr;
}

/**
 * кол-во результатов поиска
 **/
function count_search(){
    global $link;
    $search = clear_string($_GET['search']);
    $category_search = clear_string($_GET['category']);
    $result = mysqli_query($link,"SELECT COUNT(*) FROM products WHERE title LIKE '%{$search}%'");
    $count_search = mysqli_fetch_row($result);
    return $count_search[0];
}

//

/**
 * поиск
 **/
function search($start_pos, $perpage){
    global $link;
    $search = clear_string($_GET['search']);
    $result = mysqli_query($link,"SELECT * FROM products WHERE title LIKE '%{$search}%' LIMIT $start_pos, $perpage");
    if( !mysqli_num_rows($result) ){
        return 'Ничего не найдено';
    }

    $result_search = [];
    while($row = mysqli_fetch_assoc($result)){
        $result_search[] = $row;
    }
    return $result_search;
}
