<?php
defined("CATALOG") or die("Access denied");

class Model_Driver{
    static $_instance;
    public $ins_db;

    static function get_instance(){
        if(self::$_instance instanceof self){
            return self::$_instance;
        }
        return self::$_instance = new self;
    }

    public function __construct()
    {
        $this->ins_db = new mysqli(HOST,USER,PASSWORD,DB_NAME);
        //проверяем на ошибки, если существует свойство connect_error генирируем текст и номер ошибки
        if($this->ins_db->connect_error ){
            throw new Exception("Ошибка соединения: " . $this->ins_db->connect_errno. '|'.iconv("CP1251","UTF-8",$this->ins_db->connect_error )  );
        }
        //делаем запрос в бд
        $this->ins_db->query("SET NAMES 'UTF8'");
    }

    public function select(
        $param,//парметры id
        $table,//таблицы
        $where = array(),//массив для нашей фильтрации
        $order = FALSE,//сортировка по параметру
        $napr = "ASC",//направление сортировки
        $limit = FALSE,//лимит или диапозон значений
        $operand = arraY('='),//параметри для фильтрации
        $match = array()//надо ли формировать запрос для полнотекстного поиска
    )
    {
        $sql = "SELECT";
        //перебираем переданные значения в переменную $param
        foreach($param as $item) {
            $sql .= ' '.$item.',';
        }
        //убираем заетую в конце строки
        $sql = rtrim($sql,',');
        //указываем таблицу с какой необходимо доставать данные
        $sql .= ' '.'FROM'.' '.$table;
        //сначала смотрим если заполненые ячейки в массиве
        //если есть тогда присуттсвует параметры для определения выборки по параметру WHERE
        if(count($where) > 0) {
            //Так как параметров для выборки может быть несколько нам необходимо их перебирать при итерациях
            //а так как параметров может быть несколь нам  также прижется пристыковывать к запросу
            //такие ключевые фразы SQL как IN или AND
            $ii = 0;
            //проходимся по массиву данных $where, читаем ключ параметр
            foreach($where as $key=>$val) {
                //предварительно обязательно считаем итерацию
                if($ii == 0) {
                    //при нулевой(т.е. первой) итерации мы считываем значение операнда  $operand
                    if($operand[$ii] == "IN") {
                        //стыкуем  ключевыен лова запроса и параметры передаваемы в модели(название ячеек табл), операнды запроса ну и значение по которым осущ поиск в ячейках табл
                        $sql.= " WHERE ".strtolower($key)." ".$operand[$ii]."(".$val.")";
                    }
                    //просто стыкуем значение операнда передаваемые через массив в модели
                    else {
                        $sql .= ' '.' WHERE '.strtolower($key).' '.$operand[$ii].' '."'".$this->ins_db->real_escape_string($val)."'";
                    }
                }
                //перещли к следующей итерации +1
                if($ii > 0) {
                    //если есть операнд IN
                    if($operand[$ii] == "IN") {
                        $sql.= " AND ".strtolower($key)." ".$operand[$ii]."(".$val.")";
                    }
                    //иначе записываем его значение
                    else {
                        $sql .= ' '.' AND '.strtolower($key).' '.$operand[$ii].' '."'".$this->ins_db->real_escape_string($val)."'";
                    }

                }
                //увеличиваем i
                $ii++;
                //если операндов будет меньше чем переданых значений в массиве $where, мы будем возвращаться к предыдущему операнду за счет того что ументшаем итерацию на 1
                //if((count($operand) -1) так как count считает с "1"
                if((count($operand) -1) < $ii) {
                    $operand[$ii] = $operand[$ii-1];
                }
            }

        }

        //смотрим ячейки  $match
        if(count($match) > 0) {
            foreach($match as $k=>$v) {
                //проверяем был ли запрос WHERE если да то используем AND MATCH
                if(count($where) > 0) {
                    $sql.= " AND MATCH (".$k.") AGAINST('".$this->ins_db->real_escape_string($v)."')";
                }
                //не было WHERE  используем WHERE MATCH
                elseif(count($where)  == 0) {
                    $sql.= " WHERE MATCH (".$k.") AGAINST('".$this->ins_db->real_escape_string($v)."')";
                }
            }
        }
        //в случае сортировки добавляем
        if($order) {
            $sql .= ' ORDER BY '.$order." ".$napr.' ';
        }
        //в случае лимита добавляем
        if($limit) {
            $sql .= " LIMIT ".$limit;
        }
        //echo $sql .'<br/>';
        //exit;
        //выполняем запрос в бд
        $result = $this->ins_db->query($sql);

        if(!$result) {
            echo ("Ошибка запроса".$this->ins_db->connect_errno."|".$this->ins_db->error);
        }
        //если невыбрано не одного поля
        if($result->num_rows == 0) {
            return FALSE;
        }
        //проходимся по нашим полям
        for($i = 0; $i < $result->num_rows; $i++) {
            //формируем массив данных
            $row[] = $result->fetch_assoc();
        }

        return $row;

    }

