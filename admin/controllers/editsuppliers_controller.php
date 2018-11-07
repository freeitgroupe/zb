<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";
if(!array_key_exists('pages_alias', $match)) header("Location:" . PATH_ADMIN . 'suppliers/');

//параметры отображения для выпадающего списка
$visibleSupplier =['hide'=>0,'view'=>1];

if($match['pages_alias'] != 'new'){
    if(!$supplierInfo = findOneParam('suppliers', 'alias', $match['pages_alias'])) header("Location:" . PATH_ADMIN . 'suppliers/');
    $supplierId = $supplierInfo['supplier_id'];
    //Информация о поставщике
    $getDataSupplier = getDataSupplier($supplierId);
    //Информация о поставляемых продуктах
    $getDataProductsSupplier = getDataProductsSupplier($supplierId);

    //Обновление данных
    if (isset($_POST['edit_supplier_success'])) {
        $arr_post = $_POST;
        $edit_supplier_res = editSupplierRes($supplierId, $arr_post);
        if (!$edit_supplier_res) {
            header("Location: /admin/edit-suppliers/" . $supplierInfo['alias']);
            exit();
        }
        header("Location: /admin/edit-suppliers/" . $supplierInfo['alias']);
        exit();
    }
    require_once TMP_ADM . $view . '.php';
}

if($match['pages_alias'] == 'new'){
  $pages_id = 'new';
  //Формирование сессионных данных
  if(!isset($_SESSION['data'])){
      createSessionData('data', ['title'=>'','description'=>'','meta_d'=>'','meta_k'=>'','state'=>'','city'=>'','zip_code'=>'','email'=>'','phone'=>'','visible'=>'']);
  }

  if(isset($_POST['new_supplier_success']) && $_POST['new_supplier_success'] > FALSE){
      $arr_post = $_POST;
      $new_supplier_res = newSupplierRes($arr_post);
      if (!$new_supplier_res) {
          header("Location: /admin/edit-suppliers/" . $pages_id);
          exit();
      }
      if($new_supplier_res){
          header("Location: /admin/edit-suppliers/");
          exit();
      }
  }
  require_once TMP_ADM . 'addsuppliers' .'.php';
}


