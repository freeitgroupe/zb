<?php
class CsvImporter {
	
	private $fh;//дискриптор открытого файла
	private $header;//настройки к заголовку
	private $separator;//разделитель
	private $length;//максимальное количество символов
	private $headerKeys;
	
	//$filename - имя файла
	//$header - пропускать или не пропускать первую строку в csv файле
    //$separator
	public function __construct($fileName, $header = FALSE, $separator=';',$length=8000 ) {
		$this->fh = fopen($fileName,"r");
		$this->header = $header;
		$this->separator = $separator;
		$this->length = $length;
		//Смотрим что содержится в хедер
		if($this->header) {
			$this->headerKeys = fgetcsv($this->fh,$this->length,$this->separator);/// ,
		}
	}

	//закрываем открытый файл
	public function __destruct() {
		if($this->fh) {
			fclose($this->fh);
		}
	}

	//возвращаем содержимое csv в виде массива
	public function get($max = 0) {
		$data = array();
		for($line = 0; $row = fgetcsv($this->fh,$this->length,$this->separator); $line++) {
			if($this->header) {
			    var_dump($this->headerKeys);
				foreach($this->headerKeys as $k=>$v) {
					$row1[$v] = $row[$k];
					print_r($row1);
				}
				$data[] = $row1;
			}
			else {
				$data[] = $row;
			}
			
			if($max > 0) {
				if($max == $line) {
					break;
				}
			}
		}
		return $data;
	}
}
?>