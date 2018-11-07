<?php
//Автозагрузка класса
function myAutoload($className) {
    //подключаем файл с классом
	$pathToClass = 'classes/'.$className.'.php';
	//выполняем проверку на наличие данного класса
	if(file_exists($pathToClass))
		require $pathToClass;
	else
	    //формируем исключение
		throw new Exception('File Not found');
}
//Регистрируем нашу ф-ю авто подгрузки классов
spl_autoload_register('myAutoload');
//$obj = new Class();