    //удаление данных из таблицы
    public function delete($table,$where = array(),$operand = array('=')) {
        //Например: $sql = "DELETE FROM brands WHERE brand_id=28";
        //Формируем запрос
        $sql = "DELETE FROM ".$table;
        //проверка на существование массива в переменной where
        if(is_array($where)) {
            //для подсчета итерации создадим переменную
            $i = 0;
            //проходимся по нашему массиву
            foreach($where as $k=>$v) {
                //формируем корректный синтаксис запроса
                $sql .= ' WHERE '.$k.$operand[$i]."'".$v."'";
                //увеличиваем счетчик итераций на 1
                $i++;
                //сколько ячеек хранится в $operand
                if((count($operand) -1) < $i) {
                    $operand[$i] = $operand[$i-1];
                }
            }

        }

        //echo $sql; exit();
        $result = $this->ins_db->query($sql);
        if(!$result) {
            echo ("Ошибка базы данных: ".$this->ins_db->errno." | ".$this->ins_db->error);
            return FALSE;
        }
        return TRUE;
    }

    public function sqlQuery($sql, $update=false){
        //echo $sql . '</br>';
        //exit();
        $result = $this->ins_db->query($sql);

        if(!$result) {
            echo ("Ошибка запроса ".$this->ins_db->connect_errno."|".$this->ins_db->error);
        }
        if($update == true) return true;
        //если невыбрано не одного поля
        if($result->num_rows == 0) {
            return FALSE;
        }
        //проходимся по нашим полям
        for($i = 0; $i < $result->num_rows; $i++) {
            //формируем массив данных
            $row[] = $result->fetch_assoc();
        }

        return $row;
    }

    public function insert($table, $data = array(),$values = arraY(),$id = FALSE) {
        // Пример для формирования запроса $sql = "INSERT INTO brands (brand_name,parent_id) VALUES ('TEST','0')";
        //формируем запрос
        $sql = "INSERT INTO ".$table." (";
        $sql .= implode(",",$data).") ";
        $sql .= "VALUES (";
        foreach($values as $val) {
            $sql .= "'".$val."'".",";
        }
        $sql = rtrim($sql,',').")";
        //echo $sql;
        $result = $this->ins_db->query($sql);
        if(!$result) {
            throw new Exception("Ошибка базы данных: ".$this->ins_db->errno." | ".$this->ins_db->error);
            return FALSE;
        }
        if($id) {
            return $this->ins_db->insert_id;
        }
        return TRUE;
    }

    public function update($table,$data = array(),$values = array(),$where = array()) {
        //$sql = "UPDATE brands SET brand_name='TES1',parent_id='1' WHERE brand_id = 29";
        $data_res = array_combine($data,$values);


        $sql = "UPDATE ".$table." SET ";

        foreach($data_res as $key=>$val) {
            $sql .= $key."='".$val."',";
        }

        $sql = rtrim($sql,',');

        foreach($where as $k=>$v) {
            $sql .= " WHERE ".$k."="."'".$v."'";
        }

        //echo $sql;
        //exit();
        $result = $this->ins_db->query($sql);

        if(!$result) {
            echo ("Ошибка базы данных: ".$this->ins_db->errno." | ".$this->ins_db->error);
            return FALSE;
        }

        return TRUE;
    }
}
