<?php defined("CATALOG") or die("Access denied");
require_once 'header.php';
?>
<div class="emraceFull">
    <div class="embrace clear indexPage">
        <!-- choice if the day -->
        <div class="choiceIndex clear">
            <div class="choiceLoop clear">
                <div class="breadCrumbs clear">
                    <?=$breadcrumbsPage?>
                </div>
                <div id="content-product">
                    <?=htmlspecialchars_decode($page['text'])?>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="semanticBox clear"></div>
    </div>
</div>

<!-- main page content end -->
<?php require_once 'footer.php';?>
