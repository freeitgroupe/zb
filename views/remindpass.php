<?php defined("CATALOG") or die("Access denied");
require_once "header.php";
?>
<div class="emraceFull">
    <div class="embrace clear singlePage">
        <div class="loginBox clear">
            <form action="" id="form_reg">
                <div class="input-label">
                    <input type="text" name="reg_email" id="reg_email" placeholder="Print email">
                </div>
                <button class="button confirm" type="button" id="conf_reg">Get access</button>
            </form>
            <p class="notice" id="helpBlock2"></p>
        </div>
    </div>
</div>
<?php require_once "footer.php"?>