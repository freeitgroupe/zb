<?php defined("CATALOG") or die("Access denied"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1" />
    <title>wodsports</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
    <link rel="stylesheet" href="<?=PATH_ADMIN?>css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/style.css" media="screen">
    <link rel="stylesheet" href="/css/font-awesome.css"  rel="stylesheet" type="text/css" media="screen">
    <link rel="stylesheet" href="/css/jqcart.css">
    <link rel="stylesheet" href="/css/profile.css">
    <link rel="stylesheet" href="/css/jquery-comments.css">

    <link rel="stylesheet" href="/css/jquery-ui.css">
    <link rel="stylesheet" href="/css/jquery-ui.theme.css">

    <link href="/lib/fancybox/source/jquery.fancybox.css?v=2.1.5" rel="stylesheet" type="text/css" media="screen" />
    <link href="/lib/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" rel="stylesheet" type="text/css" media="screen" />
    <link href="/lib/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" rel="stylesheet" type="text/css" media="screen" />

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

    <script src="/js/jquery-3.2.1.js" ></script>

    <script src="/js/jquery.cookie.js"></script>

    <script src="/lib/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>
    <script src="/lib/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>
    <script src="/lib/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
    <script src="/lib/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>
    <script src="/lib/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
    <script src="/js/fancybox_options.js"></script>

    <script src="/js/modernizr.js"></script> <!-- Modernizr -->

    <script src="/js/jquery.form.min.js"></script> <!-- Modernizr -->
    <script src="/js/jquery.validate.js"></script>    <!-- -->
    <script src="/js/jquery.maskedinput.js"></script>    <!-- -->

    <script src="/js/accounting.js"></script>    <!-- -->

    <script src="/js/jquery-ui.js"></script>    <!-- -->

    <script src="<?=PATH_ADMIN?>js/ckeditor/ckeditor.js"></script>    <!-- -->


    <script type="text/javascript">
        $(document).ready(function() {
            $("body").css("display", "none");

            $("body").fadeIn(1500);

            $("a.transition").click(function(event){
                event.preventDefault();
                linkLocation = this.href;
                $("body").fadeOut(1000, redirectPage);
            });

            function redirectPage() {
                window.location = linkLocation;
            }
        });
    </script>
    <script src='https://www.google.com/recaptcha/api.js'></script>

    <!--<script src="/js/jquery.mobile-1.4.5.js"></script>-->
</head>
<body>
<div id="container-loader" class='container-loader-off'>
    <div class='loader'>
        <div class='loader--dot'></div>
        <div class='loader--dot'></div>
        <div class='loader--dot'></div>
        <div class='loader--dot'></div>
        <div class='loader--dot'></div>
        <div class='loader--dot'></div>
    </div>
</div>
<header>

    <!-- Для слайдера  -->
    <div class="menu-top">
        <nav class="navbar navbar-default">

            <div class="container-fluid top-navigate-header">
                <div class="header-size">
                    <ul class="nav navbar-nav top col-xs-3 center-navbar-inline text-center marg-0">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">$US <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#"> UAH</a></li>
                                <li><a href="#"> EUR</a></li>
                            </ul>
                        </li>
                        <li class="dropdown right-decor">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">RU <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">UA</a></li>
                            </ul>
                        </li>
                        <li class="dropdown right-decor">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Ваш город: <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Киев</a></li>
                                <li><a href="#">Киев</a></li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav top col-xs-6 center-navbar-inline text-center marg-0">
                        <li><a href="#"><i class="fa fa-shopping-cart fa-fw" aria-hidden="true"></i> Как сделать заказ</a></li>
                        <li class="right-decor"><a href="#"><i class="fa fa-credit-card-alt fa-fw" aria-hidden="true"></i> Как оплатить товар</a></li>
                        <li class="right-decor"><a href="#"><i class="fa fa-cubes fa-fw" aria-hidden="true"></i> Доставка</a></li>
                    </ul>
                    <ul class="nav navbar-nav top col-xs-3 center-navbar-inline text-center marg-0">
                        <li><a href="#">Контакты</a></li>
                        <li class="right-decor"><a href="#"><i class="fa fa-comments fa-fw" aria-hidden="true"></i> Онлайн помощь</a></li>
                    </ul>
                </div>
            </div>

            <div class="container-fluid header-size">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header mobile-width-xs">
                    <div class="mobile-navbar visible-xs">
                        <ul class="nav navbar-nav col-sm-12 pad-0">
                            <li class="col-xs-4 text-center pad-0">
                                <a class="pad-0" href="#">
                                    <i class="fa fa-user-circle-o fa-lg"></i>
                                    <p>Мой кабинет</p>
                                </a>
                            </li>
                            <li class="col-xs-4 text-center">
                                <div class="label-place">
                                    <div class="jqcart-cart-label">
                                        <p class="jqcart-total-cnt label-wish">0</p>
                                    </div>
                                </div>

                                <a class="pad-0" href="/wish-list"><i class="fa fa-star fa-lg"></i><p>Закладки</p></a>
                            </li>
                            <li class="col-xs-4 text-center pad-0">
                                <button class="butt-head pad-0" ><i class="fa fa-shopping-cart fa-lg"></i>
                                    <p>В корзине
                                    <div class="label-place_mob">0</div>
                                </button>

                            </li>

                        </ul>
                    </div>
                    <div class="mobile-menu-button">
                        <button type="button" class="navbar-toggle collapsed col-xs-1" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <style>
                    .center-navbar-inline li{
                        float: none;
                        display: inline-block;
                    }
                    .center-navbar-inline li a{
                        padding: 10px ;
                    }
                </style>

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">


                    <ul class="nav navbar-nav row header-desktop">
                        <li class="col-lg-3 col-md-3 col-sm-4 text-center">
                            <a class="pad-0" href="#"><img src="/img/logo_1.png" alt=""></a>
                        </li>
                        <li class="col-lg-6 col-md-6 col-sm-8">
                            <p class="name-company text-center">Український виробник професійного обладнання для Crossfit, фітнесу та єдиноборств</p>
                            <p class="text-center pad-0 visible-xs">
                                <span class="list-inline"><i class="fa fa-phone"></i> +38(099) 111-11-11</span>
                                &nbsp;<span class="list-inline"><i class="fa fa-envelope"></i> test@gmail.com</span>
                            </p>
                            <div class="bl-search">
                                <form action="<?=PATH?>search/" method="get" id="search_form">
                                    <div class="input-group">

                                        <input type="text" id="autocomplete" class="form-control h-40px form-search-top" placeholder="Найти...." name="search">
                                        <span class="input-group-btn">
                                        <button class="btn btn-default h-40px form-search-top-btn" type=""><i class="fa fa-search" name="search" form="search_form" ></i></button>
                                            </span>

                                    </div><!-- /input-group -->
                                </form>
                            </div><!-- /.col-lg-12 -->
                            <!--<p class="search-tmp">Популярные запросы: Гриф Турник Рама</p>-->
                        </li>

                        <!--mobile-menu-->
                        <div class="profile-nav visible-xs">

                            <ul class="profile-list-block inline-block">
                                <li class="list-item-menu"><a class="link-list-item active-list"><i class="fa fa-user"></i>
                                        <span>Профиль</span></a></li>
                                <li class="list-item-menu"><a class="link-list-item"><i class="fa fa-user"></i> <span>Мои заказы</span></a></li>
                                <li class="list-item-menu"><a class="link-list-item"><i class="fa fa-user"></i> <span>Корзина</span></a></li>
                                <li class="list-item-menu"><a class="link-list-item"><i class="fa fa-user"></i> <span>Список желаний</span></a></li>
                                <li class="list-item-menu"><a class="link-list-item"><i class="fa fa-user"></i> <span>Мои отзывы</span></a></li>
                            </ul>
                        </div>
                        <!--/mobile-menu-->

                        <li class="col-lg-3 col-md-3 col-sm-12">
                            <p class="text-center pad-0 hidden-xs">
                                <span class="list-inline"><i class="fa fa-phone"></i> +38(099) 111-11-11</span>
                                &nbsp;<span class="list-inline"><i class="fa fa-envelope"></i> test@gmail.com</span>
                            </p>
                            <ul class="nav navbar-nav col-sm-12 pad-0 hidden-xs">
                                <li class="col-lg-4 col-xs-4 text-center pad-0 ">
                                    <?php if((isset($_SESSION['auth'])) && ($_SESSION['auth'] == 'yes_auth')):?>
                                        <a class="pad-0 top-user-info" href="#">
                                            <i class="fa fa-user-circle-o fa-lg"></i>
                                            <p>Авторизован</p>
                                        </a>
                                    <?php else: ?>
                                        <a class="pad-0 top-authing" href="#">
                                            <i class="fa fa-user-circle-o fa-lg"></i>
                                            <p>Мой кабинет</p>
                                        </a>
                                    <?php endif;?>
                                </li>
                                <li class="col-lg-4 col-xs-4 text-center">
                                    <div class="label-place">
                                        <div class="jqcart-cart-label">
                                            <p class="jqcart-total-cnt label-wish">0</p>
                                        </div>
                                    </div>

                                    <a class="pad-0" href="/wish-list"><i class="fa fa-star fa-lg"></i><p>Закладки</p></a>
                                </li>
                                <li class="col-lg-4 col-xs-4 text-center pad-0">
                                    <a href="/cart" class="butt-head pad-0" id="open">
                                        <i class="fa fa-shopping-cart fa-lg"></i>
                                        <p>В корзине </p>
                                        <span class="summ-cart"></span>
                                        <div class="label-place">
                                            <div class="jqcart-cart-label">
                                                <span class="jqcart-total-cnt">0</span>
                                            </div>
                                        </div>
                                    </a>
                                </li>

                            </ul>
                        </li>
                    </ul>

                </div><!-- /.navbar-collapse -->
            </div><!-- /.container -->
        </nav>

        <div id="block-top-auth">
            <div class="corner"></div>
            <form method="post">
                <ul id="input-email-pass">
                    <h3>Вход</h3>
                    <p id="message-auth">Неверный Логин и(или) Пароль</p>
                    <li>
                        <input type="text" id="auth_login" placeholder="Логин или E-mail" />
                    </li>
                    <li>
                        <input type="password" id="auth_pass" placeholder="Пароль" />
                        <span id="button-pass-show-hide" class="pass-show"></span>
                    </li>

                    <ul id="list-auth">
                        <li>
                            <input type="checkbox" name="rememberme" id="rememberme" />
                            <label for="rememberme">Запомнить меня</label>
                        </li>
                        <li>
                            <a id="remindpass" href="#">Забыли пароль?</a>
                        </li>
                        <li>
                            <a href="/registration">Регистрация</a>
                        </li>
                    </ul>

                    <p align="right" id="button-auth" >
                        <a>Вход</a>
                    </p>
                    <p align="right" class="auth-loading">
                        <img src="/img/loading.gif" />
                    </p>
                </ul>
                <?php if(!isset($_SESSION['auth'])):?>

                    <div class="auth" <?php if((!isset($_SESSION['fealtures'])) || isset($_SESSION['fealtures']) && $_SESSION['fealtures'] <2):?>style="display:none;"<?php endif?>>

                        <div class="g-recaptcha" data-sitekey="6LeTaCoUAAAAAI6wOJWER997GSwqq_J2u1BLqZWV"></div>

                    </div>

                <?php endif; ?>
            </form>

            <form method="post">
                <div id="block-remind">
                    <h3>Восстановление<br /> пароля</h3>
                    <p id="message-remind" class="message-remind-success" ></p>
                    <center>
                        <input type="text" id="remind-email" placeholder="Ваш E-mail" />
                    </center>
                    <p align="right" id="button-remind">Готово</p>
                    <p align="right" class="auth-loading" ><img src="/img/loading.gif" /></p>
                    <p id="prev-auth">Назад</p>
                </div>
            </form>

        </div>

        <div id="block-user" >
            <div class="corner2"></div>
            <ul>
                <li>
                    <img src="/img/user_info.png" />
                    <a href="/profile">Профиль</a>
                </li>
                <li>
                    <img src="/img/logout.png" />
                    <a id="logout" href="#" data-event-user="logout" >Выход</a>
                </li>
            </ul>
        </div>

    </div> <!-- /.menu-top -->

</header>
<?php //var_dump($_SESSION);echo 'header.php';?>
<section class="content">
    <div class="container">
        <div class="row">
            <div class="col-md-3" id="left-cont-prof">

                <aside class="profile-left-block" id="profile-left-block">
                    <div class="button-nav-aside">
                        <i class="fa fa-navicon"></i>
                    </div>
                    <div class="profile-description">
                        <img src="<?=AVATAR . $_SESSION['auth_avatar']?>" alt="">
                        <h3 class="profile-name"><?=$_SESSION['auth_name']. ' ' . $_SESSION['auth_surname'] . ' ' .$_SESSION['auth_patronymic']?></h3>
                    </div>
                    <div class="profile-nav">
                        <ul class="profile-list-block">
                           <?php if(isset($menu_admin)):?>
                               <?php for($i=0, $count=count($menu_admin); $i<$count; $i++):?>
                                <li class="list-item-menu">
                                    <a href="/admin/<?=$menu_admin[$i]['alias']?>" class="link-list-item">
                                        <i class="<?=$menu_admin[$i]['icon']?>"></i>
                                        <span><?=$menu_admin[$i]['title']?></span>
                                    </a>
                                </li>
                               <?php endfor;?>
                            <?php endif;?>

                        </ul>
                    </div>
                </aside>

                <script>
                    $("#profile-left-block .button-nav-aside").click(function(event){
                        //alert("Hello again!");
                        $('.profile-left-block').toggleClass('hide-profile');
                        if($('#left-cont-prof').hasClass('col-md-3')){
                            $('#left-cont-prof').removeClass('col-md-3');
                            $('#right-cont-prof').removeClass('col-md-9');
                            $('#left-cont-prof').addClass('col-md-1');
                            $('#right-cont-prof').addClass('col-md-11');
                        }else{
                            $('#left-cont-prof').removeClass('col-md-1');
                            $('#right-cont-prof').removeClass('col-md-11');
                            $('#left-cont-prof').addClass('col-md-3');
                            $('#right-cont-prof').addClass('col-md-9');
                        }
                        return false;
                    })
                </script>
            </div>