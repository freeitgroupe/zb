<?php

class Controller {
	//для хранения массива $fields из конфига
	private $fields;
	private $objIm;
	
	
	public function __construct() {
		require "config.php";
		
		$this->fields = $fields;
		$this->objIm = new CsvImporter('import.csv',TRUE,';');
		$result = $this->objIm->get();
		
		echo '<pre>';
		print_r($result);
		echo '</pre>';
		
	}

	public function render() {
		
	}
    //шаблонизатор данного проекта
	public function getContent() {
		
	}
}