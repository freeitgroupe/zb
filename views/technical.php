<?php defined("CATALOG") or die("Access denied");?>
    <html xmlns="http://www.w3.org/1999/xhtml" xmlns:og="http://ogp.me/ns#" xmlns:fb="https://www.facebook.com/2008/fbml" itemscope="" itemtype="http://schema.org/WebPage">
    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="csrf-token" content="<?= $_SESSION['csrf_token'] ?>">
        <!--gefault header-->
        <meta name="keywords" content="<?=$keywords_header?>" />
        <meta name="description" content="<?=$description_header?>" />
        <!--include header-->
        <!--    <link rel="stylesheet" href="/css/main.css">;-->
        <link rel="stylesheet" href="/css/main_mob.css">
        <link rel="stylesheet" href="/css/jquery-ui.css">
        <link rel="stylesheet" href="/css/jquery-ui.theme.css">
        <!--shortcut icon-->
        <link rel="shortcut icon" href="/images/favicon.png" />
    </head>
    <body>
<style>
        .center-info{

            margin: 0 auto;
            text-align: center;
            width: 800px;
            margin-top: 20%;
        }
        .center-info h1 {
            text-transform: uppercase;
            color:#20a4b6;
            font-size: 38px;
            font-weight: 500;
        }
    </style>
<div class="emraceFull">
    <div class="embrace clear indexPage">
        <!-- choice if the day -->
        <div class="choiceIndex clear">
            <div class="choiceLoop clear">
                <div class="center-info">
                    <img src="/images/logo.svg" alt="">
                    <h1>Technical works...</h1>
                </div>
            </div>
        </div>
        <div class="semanticBox clear"></div>
    </div>
</div>