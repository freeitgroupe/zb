<?php
try {
	require "autoload.php";
	$page = new Controller;
	$page->render();
}
//Ловим ошибку
catch(Exception $e) {
	echo $e->getMessage();
	exit();
}