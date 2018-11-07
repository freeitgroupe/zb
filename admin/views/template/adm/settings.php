<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topSettingsMenu.php'?>
<!-- Content Wrapper. Contains page content -->
<form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
    <div class="contentBox clear">
        <h2>Main settings<i class="icons">settings_applications</i></h2>
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Site name</h3>
                <input class="bottom" type="text" placeholder="Site name" name="titleSite" value="<?=$getAdminSettings['titleSite']?>">
                <input class="bottom" type="text" placeholder="Description for site" name="descriptionSite" value="<?=$getAdminSettings['descriptionSite']?>">
                <input type="text" placeholder="Title for home page" name="titleHome" value="<?=$getAdminSettings['titleHome']?>">
            </div>
            <div class="boxOneThird">
                <h3>Description for Home page</h3>
                <textarea placeholder="Enter seo text" name="descriptionHome"><?=$getAdminSettings['descriptionHome']?></textarea>
            </div>
            <div class="boxOneThird">
                <h3>Analytics</h3>
                <input type="text" class="bottom" placeholder="Google Analytics" name="googleCode" value="<?=$getAdminSettings['googleCode']?>">
                <h3>Minimal sum for cart</h3>
                <input type="text" class="bottom" placeholder="Min. sum for cart" name="minSumCart" value="<?=$getAdminSettings['minSumCart']?>">
                <h3>Email</h3>
                <input type="text" class="bottom" placeholder="Email" name="email" value="<?=$getAdminSettings['email']?>">
                <h3>Phone</h3>
                <input type="text" placeholder="Phone" name="phone" value="<?=$getAdminSettings['phone']?>">
            </div>
        </div>
    </div>
    <div class="contentBox clear">
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Comments</h3>
                <div class="radioBox">
                    <p>
                        <input id="r1" name="permissionComments" type="radio" value="1" <?=$getAdminSettings['permissionComments'] == 1? 'checked':''?>>
                        <label for="r1"> <span></span> Allow </label>
                    </p>
                    <p>
                        <input id="r2" name="permissionComments" type="radio" value="0" <?=$getAdminSettings['permissionComments'] == 0? 'checked':''?>>
                        <label for="r2"> <span></span> Disallow </label>
                    </p>
                </div>
            </div>
<!--            <div class="boxOneThird">-->
<!--                <h3>Comments avatar</h3>-->
<!--                <div class="radioBox">-->
<!--                    <p>-->
<!--                        <input id="r3" name="avatars" type="radio">-->
<!--                        <label for="r3"> <span></span> Show </label>-->
<!--                    </p>-->
<!--                    <p>-->
<!--                        <input id="r4" name="avatars" type="radio">-->
<!--                        <label for="r4"> <span></span> Hide </label>-->
<!--                    </p>-->
<!--                </div>-->
<!--            </div>-->
        </div>
    </div>
    <div class="contentBox clear">
        <input class="fat" type="submit" value="Save settings" name="editSettings">
    </div>
</form>
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <div class="contentBox clear">
            <div class="fist clear">
                <div class="clear">
                    <h3>Content for home page</h3>
                    <script src="<?=PATH_ADMIN?>js/ckeditor/ckeditor.js"></script>
                    <textarea placeholder="Fill page content" id="editor1" name="contentHomePage"><?=$getAdminSettings['contentHomePage']?></textarea>
                    <script>
                        CKEDITOR.replace('editor1');
                    </script>
                </div>
            </div>
        </div>
        <div class="contentBox clear">
            <input class="fat" type="submit" value="Save settings" name="editHomeContent">
        </div>
    </form>

    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <div class="contentBox clear">
            <h2>Slider settings<i class="icons">settings_applications</i></h2>
            <div class="fist clear">
                <script src="<?=PATH_ADMIN?>js/ckeditor/ckeditor.js"></script>
                <textarea placeholder="Description for slider"  id="editor2" name="description"><?=htmlspecialchars_decode($getAdminSettingsSlider['description'])?></textarea>
                <script>
                    CKEDITOR.replace('editor2');
                </script>

            </div>
        </div>
        <div class="contentBox clear">
            <input class="fat" type="submit" value="Save settings" name="editSliderContent">
        </div>
    </form>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>