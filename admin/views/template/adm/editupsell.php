<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
    <div class="contentBox clear">
        <?php if($OneProductForUpsell):?>
        <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
            <h2>Edit upsell unit #<?=$OneProductForUpsell['title']?><i class="icons">directions</i></h2>
            <div class="fist clear">
                <div class="boxHalf" style="position: relative">
                    <input hidden class="bottom" name="product_id" value="<?=$OneProductForUpsell['product_id']?>"/>

                    <input type="text" name="default_price" value="<?=$OneProductForUpsell['default_price']?>" class="bottom suggesstion-prices" placeholder="default price">
                    <input type="text" name="upsell_price" value="<?=$OneProductForUpsell['upsell_price']?>" placeholder="upsell price">
                </div>
            </div>
            <input type="submit" name="upsell_confirm" value="Add rule" class="fat suggesstion-prices"/>
        </form>
    <?php endif;?>
    </div>

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>