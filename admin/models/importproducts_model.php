<?php
defined("CATALOG") or die("Access denied");

//валидация файла
function ValidateCsv($file){
    $csvMimes =
        [
        'text/x-comma-separated-values',
        'text/comma-separated-values',
        'application/octet-stream',
        'application/vnd.ms-excel',
        'application/x-csv',
        'text/x-csv',
        'text/csv',
        'application/csv',
        'application/excel',
        'application/vnd.msexcel',
        'text/plain'
        ];
    if(!empty($file['file']['tmp_name']) && in_array($file['file']['type'],$csvMimes)) return true;
    $_SESSION['message']['error'] = 'invalid type file!';
    return false;

}

//импорт данных
function import($file, $category){
    $_SESSION['message']['error'] = '';
    $db = Model_Driver::get_instance();
    $table_name = "products";
    $category = (int)$category;
    if(!$category){
        $_SESSION['message']['error'] = 'Select category please!';
        return false;
    }
    $csvFile = fopen($file, 'r');

    //получаем первую строку
    $first_line = fgetcsv($csvFile,$length = 1000, $delimiter = ';');
    if(!$first_line){
        $_SESSION['message']['error'] = 'empty first line!';
        return false;
    }
    //debug_arr($first_line);
    //exit;
    //проверяем корректность полей в файле
    $name_keys = ['article','title','category_id','notice','meta_k', 'meta_d','mark_view', 'link_video','price'];
    foreach ($first_line as $item){
        if(!in_array(clear_string($item),$name_keys)){
            $_SESSION['message']['error'] = 'invalid first line!';
            return false;
        }
    }

    $new_data=[];
    $new_arr=[];
    //присваиваем кнаименование ключей для массива из первого прочитанного поля
    while($row = fgetcsv($csvFile,$length = 1000, $delimiter = ';')){
        $new_data[] = array_combine($first_line,$row);
    }

    //проверяем массив на пустоту title
    $tmp_arr=[];
    //debug_arr($new_data); exit();
    foreach($new_data as $key=>$value){
        if(!clear_string($value['title'])){
            $_SESSION['message']['error'] = 'invalid title in file!';
           return false;
        }

        foreach ($value as $k=>$v){
            $tmp_arr[$k] = clear_string($v);
            $tmp_arr['category_id'] = $category;
        }
        $new_arr[] = $tmp_arr;
    }
    //debug_arr($new_arr);
    //exit;
    //пропускаем первую строку
    foreach($new_arr as $item){
        //update info
        //$prevQuery = "SELECT alias FROM products WHERE alias = '".$line[1]."'";
        $prevResult = 0; //$db->sqlQuery($prevQuery);
        if($prevResult > 0){
            //update member data
            //$db->update("");
        }else{
            //insert member data into database
            //debug_arr($item);
            $name_value =[$item['article'],$item['title'],$item['category_id'],$item['notice'],$item['meta_k'],$item['meta_d'],$item['mark_view'],$item['link_video'],$item['price']];

            $res = $db->insert($table_name, $name_keys, $name_value);
            if(!$res){
                $_SESSION['message']['error'] .='error add product' . $name_value['title'].'</br>';
                continue;
            }
            //получаем id последней записи
            $id = mysqli_insert_id($db->ins_db);
            //var_dump($id);
            $alias = get_alias($table_name, 'alias', $name_value[1], $id);

            //Записываем алиас
            $res_alias = $db->update($table_name, ['alias'],[$alias],['id'=>$id]);
            //var_dump($res_alias);
            if(!$res_alias){
                $_SESSION['message']['error'] .="Error add product" . $name_value[1] . '</br>';
                return false;
            }
        }
    }
    //close opened csv file
    fclose($csvFile);
    $_SESSION['message']['success'] ='Success!';
}