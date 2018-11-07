<?php require_once "header.php"?>
<!-- Content Wrapper. Contains page content -->
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
<div class="contentBox clear">
    <div class="contentBox clear">
        <h2>Filter<i class="icons">filter_list</i></h2>
        <div class="fist clear">
            <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
                <div class="boxOneThird clear">
                    <input type="text" data-range="true" data-multiple-dates-separator="/" class="datepicker-here" value="" name="rangeTime">
                </div>
                <div class="boxOneThird clear">
                    <input class="fat" value="search" name="searchButton" type="submit">
                </div>
            </form>
        </div>
    </div>
    <div class="contentBox clear">
        <h2>Information<i class="icons">poll</i></h2>
        <div class="fist">
            <div class="boxOneThird"><h3>Money</h3>
                <p>Total quantity of goods: <span class="countAdmin">1293</span></p>
                <p>Quantity of goods sold: <span class="countAdmin">393</span></p>
                <p>Total tax: <span class="countAdmin">104</span></p>
            </div>
            <div class="boxOneThird"><h3>Users</h3>
                <p>Registered users: <span class="countAdmin">12393</span></p>
                <p>Active orders: <span class="countAdmin">93</span></p>
                <p>Average check: <span class="countAdmin">203</span></p>
            </div>
            <div class="boxOneThird"><h3>Information</h3>All information is given according to the site currency. To edit, use the appropriate sections of the menu.</div>
        </div>
    </div>
    <div class="contentBox clear">
        <h2>Popular<i class="icons">loyalty</i></h2>
        <div class="fist">
            <div class="boxOneThird"><h3>Top items</h3>
                <p><a href="#">Paper Towels</a></p>
                <p><a href="#">Plastic glass</a></p>
                <p><a href="#">Honey sticks</a></p>
            </div>
            <div class="boxOneThird"><h3>Top categories</h3>
                <p><a href="#">Paper Products</a></p>
                <p><a href="#">Towels</a></p>
                <p><a href="#">Chemicals</a></p>
            </div>
        </div>
        <!-- pagination end / -->
    </div>
</div>
<?php if(isset($_SESSION['filter'])){unset($_SESSION['filter']);}?>
<?php require_once "footer.php"?>
