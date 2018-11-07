<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
    <div class="contentBox clear">
        <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
            <h2>Update stock<i class="icons">add</i></h2>
            <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Main</h3>
                    <input class="bottom" type="text" placeholder="Stock name" name="title" value="<?=$stockInfo['title']?>">
                    <input class="bottom" type="datetime-local" placeholder="End date" name="end_time" value="<?php echo date('Y-m-d\TH:i:s', strtotime($stockInfo['end_time'])); ?>">
                    <input class="bottom" type="text" placeholder="Short lood description" name="mini_description" value="<?=$stockInfo['mini_description']?>">
                    <h3>Activation</h3>
                    <select class="bottom" name="activation">
                        <option value="1" <?php if($stockInfo['activation']==1){echo 'selected';}?>>enabled</option>
                        <option value="0" <?php if($stockInfo['activation']==0){echo 'selected';}?>>disabled</option>
                    </select>
                </div>
                <div class="boxTwoThirds">
                    <h3>Stock page description</h3>
                    <textarea name="description"><?=$stockInfo['description']?></textarea>
                </div>
            </div>
            <div class="fist clear">
                <div class="boxOneThird">
                    <h3>Stock page image</h3>
                    <div class="gallery-block pg-<?=str_replace('.','_',$stockInfo['stock_img'])?>">
                    <span class="trigger btn-delete-img toggle-fl-icon-delete" data-name-file="<?=$stockInfo['stock_img']?>" data-page="<?=$stockInfo['id']?>" data-toggle="modal" data-target="#modal-pages-action" >
                        <i class="">X</i>
                    </span>
                    <img class="" src="<?=STOCK_IMG . $stockInfo['stock_img']?>" width="100">
                    </div>
                    <div>
                        <input type="file" name="img">
                    </div>
                </div>
                <div class="boxOneThird">
                    <h3>Loop thumbnail</h3>
                    <div class="gallery-block pg-<?=str_replace('.','_',$stockInfo['stock_thumbnail'])?>">
                    <span class="trigger btn-delete-thumbnail toggle-fl-icon-delete" data-name-file="<?=$stockInfo['stock_thumbnail']?>" data-page="<?=$stockInfo['id']?>" data-toggle="modal" data-target="#modal-pages-action" >
                        <i class="">X</i>
                    </span>
                    <img class="" src="<?=STOCK_THUMBNAIL_IMG . $stockInfo['stock_thumbnail']?>" width="50">
                    </div>

                    <div>
                        <input type="file" name="thumbnail">
                    </div>
                </div>
            </div>
            <input class="fat" type="submit" value="Update stock" name="edit_stock">
        </form>
    </div>

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>