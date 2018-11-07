<?php defined("CATALOG") or die("Access denied");
require_once "header.php";
?>
    <!-- main page content -->
    <!-- single page content -->
    <div class="emraceFull">
        <div class="embrace clear singlePage">
            <div class="loginBox clear">
                <form action="" id="form_reg">
                    <div class="input-label">
                        <input type="text" name="reg_email" id="reg_email" placeholder="Print email">
                    </div>

                    <div class="input-label">
                        <input type="password" name="reg_pass" id="reg_pass" placeholder="Enter password">
                    </div>

                    <div class="input-label">
                        <input type="password" name="reg_pass_again" id="reg_pass_again" placeholder="Password again">
                    </div>
                        <button class="button confirm" type="button" id="conf_reg">
                            Sign up
                        </button>
                </form>
                <p class="notice" id="helpBlock2"></p>
            </div>
        </div>
    </div>

<?php require_once "footer.php"?>