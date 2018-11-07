<?php
define('HOST','localhost');
define('DB','csvimport');
define('USER','root');
define('PASSWORD','');

//TRUE-пропускаем первую строку в csv файле, false нет
define('PASS_FIRST',TRUE);


$fields = array(
				'publish' => "Активен",
				'articul' => "Артикул",
				'name' => "Имя",
				'id_cat' => "Категория",
				'number' => "Количество",
				'keywords' => "Ключевые слова",
				'title' => "Заголовок",
				'description' => "Краткое описание",
				'meta_desc' => "Краткое описание для поисовика",
				'text' => "Текст",
				'price' => "Цена",
				'image' => "Изображение"
				);