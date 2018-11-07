<?php defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";


//проверяем существание ключа для идентификации ключа массива
if(!array_key_exists('pages_id', $match)) header("Location: /admin");

//проверяем id товара на входе при запросе редактирования
$pages_id = $match['pages_id'];

//Список категорий
$category = get_category();
$category_tree = map_tree($category);

//редактирование фильтра
if($pages_id !='new'){
    //Обработаем и записываем id фильтра
    $pages_id = (int)$pages_id;

    //проверяем есть ли такой id в бд
    //
    if(!findOneParam('filter_value', 'id', $pages_id)){
        return header ("Location: /admin");
        exit;
    }
    
    //данные фильтра, значение и имя.
    $filter_info_for_edit = filter_info_for_edit($pages_id);
    //debug_arr($filter_info_for_edit);
    
    //выбранные категории для фильтра
    $filter_category_choose = filter_category_choose($pages_id);
    //debug_arr($filter_category_choose);exit;   

    //если кат больше ноля тогда
    if($filter_category_choose > 0){

        $filter_product_choose = filter_product_choose($pages_id);
        //debug_arr( $filter_product_choose);exit;

        //выбранные продукты по категории для фильтра
        $edit_table_filter_for_product = edit_table_filter_for_product($filter_category_choose, $filter_product_choose);
/*        debug_arr($edit_table_filter_for_product); exit;

       

        Создаем сес массив массива продуктов для фильтра
        if(!isset($_SESSION['prod_for_filter'])){
            $_SESSION['prod_for_filter'] = [];
            $prod_for_filter = $_SESSION['prod_for_filter'];
        }
        
        Массив с продуктами которые входят в фильтр
        $product_active_for_filter = product_active_for_filter($edit_table_filter_for_product,$filter_product_choose);*/


    }

    //Формируем список категорий
    $category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree_for_editfilter.php', $tab='', ['filter_category_choose'=>  $filter_category_choose]);

    //Формируем форму для товара
    $form_edit = [
        [
            'type' => 'input',
            'label' => 'Наименование фильтра',
            'name_input' => 'title',
            'value' => $filter_info_for_edit['name'],
            'placeholder' => 'Наименование фильтра',
            'required' => 'required',
            'helpblock' => 'true',
            'disabled' => 'true'
        ],

        [
            'type' => 'input',
            'label' => 'Значение фильтра',
            'name_input' => 'value_filter',
            'value' => $filter_info_for_edit['value_filter'],
            'placeholder' => 'Значение фильтра',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'select_category_product',
            'label' => 'Категория',
            'name_input' => 'category_id[]',
            'value_selected' => '',
            'option_value' => '',
            'data_tree'=>''
        ],

        [
            'type' => 'submit',
            'name' => 'edit_pages_success',
            'value' => 'Подтвердить'
        ],
    ];

    //Отправка пост данных
    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        //debug_arr( $arr_post);exit;

        $edit_filter_value_res = edit_filter_value_res($pages_id, $arr_post);

        if(!$edit_filter_value_res)
        {
            header("Location: /admin/edit-filter/" . $pages_id);
            exit();
        }

        //добавляем для фильтрации на странице категорий
        $relations_filval_cat = relations_filval_cat($arr_post);
        //debug_arr( $arr_post);exit;

        if (!$relations_filval_cat) {
            //echo  $_SESSION['data']['parent'];

            header("Location: /admin/edit-filter/" . $pages_id);
            exit();
        }

        header("Location: /admin/edit-filter/" . $pages_id);
        exit();
    }
    
    if(isset($_POST['prod_for_filter_success']))
    {
        $arr_post = $_POST;
        //debug_arr($arr_post);exit;

        $prod_for_filter_success = prod_for_filter_success($pages_id, $arr_post);

        if(!$prod_for_filter_success)
        {
            header("Location: /admin/edit-filter/" . $pages_id);
            exit();
        }

        header("Location: /admin/edit-filter/" . $pages_id);
        exit();
    }


}

//Добавление нового фильтра
if($pages_id =='new'){
    $pages_id = 'new';
    if(!isset($_SESSION['data'])){
        $_SESSION['data']['name'] ='';
        $_SESSION['data']['value_filter'] = '';

    }

    $form_edit = [
        [
            'type' => 'input',
            'label' => 'Наименование фидьтра',
            'name_input' => 'name_param',
            'value' => $_SESSION['data']['name'],
            'placeholder' => 'Наименование фильтра',
            'required' => 'required',
            'helpblock' => 'true'
        ],

        [
            'type' => 'input_param_filter',
            'label' => 'Параметры для фильтра',
            'name_input' => 'value_filter[]',
            'value' => $_SESSION['data']['value_filter'],
            'placeholder' => 'Параметр фильтра',
            'required' => 'required',
            'helpblock' => 'true'
        ],


        [
            'type' => 'submit',
            'name' => 'edit_pages_success',
            'value' => 'Подтвердить'
        ],
    ];

    if (isset($_POST['edit_pages_success'])) {
        $arr_post = $_POST;
        //debug_arr( $arr_post);exit;

        $new_filter_res = new_filter_res($arr_post);
        
        if (!$new_filter_res) {
            //echo  $_SESSION['data']['parent'];

            header("Location: /admin/edit-filter/" . $pages_id);
            exit();
        }
        
        header("Location: /admin/filters/");
        exit();
    }
    

}






require_once TMP_ADM . $view .'.php';
