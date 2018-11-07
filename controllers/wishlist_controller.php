<?php
require_once "{$_SERVER['DOCUMENT_ROOT']}/models/wishlist_model.php";
defined("CATALOG") or die("Access denied");

if(isset($_SESSION['auth']) && $_SESSION['auth'] =='yes_auth'){
    $id = (int)$_SESSION['auth_id'];
    //Данные о листах желаний
    $wishlist_user = wishlist_user($id);
    //var_dump($wishlist_user);

    //Данные о кол-ве товара в листах желаний
    $countProdInWishList = countProdInWishList($id);
    //debug_arr($wishlist_user);
    if(isset($_POST['param_post']) && $_POST['param_post'] == 'loadWishlist' ){
        echo json_encode($countProdInWishList); exit;
    }
    //обрабатываем пост данные при добавлении товара в избранное
    if(isset($_POST['optionsWishlist'])){

        //При запросе на одновременное создание листа желаний и добавления в него продукта
        if($_POST['optionsWishlist'] == 'new' && $_POST['product_id']){

            $name_wishlist = clear_string($_POST['new_wishlist']);
            if (strlen( $name_wishlist) < 3 || strlen($name_wishlist) > 50)
                exit(json_encode(['wishlist_mess'=>'Enter a name between 3 and 50 characters!']));

            $product_id = (int)$_POST['product_id'];
            if (!$product_id) exit('Error added product!');

            //проверяем существование продукта
            $product_res = findOneProduct($product_id);
            if(!$product_res)
                exit(json_encode(['wishlist_mess'=>'Error while adding product data!']));

            //проверяем есть ли данный продукт в листе желаний
            $product_wish = findOneProductInWishusers($product_id, $id);
            if($product_wish)
                exit(json_encode(['wishlist_mess'=>'This product has already been added!']));

            //создаем новый лист желаний для пользователя и возвращаем последний добавленный id
            $created_new_wishlist = created_new_wish_list($name_wishlist,  $id);
            if(!$created_new_wishlist)
                exit(json_encode(['wishlist_mess'=>'Error creating wishlist!']));

            //добавляем товар в лист желаний юзера
            $created_new_wish_users = created_new_wish_users($created_new_wishlist, $id, $product_id);
            if(!$created_new_wishlist)
                exit(json_encode(['wishlist_mess'=>'Error adding item to wishlist!']));

            //если товар добавлен, возвращаем количество товаров в листе желаний
            if($created_new_wish_users);

            //достаем данные о новом листе желаний
            $wishlist_user = wishlist_user($id);
            exit(json_encode(['wishlist_user'=>$wishlist_user]));
        }

        //Добавление продукта в существующий лист желаний
        if($_POST['optionsWishlist'] != 'new' && $_POST['product_id'] && $_POST['optionsWishlist'] > 0){

            //Формируем постданные
            $id_wishlist = (int)$_POST['optionsWishlist'];
            if(!$id_wishlist)
                exit(json_encode(['wishlist_mess'=>'An error occurred while viewing the wishlist!']));

            $product_id  = (int)$_POST['product_id'];
            if (!$product_id)
                exit(json_encode(['wishlist_mess'=>'Error adding product! Product not found!']));

            //Есть ли продукт в листе желаний
            $product_wish = findOneProductInWishusers($product_id, $id);
            if($product_wish)
                exit(json_encode(['wishlist_mess'=>'This product has already been added!']));

            //добавляем товар в лист желаний юзера
            $created_new_wish_users = created_new_wish_users($id_wishlist, $id, $product_id);
            if(!$created_new_wish_users)
                exit(json_encode(['wishlist_mess'=>'Error adding product to wishlist!']));

            if($created_new_wish_users)
                exit(json_encode(['wishlist_mess'=>'Product successfully added!']));
        }

        //Удаление листа желаний в лк пользователя
        if($_POST['optionsWishlist'] != 'new' && $_POST['product_id'] && $_POST['optionsWishlist'] > 0){

            //id листа желаний
            $id_wishlist = (int)$_POST['optionsWishlist'];
            if(!$id_wishlist)
                exit(json_encode(['wishlist_mess'=>'An error occurred while viewing the wishlist!']));

            $product_id  = (int)$_POST['product_id'];
            if (!$product_id)
                exit(json_encode(['wishlist_mess'=>'Error adding product! Product not found!']));

            //удаляем лист желаний юзера
            $deleted_wishlist = deleted_wishlist($id_wishlist, $id, $product_id);
            if(!$deleted_wishlist)
                exit(json_encode(['wishlist_mess'=>'Error while deleting wishlist!']));

            if($deleted_wishlist)
                exit(json_encode(['wishlist_mess'=>'Wishlist deleted!']));

        }
    }
}
