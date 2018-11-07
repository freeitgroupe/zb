<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!$_POST) header("Location:" . PATH);
//->если такой ip и продукт добавлен, тогда не требуем выбирать поставщика так как он уже выбран, автоматом добавляем продукт в корзину пользователя
if(array_key_exists('param', $_POST) && ($_POST['param'] != '{}') && ($_POST['param_action'] == 'add_product'))
{
    //if(!safePostAjaxRequest()) return false;
    $param = json_decode($_POST['param']);
    $id = (int)$param->{'id'};

    //Идентификатор для куки
    $cookie_key = createCookieForBuyer();

    //id для пользователя
    $user_id = isset($_SESSION['auth_id']) ? $_SESSION['auth_id'] : 'NULL';

    //проверить доступен ли товар к покупке
    if(!issetProductForBuy($id)) exit(json_encode('false'));

    //Поставщики товара
    $suppliersForOneProduct = suppliersForOneProduct($id);
    //вывод поставвщиков в модальное окно
    $selectViewSuppliers = selectViewSuppliers($suppliersForOneProduct);

    //Есть ли данный товар в корзине пользователя
    if(issetProductInCartUser($id, $_SERVER['REMOTE_ADDR'], $cookie_key, $user_id)){
        //Если есть, обновляем данные о количестве товара
        if(!updateCountProductInCart($id, $_SERVER['REMOTE_ADDR'], '1',$cookie_key, $user_id)) exit(json_encode('false'));
        exit(json_encode('true'));
    }

    //Если нет добавляем товар и поставщика в корзину пользователя
    //Выдаем попап окно пользователю на выбор поставщика
    if($_POST['param_suppliers'] == 'false'){
        exit(json_encode( ['choice_product_id'=>$id, 'mess'=>'supplierChoice', 'supplierView'=>$selectViewSuppliers]));
    }

    //проверяем данные с попап окна
    $suppliersId = $_POST['param_suppliers'];
    $resSuppliersForProduct = resSuppliersForProduct($id, $suppliersId);
    if(!$resSuppliersForProduct) exit(json_encode('false'));

    //Добавляем товар в корзину
    $add_to_cart_product = add_to_cart_product($id, $suppliersId);
    if(!$add_to_cart_product) exit(json_encode('false'));
    exit(json_encode('true'));
}

//Обрабатываем запрос от аякса на результат для корзины кол-во, сумма товара
if(array_key_exists('param_res', $_POST))
{
    //
    $resCookie = checkCookieForBuyerInShoppingCart('reg_buyer', $_SERVER['REMOTE_ADDR']);
    $user_id = isset($_SESSION['auth_id']) ? $_SESSION['auth_id'] : false;

    //проверим корзину на пустоту, если пусто возвращаем ноль, иначе возвращаем массив с id товаров из корзины
    $checkCartProductAvailableForUser = checkCartProductAvailableForUser($_SERVER['REMOTE_ADDR'], $resCookie, $user_id);
    if(!$checkCartProductAvailableForUser) exit(json_encode('0'));

    //проверяем какие продукты в корзине пользователя больше не доступны и удаляем их в список ожидаемых продуктов
    $checkCartProductNotAvailableToBuyForUser = checkCartProductNotAvailableToBuyForUser($checkCartProductAvailableForUser);

    //Если такие продукты найдены удаляем их
    if($checkCartProductNotAvailableToBuyForUser){
        $delProductsFromCartUser = delProductsFromCartUser($checkCartProductNotAvailableToBuyForUser, $_SERVER['REMOTE_ADDR']);
        if(!$delProductsFromCartUser){
            myLogError('Error deleting data from user\'s trash with ipadreess:' . $_SERVER['REMOTE_ADDR']);
        }
    }

    //Возвращаем информацию о корзине товаров
    $cart_info = cart_info();
    if(!$cart_info)
        exit(json_encode('false'));
    exit($cart_info);
}

//удаление товара из корзины
if((key_exists('param', $_POST) && key_exists('param_action', $_POST)) || key_exists('param_quantity', $_POST))
{
    //if(!safePostAjaxRequest()) return false;
    $param ='';
    $param_action='';
    $param_quantity='';
    $quantity='';

    $param = json_decode($_POST['param']);
    $param_action = json_decode($_POST['param_action']);

    if(key_exists('param_quantity', $_POST))
    {
        $param_quantity = json_decode($_POST['param_quantity']);
        $quantity = $param_quantity->{'quantity'};
    }

    $id = (int)$param->{'id'};
    $param_action = $param_action->{'action'};

    //var_dump( $param_action);exit;
    if($id > 0)
    {
        $order_list_recalc = order_list_recalc($id, $param_action, $quantity);
    }

}
