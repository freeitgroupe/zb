<?php
defined("CATALOG") or die("Access denied");
//Get payment information from PayPal
$txn_id = $_GET['tx'];
$payment_gross = $_GET['amt'];
$currency_code = $_GET['cc'];
$payment_status = $_GET['st'];
//debug_arr($_POST);
//debug_arr($_GET);
//exit;
if(!empty($txn_id)){
    //Check if payment data exists with the same TXN ID.
    //$paymentResult = $db->query("SELECT * FROM payments WHERE txn_id = '".$txn_id."'");
    $paymentResult = findOneParam('payments','txn_id', $txn_id);
    if($paymentResult > 0){
        //payment information
        $paymentRow = $paymentResult;
        $payment_id = $paymentRow['payment_id'];

        //order items details
        $orderItemResult = Model_Driver::get_instance()->sqlQuery("SELECT p.title, i.quantity, i.gross_amount FROM order_items_paypal as i LEFT JOIN products as p ON p.id = i.item_number WHERE payment_id = '".$payment_id."'");
        ?>
        <h1>Your payment has been successful.</h1>
        <h2>Payment ID: <?php echo $payment_id; ?></h2>
        <h2>Payment Gross: <?php echo '$'.$paymentRow['payment_gross'].' '.$paymentRow['currency_code']; ?></h2>
        <?php if($orderItemResult > 0){ ?>
            <h3>Order Items</h3>
            <table style="width:50%">
                <tr>
                    <th>#</th>
                    <th>Product Name</th>
                    <th>Quantity</th>
                    <th>Gross Amount</th>
                </tr>
                <?php $i=0; while($item = $orderItemResult){ $i++; ?>
                    <tr>
                        <td align="center"><?php echo $i; ?></td>
                        <td align="center"><?php echo $item['name']; ?></td>
                        <td align="center"><?php echo $item['quantity']; ?></td>
                        <td align="center"><?php echo '$'.$item['gross_amount'].' '.$paymentRow['currency_code']; ?></td>
                    </tr>
                <?php } ?>
            </table>
        <?php } ?>

    <?php }else{ ?>
        <h1>Your payment has been successful.</h1>
        <h2>TXN ID: <?php echo $txn_id; ?></h2>
        <h2>Payment Gross: <?php echo '$'.$payment_gross.' '.$currency_code; ?></h2>
    <?php } }else{ ?>
    <h1>Your payment has failed.</h1>
<?php } ?>
<a href="#">Back to products</a>