<?php defined("CATALOG") or die("Access denied");
require_once "header.php";
?>
    <!-- main page content -->
    <!-- single page content -->
    <div class="emraceFull">
        <div class="embrace clear singlePage">
            <div class="loginBox clear">
                <form action="" id="form_auth">
                    <input type="text" placeholder="Your email" name="email" id="log_email">
                    <input type="hidden" value="" id="valid_email">
                    <input type="password" placeholder="Enter password, min 6 characters" name="pass" id="log_pass">
                    <p><button type="button" class="button confirm-log">Sign in</button></p>
                    <p class="notice" id="helpBlock2"><?php if(isset($_SESSION['message']['error'])):?><?=$_SESSION['message']['error'] ?><?php endif;?></p>
                    <?php if(!isset($_SESSION['authManager'])):?>
                        <div class="">
                            <div class="auth" <?php if((!isset($_SESSION['fealtures'])) || isset($_SESSION['fealtures']) && $_SESSION['fealtures'] < 2):?>style="display:none;"<?php endif?>>
                                <div class="g-recaptcha" data-sitekey="6LexWEEUAAAAABBX7Lyp8LkQ0JfEAZalT7mFBKLn"></div>
                            </div>
                        </div>
                    <?php endif; ?>
                </form>
                <?php /*?>
                <div class="shareBox clear" style="margin: 0 auto;">
                    <a title="On Facebook" href="<?=$path?>" class="loginFacebook shareLink facebook">Facebook login</a>
                    <!--                    <a href="" class="shareLink twitter">Google</a>-->
                </div>
                <?php */?>

                <p><a href="/forget" class="smallBtn">Forget password?</a></p>
                <!--                <div><a href="--><?//=$path?><!--">loginfacebook</a></div>-->
                <!-- Display login button / Facebook profile information -->
                <div><?php //echo $output; ?></div>
            </div>
        </div>
    </div>
    <!-- single page content end -->
<?php require_once "footer.php"?>