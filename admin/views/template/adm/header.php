<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title></title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
<!--    <link rel="stylesheet" href="include/bower_components/bootstrap/dist/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="<?=PATH_ADMIN?>css/main.css">
    <link rel="stylesheet" type="text/css" href="<?=PATH_ADMIN?>css/the-modal.css" media="all">
    <link rel="stylesheet" type="text/css" href="<?=PATH_ADMIN?>css/font-awesome.css" media="all">
    <link href="<?=PATH_ADMIN?>lib/datepicker/css/datepicker.min.css" rel="stylesheet" type="text/css">
    <script src="../../js/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<?=PATH_ADMIN?>js/jquery.the-modal.js"></script>
    <script type="text/javascript" src="<?=PATH_ADMIN?>js/accounting.js"></script>
    <script type="text/javascript" src="<?=PATH_ADMIN?>lib/datepicker/js/datepicker.min.js"></script>
    <style>
        .err_adm{
            color: #ff0f00!important;
        }
        .gallery-block{
            display:inline-block;
        }
    </style>
</head>
<body>
<div class="embrace clear">
    <header class="clear">
        <div class="fucntionalPanel left">
            <select name="navigation" id="nav" class="nav-header-menu nav ">
                <?php if($menu_admin > FALSE):?>
                    <?php foreach ($menu_admin as $item):?>
                        <option value="<?=PATH_ADMIN . $item['alias']?>" <?php if(stristr($_SERVER['REQUEST_URI'], $item['alias']) > false){ print 'selected';}?>><?= $item['title']?></option>
                    <?php endforeach;?>
                <?php endif;?>
            </select>
            <i class="icons">fingerprint</i>
        </div>
        <div class="secureLabel right">Logged as admin <a href="/logout" id="logout" data-event-user="logout"><i class="icons">input</i></a></div>
        <div class="secureLabel right"><i class="icons">lock</i>OverTrust Secure</div>
    </header>
    <div class="navigationEmbrace bg clear left">
        <div class="workArea">
            <div class="maximize" id="maximize"></div>
            <div class="minimize" id="minimize"></div>
        </div>
        <div class="navigationBox">
            <div class="boxUnit">
                <a href="#"><div class="listName">Console</div></a>
            </div>
        </div>
        <div class="navigationBox">
            <div class="boxUnit">
                <a href="#"><div class="listName">Pages</div></a>
            </div>
        </div>
        <div class="navigationBox">
            <div class="boxUnit">
                <a href="#"><div class="listName">Pages</div></a>
            </div>
        </div>
    </div>
    <div class="content clear">
<!--        <div class="contentBox clear">-->
<!--            <nav class="pageNav clear">-->
<!--                <ul>-->
<!--                    <a href="/admin/product-options"><i class="icons">home</i><li>Products</li></a>-->
<!--                    <a href="/admin/edit-product/new"><i class="icons">queue</i><li>Add new</li></a>-->
<!--                    <a href="/admin/category-product-options/"><i class="icons">content_paste</i><li>Category</li></a>-->
<!--                    <a href="/admin/edit-category-product/new"><i class="icons">queue</i><li>Add new</li></a>-->
<!--                    <a href="/admin/warehouse-options/"><i class="icons">storage</i><li>Warehouse</li></a>-->
<!--                    <a href="/admin/edit-warehouse/new"><i class="icons">queue</i><li>Add new</li></a>-->
<!--<!--                    <a href="productsupsell.html"><i class="icons">local_mall</i><li>Upsell</li></a>-->
<!--<!--                    <a href="productstock.html"><i class="icons">local_play</i><li>Stock</li></a>-->
<!--                </ul>-->
<!--            </nav>-->
<!--        </div>-->
<!--        <div class="contentBox clear">-->
<!--            <nav class="pageNav clear">-->
<!--                <ul>-->
<!--<!--                    <a href="productscat.html"><i class="icons">content_paste</i><li>Categories</li></a>-->
<!--<!--                    <a href="productsimport.html"><i class="icons">play_for_work</i><li>CSV import</li></a>-->
<!--<!--                    <a href="productsfields.html"><i class="icons">settings_applications</i><li>Product fields</li></a>-->
<!--                </ul>-->
<!--            </nav>-->
<!--        </div>-->
<?= isset($_SESSION['message']['error']) ? $_SESSION['message']['error']:'';?>
<?= isset($_SESSION['message']['success']) ? $_SESSION['message']['success'] : ''?>