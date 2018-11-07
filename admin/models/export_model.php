<?php
defined("CATALOG") or die("Access denied");


function backupDatabaseTables(){
    try {
        $world_dumper = Shuttle_Dumper::create(array(
            'host' => HOST,
            'username' => USER,
            'password' => PASSWORD,
            'db_name' => DB_NAME,
        ));

        // dump the database to gzipped file
        // $world_dumper->dump('world.sql.gz');

        // dump the database to plain text file
        $world_dumper->dump('backup_db.sql');

        // send the output to gziped file:
        $world_dumper->dump('backup_db.sql.gz');

    } catch(Shuttle_Exception $e) {
        echo "Couldn't dump database: " . $e->getMessage();
    }

}

function backupDataTable($table){
    $query = Model_Driver::get_instance()->sqlQuery("SELECT * FROM $table");
    //debug_arr($query); exit;
    if(count($query) > 0){
        $delimiter = ",";
        $filename = "{$table}_" . date('Y-m-d H:i:s') . ".csv";
        //create a file pointer
        $f = fopen('php://memory', 'w');
        //set column headers
        //$fields = array('ID', 'Name', 'Email', 'Phone', 'Created', 'Status');
        $fields =[];
        foreach ($query[0] as $k=>$v){
            $fields[] = $k;
        }
        //debug_arr($fields);exit;
        fputcsv($f, $fields, $delimiter);
        foreach ($query as $v){
            //debug_arr($v);
            $paramVal=[];
            if(is_array($v)):
                foreach ($v as $v1){
                    $paramVal[] = $v1;
                }
                //debug_arr($paramVal);
                fputcsv($f, $paramVal, $delimiter);
            endif;
        }
        //exit;
        //move back to beginning of file
        fseek($f, 0);
        //set headers to download file rather than displayed
        header('Content-Type: text/csv');
        header('Content-Disposition: attachment; filename="' . $filename . '";');
        //output all remaining data on a file pointer
        fpassthru($f);
    }
    exit;
}