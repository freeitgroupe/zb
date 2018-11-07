<?php
defined("CATALOG") or die("Access denied");
if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'yes_auth') {
    require_once "controllers/main_controller.php";
    require_once "controllers/lk_controller.php";
    require_once "controllers/wishlist_controller.php";
    require_once "models/{$view}_model.php";

    //Заголовки
    $title_header .= 'Wishlist - ' . $_SESSION['auth_name'];
    $description_header .= strip_tags(str_replace("\"","&quot;", 'Wishlist'));
    $keywords_header .= strip_tags(str_replace("\"","&quot;", 'Wishlist'));

    //id пользователя
    $id = (int)$_SESSION['auth_id'];
    //Данные о листах желаний пользователя
    $wishlist_user = wishlist_user($id);

    //Заполненные листы желания + товары
    $wishlist_user_product = wishlist_user_product($id);

    //Формируем наименование аполненных листов желаний с ключом массива [empty]='none'
    $wishListUserZeroProduct = wishListUserZeroProduct($wishlist_user, $wishlist_user_product);
    //debug_arr($wishlist_user_product);
    //debug_arr($wishlist_user);

    //Орабатіваем пост данные на редактирование  листа желаний
    if(isset($_POST['wishlist_name']) && $_POST['edit_wishlist_id'] && ($_POST['submit'] == 'edit_wishlist')){

        $wishlist_new_name =clear_string($_POST['wishlist_name']);
        $edit_wishlist_id = (int)$_POST['edit_wishlist_id'];


        if (strlen($wishlist_new_name) < 3 || strlen($wishlist_new_name) > 40)
            exit(json_encode(['wishlist_mess'=>'Enter a name between 3 and 40 characters!']));

        //проверка id товара
        if(!$edit_wishlist_id)
            exit(json_encode(['wishlist_mess'=>'An error occurred while editing the wish list!']));

        $edit_wishlist_edit_res = edit_wishlist_edit_res($wishlist_new_name, $edit_wishlist_id, $id);

        if (!$edit_wishlist_edit_res)
            exit(json_encode(['wishlist_mess'=>'Error updating data!']));

        exit(json_encode(['wishlist_mess'=>'Data successfully updated!', 'wishlist_new_name'=>$wishlist_new_name]));

    }

    //Данные при удаление листа желаний
    //Орабатіваем пост данные на удаление листа желаний
    if(isset($_POST['delete_wishlist_id']) && ($_POST['submit'] == 'delete_wishlist')){

        $delete_wishlist_id = (int)$_POST['delete_wishlist_id'];
        if(!$delete_wishlist_id)
            exit(json_encode(['wishlist_mess'=>'Error while deleting! Error data!']));

        $delete_wishlist_id_res = delete_wishlist_id_res($delete_wishlist_id, $id);
        if(!$delete_wishlist_id_res)
            exit(json_encode(['wishlist_mess'=>'Error while deleting!']));

        exit(json_encode(['wishlist_mess'=>'Wish list has been deleted!', 'wishlist_res'=>'true']));
    }

    //Данные при удаление листа желаний
    //Орабатіваем пост данные на удаление продукта из листа желаний
    if(isset($_POST['delete_wishlist_product_id']) && ($_POST['submit'] == 'delete_wishlist_product')){
        $product_id =  (int)$_POST['delete_wishlist_product_id'];
        if(!$product_id)
            exit(json_encode(['wishlist_mess'=>'Error while searching for a product!']));

        //Удаление продукта
        $delete_wishlist_product_id = delete_wishlist_product_id($product_id, $id);
        if(!$delete_wishlist_product_id)
            exit(json_encode(['wishlist_mess'=>'Error while deleting product!']));

        exit(json_encode(['wishlist_mess'=>'The product has been removed from the wish list!', 'wishlist_res'=>'true']));

    }


    require_once "views/office/{$view}.php";
} else{header("Location: /");}
