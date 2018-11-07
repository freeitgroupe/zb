<?php
defined("CATALOG") or die("Access denied");
require_once "views/header.php";
?>
<!-- single page content -->
<div class="emraceFull">
    <div class="embrace clear singlePage">
        <h3 class="stipeHeading">Personal Office</h3>
        <div class="officeBox clear">
            <div class="greetingsBox">
                <div class="userName"><?= $_SESSION['auth_name']?> </div>
<!--                <div class="userId">#0987</div>-->
            </div>
            <?php require_once "office_menu.php" ?>
            <div class="officeRight clear">
                <!-- main box -->
                <div class="userMail frozen"><?=$user_detail['email']?> <a href="#" class="confirmMail" style="background-color: rgb(97, 189, 109);">confirm</a></div>

                <form class="uInfo" id="userInfo" method="post" action="<?=$_SERVER['REQUEST_URI']?>">
                    <input type="text" placeholder="Enter your full name" value="<?=$user_detail['name']?>" name="name" >
                    <input type="text" placeholder="Enter your email" value="<?=$user_detail['email']?>" name="email" >
                    <input type="text" placeholder="Enter your phone number" value="<?=$user_detail['phone']?>" name="phone">

                    <input type="submit" name="personal_info" value="Submit">
                </form>

                <?php // Pass form ?>
                <form class="uInfo" id="userPass" action="<?=$_SERVER['REQUEST_URI']?>" method="post">
                    <input type="text" placeholder="Enter current passoword" value="" name="old_password">
                    <input type="text" placeholder="Enter new passoword" value="" name="new_password">
                    <input type="text" placeholder="Enter new passoword again" value="" name="confirm_password">
                    <input type="submit" name="new_pass_submit" value="Submit">
                </form>
                <!-- main box end -->
                <!-- finance -->
<!--                <form action="#" class="userBalance" id="finance">-->
<!--                    <div class="resFound">-->
<!--                        Reserved Founds<br />-->
<!--                        <input type="text" value="10.000$" name="totalfounds">-->
<!--                    </div>-->
<!--                    <input type="submit" value="Add Founds" name="">-->
<!--                </form>-->
                <?php if(isset($_SESSION['message'])):?>
                    <div class="totalDiscount">
                        <?php isset($_SESSION['message']['success']) ? print $_SESSION['message']['success']:''?>
                        <?php isset($_SESSION['message']['error']) ? print $_SESSION['message']['error']:''?>
                    </div>
                <?php endif;?>
                <?=$pathFacebook?>
                <?=$linkGoogle?>
                <!-- finance end -->
            </div>
        </div>
    </div>
</div>
<!-- single page content end -->
<?php require_once "views/footer.php"?>