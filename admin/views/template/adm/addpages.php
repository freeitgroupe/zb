<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topSettingsMenu.php'?>
    <!-- Content Wrapper. Contains page content -->
    <form action="<?php $_SERVER['REQUEST_URI']?>" method="post" enctype="multipart/form-data">
        <div class="contentBox clear">
            <h2>Edit page<i class="icons">mode_edit</i></h2>
            <div class="fist clear">
                <div class="boxOneThird clear">
                    <h3>Headings</h3>
                    <input type="text" placeholder="Page title" name="title" value="<?=$_SESSION['data']['title']?>">
                    <input class="top" type="text" placeholder="Keywords" name="meta_k" value="<?=$_SESSION['data']['meta_k']?>"></div>
                <div class="boxOneThird clear">
                    <h3>Seo description</h3>
                    <textarea placeholder="Enter description" name="meta_d"><?=$_SESSION['data']['meta_d']?></textarea>
                </div>
                <div class="boxOneThird clear">
                    <h3>Position in a row</h3>
                    <input type="text" placeholder="position"  name="position" value="<?=$_SESSION['data']['position']?>">
                    <select class="bottom top" name="status">
                        <option value="0" <?php $_SESSION['data']['status'] == 0 ? 'selected':''; ?>>Draft</option>
                        <option value="1" <?php $_SESSION['data']['status'] == 1 ? 'selected':''; ?>>Published</option>
                    </select>
                    <h3 style="padding-bottom: 0">Position on the home page</h3>
                    <select class="bottom top" name="parent_section">
                        <option value="0" <?php $_SESSION['data']['parent_section'] == 0 ? 'selected':''; ?>>header</option>
                        <option value="1" <?php $_SESSION['data']['parent_section'] == 1 ? 'selected':''; ?>>footer</option>
                        <option value="2" <?php $_SESSION['data']['parent_section'] == 2 ? 'selected':''; ?>>header & footer</option>
                    </select>
                    <input type="submit" value="Save page" name="new_pages_success">
                </div>
            </div>
        </div>
        <div class="contentBox clear">
            <div class="fist clear">
                <div class="clear">
                    <h3>Page content</h3>
                    <script src="<?=PATH_ADMIN?>js/ckeditor/ckeditor.js"></script>
                    <textarea placeholder="Fill page content" id="editor1" name="text"><?=$_SESSION['data']['text']?></textarea>
                    <script>
                        CKEDITOR.replace('editor1');
                    </script>
                </div>
            </div>
        </div>

    </form>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>