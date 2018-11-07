<?php defined("CATALOG") or die("Access denied");

function order_list(){
    global $link;
    $result = mysqli_query($link, "SELECT * FROM cart, products WHERE cart.cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND products.id = cart.cart_id_product");

    if(mysqli_num_rows($result) > 0){
        $order_list=[];
        while($row = mysqli_fetch_assoc($result)){
            $order_list[] = $row;
        }
        //$order_list['total_qty'] = 0;//общее кол-во купленного товара
        //$order_list['total_sum'] = 0;//общая сумма купленного товара
        for($i = 0, $count = count($order_list); $i < $count; $i++ ){
            if (isset($order_list[$i]['price'])){
                $total_value = $order_list[$i]['price'] * $order_list[$i]['cart_count'];
                $order_list[$i]['total_value'] = $total_value;
                //$order_list['total_qty'] += $order_list[$i]['cart_count'];
                //$order_list['total_sum'] += $total_value;
            }
        }
        return  $order_list;
    } else{
        return false;
    }
}

function totalSumQtyArr($order_list){
    if(!is_array($order_list)) return false;
    $newArr = [];
    $newArr['total_qty'] = 0;//общее кол-во купленного товара
    $newArr['total_sum'] = 0;//общая сумма купленного товара
    for($i = 0, $count = count($order_list); $i < $count; $i++ ){
        if (isset($order_list[$i]['price'])){
            $total_value = $order_list[$i]['price'] * $order_list[$i]['cart_count'];
            $newArr['total_qty'] += $order_list[$i]['cart_count'];
            $newArr['total_sum'] += $total_value;
        }
    }
    return $newArr;
}



function rateCount($order_list_user, $total_sum_order, $total_qty_order, $fromZipCode, $ToZipCode){
    require __DIR__ . '/../vendor/autoload.php';
    $client = TaxJar\Client::withApiKey('c05327a17f5815075a192382b5584964'); // Useful for quick testing
    $new_arr= [];
    for($i = 0, $count = count($order_list_user); $i < $count; $i++){
        $new_arr[$i]['quantity'] = (int)$order_list_user[$i]['cart_count'];
        $new_arr[$i]['unit_price'] = (int)$order_list_user[$i]['price'];
    }
    $resZip = checkZipCode($ToZipCode);
    $tax = $client->taxForOrder(
        [
            'from_country' => 'US',
            'from_zip' => '94111',
            'from_state' => 'CA',
            'from_city' => 'San Francisco',
            'from_street' => '',
            'to_country' => 'US',
            'to_zip' => $resZip->postalCode,
            'to_state' => $resZip->adminCode1,
            'to_city' => $resZip->placeName,
            'to_street' => '',
            'amount' => $total_sum_order,
            'shipping' => 0,
            'line_items' => $new_arr
        ]);
    return $tax->rate;

}

function order_list_recalc($id, $param, $quantity=''){
    $id = clear_string($id);
    $param = clear_string($param);
    global $link;
    $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
    if (mysqli_num_rows($result) > 0){
        if($param == 'clear'){
            $result = mysqli_query($link, "DELETE FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}");
            if($result){
                echo json_encode('true'); exit;
            }
        }

        if($param == 'delete'){
            $result = mysqli_query($link, "DELETE FROM cart WHERE cart_id = '$id' AND cart_ip = '{$_SERVER['REMOTE_ADDR']}'");
            if($result){
                echo json_encode('true'); exit;
            }
        }

        if($param == 'plus'){

            global $link;
            $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
            if (mysqli_num_rows($result) > 0)
            {
                $row = mysqli_fetch_array($result);
                $new_count = $row["cart_count"] + 1;

                $update = mysqli_query($link, "UPDATE cart SET cart_count='$new_count', cart_datetime = NOW() WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id ='$id'");

                if($update){ echo $new_count; exit;}
                else{ echo "Ошибка прибавления товара";}
            }
        }

        if($param == 'minus'){

            global $link;
            $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
            if (mysqli_num_rows($result) > 0)
            {
                $row = mysqli_fetch_array($result);
                $cart_count = (int)$row["cart_count"];

                if( $cart_count < 2 ){
                    echo $cart_count; exit;
                }
                $new_count =  $cart_count - 1;

                $update = mysqli_query($link, "UPDATE cart SET cart_count='$new_count', cart_datetime = NOW() WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id ='$id'");

                if($update){ echo $new_count; exit;}
                else{ echo "Ошибка при уменьшении товара в корзине";}
            }
        }

        if($param == 'quantity'){
            $old_count='';

            global $link;
            $result = mysqli_query($link, "SELECT * FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id = '$id'");
            if (mysqli_num_rows($result) > 0)
            {
                $quantity = (int)$quantity;
                $row = mysqli_fetch_array($result);
                $old_count = (int)$row["cart_count"];

                if($quantity > 0 && $quantity < 99){

                    $update = mysqli_query($link, "UPDATE cart SET cart_count='$quantity', cart_datetime = NOW() WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' AND cart_id ='$id'");
                    if($update){echo $quantity; exit();}else{echo 'Ошибка обновления колличества товара';exit();}

                }else{
                    echo $old_count; exit();
                }

            }
        }

        if($param == 'related_аdditions_del'){
            //удаляем из корзины дополнительный сервис добавленный клиентом
            echo json_encode('true');exit();
            global $link;
            $result = mysqli_query($link, "DELETE FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' and cart_id = '$id' ");

            if($result){
                echo json_encode('true');exit();
            }
            echo json_encode('false'); exit();
        }

        if($param == 'related_аdditions_add'){
            //удаляем из корзины дополнительный сервис добавленный клиентом
            var_dump($param);exit;
            echo json_encode('true');exit;
            global $link;
            $result = mysqli_query($link, "DELETE FROM cart WHERE cart_ip = '{$_SERVER['REMOTE_ADDR']}' and cart_id = '$id' ");

            if($result){
                echo json_encode('true');exit();
            }
            echo json_encode('false'); exit();
        }

    } else{ return false; }


}

