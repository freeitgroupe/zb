<?php defined("CATALOG") or die("Access denied");?>
<?php require_once $_SERVER['DOCUMENT_ROOT'] . "/libs/location.php";?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="https://www.facebook.com/2008/fbml" itemscope="" itemtype="http://schema.org/WebPage">
<head>
    <meta http-equiv="content-type" content="text/plain; charset=utf-8" />
    <meta name="csrf-token" content="<?= $_SESSION['csrf_token'] ?>">
    <!--title-->
    <title><?=SITE_NAME .' | ' . $title_header?></title>
    <!--twitter header-->
    <meta name="google-site-verification" content="kq2dHJGUktWDtrj0vjaezO6k-yEQFPjq-1aL_cQARck"/>
    <meta name="twitter:card" content="summary" />
    <meta name="twitter:site" content="@<?=SITE_NAME?>" />
    <meta name="twitter:creator" content="@elegantcode" />
    <!--facebook header-->
    <meta property="og:type" content="website" />
    <meta property="og:site_name" content="<?=SITE_NAME ?>" />
    <meta property="og:url" content="<?=substr(PATH, 0, -1) . $_SERVER['REQUEST_URI']?>" />
    <meta property="og:title" content="<?=SITE_NAME .' | ' . $title_header?>" />
    <meta property="og:description" content="<?=$description_header?>" />
    <meta property="og:image" content="<?=$image_header?>" />
    <!--gefault header-->
    <meta name="keywords" content="<?=$keywords_header?>" />
    <meta name="description" content="<?=$description_header?>" />
    <!--include header-->
    <!--    <link rel="stylesheet" href="/css/main.css">;-->
    <link rel="stylesheet" href="/css/main_mob_new.css">
    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/jquery-ui.theme.css">
    <link rel="stylesheet" href="/css/the-modal.css">
    <link rel="stylesheet" href="/images/font-awesome/css/font-awesome.min.css">
    <!--shortcut icon-->
    <link rel="shortcut icon" href="/images/favicon.png" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/apple-touch-icon-60x60.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
    <link rel="manifest" href="/manifest.json">
    <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
    <meta name="msapplication-TileColor" content="#2b5797">
    <meta name="theme-color" content="#ffffff">
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/js/functions.js"></script>
    <script src="/js/accounting.js"></script>    <!--accounting -->
    <script src="/js/jquery-ui.js"></script>    <!--for search -->
    <script src="/js/rating.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans:400,700|Roboto:300,300i,400,400i,500,500i,700" rel="stylesheet">
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script src="/js/jquery.md5.js"></script>
    <script src="/js/jquery.the-modal.js"></script>
    <style>
        .img-list{
            max-width: 70px;
            display: inline-block;
            vertical-align: middle;
        }
        a{
            text-decoration: none;
        }
        .block-input{
            margin-top: 10px;

        }
        .block-input span{
            display: inline-block;
            vertical-align: middle;
        }
        .block-input input{
            display: inline-block;
            vertical-align: middle;
            margin: 0;
            padding: 0;
        }
        .product_rating_widget{
            padding: 0px;
            margin: 0px;
        }
        .overall-rating{
            font-size: 12px;
        }
        .product_rating_widget li{
            line-height: 0px;
            width: 22px;
            height: 22px;
            padding: 0px;
            margin: 0px;
            margin-left: 2px;
            list-style: none;
            float: left;
            cursor: pointer;
        }
        .product_rating_widget li span{
            display: none;
        }

        .rating-prod{
            display: inline-block;
            margin: 0 10px;
            vertical-align: middle;
        }

        .prev_img{
            height: 100px;
            width: 100px;
            margin: 5px 5px 5px 0;
            padding: 2px;
            border: 1px solid silver;
        }

        .gallery-block{
            display: inline-block;
            position: relative;
            width: 150px;
            height: 150px;
            overflow:hidden;
            margin: 5px 5px 5px 0;
            padding: 2px;

        }
        .filter-order{
            display: inline-block;
        }
        .all_view_comments{
            cursor: pointer;
        }
        .table-suppliers{
            display: none;
        }
        .view-all-suppliers{
            cursor: pointer;
        }

        .suppliersProductSelect{
            background-color: rgb(238, 238, 238);
            border: medium none;
            border-radius: 4px 0 0 4px;
            color: rgb(136, 153, 153);
            height: 34px;
            left: 0;
            line-height: 13px;
            outline: medium none;
            padding: 8px 15px;
            width: 137px;
        }
        .modal_choice_sup{
            text-align: center;
        }
    </style>
