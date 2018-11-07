<?php defined("CATALOG") or die("Access denied"); ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="<?=PATH_ADMIN?>css/admin.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="application/javascript" src="<?=PATH_ADMIN?>js/products.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Cabin|Droid+Sans|Oxygen|PT+Sans" rel="stylesheet">
    <title>Restricted Area Zupply Box</title>
</head>
<body>
<div class="embraceFull clear">

    <div class="headerBox">
        <header>
            <div id="hide-menu-btn">
                <button></button>
            </div>
        </header>
    </div>
    
    <script>
        $( function() {
            $( "#accordion" ).accordion({
                heightStyle: "content"
            });
        } );
    </script>
    
    <div class="content-box clear">
        <nav class="adminNavigation clear">
            <div class="anvigationBlock clear">
                <div id="accordion">
                    <?php require_once "menu_tmpl.php" ?>
                </div>
            </div>
        </nav>