</head>
<body>
<!-- header -->
<div class="embraceFull">
    <div class="headerBox clear">
        <header class="mainHeader">
            <div class="topHeader clear">
                <div class="embrace clear">
                    <div class="topHeaderBox">
                        <div class="logoBox left">
                            <a href="/"><img src="/images/logo.svg"></a>
                        </div>
                        <nav class="mainNavigation left">
                            <?php if(isset($pages['header'])):?>
                                <ul id="listBox clear">
                                    <li>
                                        <?php foreach ($pages['header'] as $v):?>
                                            <a href="<?='/page/'.$v['alias']?>"><?=$v['title']?></a>
                                        <?php endforeach;?>
                                    </li>
                                </ul>
                            <?php endif;?>
                        </nav>
                        <div class="phoneBox clear right">
                            <div class="callBack right">
                                <!-- <form action="" id="callback">
                                    <input type="text" name="callnumber" placeholder="Your phone">
                                    <input type="submit" class="reCall" value="Call me">
                                </form> -->
                                <button id="reCallMe">CALL ME</button>
                            </div>
                            <div class="phoneNumber right">
                                <?=PHONE_SITE?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="embraceBottom clear spaceAround">
                <div class="bottomHeader clear">
                    <div class="geoMenu left clear">
                        <div class="menuBox left">
                            <div class="productList">
                                <div class="openMenu menuButton" id="menuClosed">
                                        <span class="menuName">
                                            Product List
                                        </span>
                                </div>
                                <div class="closeMenu" id="menuOpened">
                                        <span class="menuName closeIt">
                                            Return Page
                                        </span>
                                </div>
                            </div>
                        </div>
                        <div class="warhouseBox left">
                            <p>Your location :</p>
                            <a href="#" class="warhouseLink" id="warhouse"><?php $geoLocationUsers?></a>
                            <?php /* ?>
                                <select name="warehouse" id="WarehouseSelect">
                                    <?php ////-> Массив складов с выбранным складом для пользователя?>
                                    <?php if(isset($WarehouseArrWithChoiceUserWarehouse) && $WarehouseArrWithChoiceUserWarehouse > false):?>
                                        <?php foreach ($WarehouseArrWithChoiceUserWarehouse as $item):?>
                                            <option value="<?=$item['id']?>" <?php isset($item['selected']) ? print $item['selected']:''?>><?=$item['name']?></option>
                                        <?php endforeach;?>
                                    <?php endif;?>
                                </select>
                                <?php */ ?>
                        </div>
                    </div>
                    <div class="searchBox left clear">
                        <form action="<?=PATH?>search/" method="get" id="search_form" class="searchForm clear">
                            <select name="category" id="catSelect">
                                <option value="0">All</option>
                                <?php if(isset($primary_category) && $primary_category > false):?>
                                    <?php foreach ($primary_category as $item):?>
                                        <option value="<?=$item['id']?>"><?=$item['title']?></option>
                                    <?php endforeach;?>
                                <?php endif;?>
                            </select>
                            <input type="search" name="search" id="autocomplete" placeholder="Search" class="searchText" <?php if(isset($_SESSION['search'])):?> value="<?=$_SESSION['search']?>"<?php endif?> />
                            <input type="submit" name="searchbutton" value="J" class="searchSubmit" />
                        </form>
                    </div>
                    <div class="cartBox clear right">
                        <div class="cartZone right" id="cart">
                            <img src="/images/box.svg" alt="Shopping box" id="shoppingBox">
                            <div class="cartCount" id="shoppingCounter">
                                <a href="#" class="cart-count">0</a> products<br />
                                <a href="#" class="summ-cart"></a>
                            </div>
                        </div>

                        <div class="pofileLink right">
                            <div class="profileBox clear">
                                <?=$user_greeting?>
                                <?=$user_header?>
                                <?php if(isset($_SESSION['auth_role']) && $_SESSION['auth_role'] == 2):?>
                                    <a href="/admin/">Admin-panel</a>
                                <?php endif;?>
                            </div>
                        </div>
                        <!--                        <span class="wishList-block" id="shoppingWishList">-->
                        <!--                            wishList-->
                        <!--                            <a href="#" class="summWishProd">0</a>-->
                        <!--                        </span>-->
                        <!-- opened cart minibox -->
                        <div class="miniCart" id="miniCart">
                            <div class="miniCartBox clear">
                                <div class="closeCart fill">W</div>
                                <div class="miniList">
                                    <ul class="cart-info">
                                        <li class="cart-info-li"></li>
                                    </ul>
                                </div>
                                <div class="miniInfo">
                                    <div class="minOrder"><span class="dollarLeft"><?=MIN_SUM_ORDER . $currency?></span>More to minimal order</div>
                                    <div class="minFooter clear">
                                        <div class="wishList" id="shoppingWishList">a</div>
                                        <div class="checkOut">
                                            <a href='/cart' id="checkOut">Checkout</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /opened cart minibox -->

                        <!-- opened cart minibox -->
                        <div class="miniWish" id="miniWish">
                            <div class="miniCartBox clear">
                                <div class="closeWish fill">W</div>

                                <div class="miniList">
                                    <ul class="wish-info">
                                        <?php if((isset($countProdInWishList['id_select_products_string'])) && $countProdInWishList ['id_select_products_string'] > false):?>
                                            <?php for($i=0, $count = count($countProdInWishList ['id_select_products_string']); $i < $count; $i++):?>
                                                <li class="wish-info-li">
                                                    <a href="<?='/product/' . $countProdInWishList ['id_select_products_string'][$i]['alias']?>">
                                                        <?=$countProdInWishList ['id_select_products_string'][$i]['title']?>
                                                    </a>
                                                </li>
                                            <?php endfor;?>
                                        <?php endif?>
                                    </ul>
                                </div>

                            </div>
                        </div>
                        <!-- /opened cart minibox -->

                        <!-- opened cart minibox -->
                        <div class="miniPopap">
                            <div class="miniCartBox clear">
                                <div class="closePopup fill">W</div>

                                <div class="miniList">
                                    <?php //если пользователь авторизован?>
                                    <?php if(isset($_SESSION['auth'])):?>
                                        <form id="form_add_wish_list" method="post">
                                            <table>
                                                <tbody>
                                                <?php if(isset($wishlist_user) && $wishlist_user > false):?>
                                                    <tr>
                                                        <td>
                                                            <ul class="wish-info content-wishlist">
                                                                <?php for($i=0, $count = count($wishlist_user); $i < $count; $i++):?>
                                                                    <li class="wish-info-li">
                                                                        <label class="label-wish-list" for="optionsRadios<?=$wishlist_user[$i]['id']?>">
                                                                            <input type="radio" name="optionsWishlist" id="optionsRadios<?=$wishlist_user[$i]['id']?>" value="<?=$wishlist_user[$i]['id']?>">
                                                                            <?=$wishlist_user[$i]['title']?>
                                                                        </label>
                                                                    </li>
                                                                <?php endfor;?>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                <?php endif?>
                                                <tr>
                                                    <td>
                                                        <input type="radio" name="optionsWishlist" id="optionsWishlistNew" value="new">
                                                        <label for="" class="label-wish-list">Add new wish list<sub>*</sub>:</label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input class="form-control profile-input" type="text" name="new_wishlist" id="new_wishlist" value="">
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <input type="submit" class="button" name="wishlist_submit" id="wishlist_submit" value="Confirm">
                                                        <input type="text" hidden id="product_id" name="product_id" value="0">
                                                        <p class="notice modal-title-wishlist" id="helpBlockMess"></p>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </form>

                                    <?php else: ?>
                                        <p>To add a product to the wish list, please</p> <a href="/login"> login </a>
                                    <?php endif;?>
                                </div>

                            </div>
                        </div>
                        <!-- /opened cart minibox -->

                    </div>
                    <!-- mobile products list -->
                    <div class="categoryList clear" id="mobiCat">
                        <div class="showBox">
                            <div class="toggleButton childOff">Hide child</div>
                            <div class="toggleButton childOn">Show child</div>
                        </div>
                        <div class="catList">
                            <?=$category_menu?>
                        </div>

                    </div>
                    <!-- mobile products list end -->
                </div>
            </div>
        </header>
    </div>
</div>
<!-- header end -->
