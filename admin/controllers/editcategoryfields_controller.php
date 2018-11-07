<?php
defined("CATALOG") or die("Access denied");
require_once "controllers/main_controller.php";
require_once "models/{$view}_model.php";

if(!array_key_exists('cat_alias', $match)) header("Location: /admin");

    $category_alias = $match['cat_alias'];
    //Поиск id продукта по алиасу
    $category_id = findOneCategoryId($category_alias);
    $category_id = (int)$category_id;

    //если алиас не найден уходим на главную старницу
    if (!$category_id) {
        header("Location: /admin/category-fields/");
        exit();
    }
    $pages_id = $category_id;
    $category_product_for_edit = findOneParam('category', 'id', $pages_id);

    //Список категорий
    $category = get_category();
    $category_tree = map_tree($category);

    if(!$category_product_for_edit) header("Location: /admin/category-fields/");
    //$category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree.php', $tab='', ['category_info'=> $category_product_for_edit]);

    //Список дополнительных параметров для добавления в категорию
    $AdditionalAttributes = find_all_from_table('additional_attribute');
    //debug_arr($AdditionalAttributes);

    //Сущесвуют ли дополнительные параметры в категории если да, то выводим массив
    $AdditionalAttributesInCategory = ResAttrcategory($category_product_for_edit['additional_attribute_category']);
    //debug_arr($AdditionalAttributesInCategory);

    //Меню для формирования категории
    $category_menu_admin = data_tree_to_string($category_tree, TMP_ADM . 'tpl/category_tree.php', $tab='', ['create_category'=>'new']);

    //формирование сессионных переменных
    if(!isset($_SESSION['data'])){
        $_SESSION['data']['id'] = '';
        $_SESSION['data']['additionaltext_label'] = '';
        $_SESSION['data']['id_val'] = '';
        $_SESSION['data']['position_val'] = '';
        $_SESSION['data']['type_val'] = '';
        $_SESSION['data']['description_val'] = '';
    }

    //Запрос на добавление нового поля
    if (isset($_POST['fields_add_success'])) {
        $arr_post = $_POST;
        //debug_arr($arr_post);exit;
        $new_fields_for_category = new_fields_for_category($arr_post);
        if (!$new_fields_for_category) {
            header("Location: /admin/edit-category-fields/" . $category_alias);
            exit();
        }
        if($new_fields_for_category){
            header("Location: /admin/edit-category-fields/" . $category_alias);
            exit();
        }
    }

    //Удаление поля
    if(isset($_POST['delete_pages_id']) && $_POST['submit'] == 'delete_pages'){
        $param_name = clear_string($_POST['delete_pages_id']);
        if (!$param_name)
            exit(json_encode(['delete_pages_mess'=>'Error Del!']));

        $delete_pages_res = DeleteAttributesInCategory($param_name, $pages_id);
        if (!$delete_pages_res)
            exit(json_encode(['delete_pages_mess'=>'Ошибка после запроса удаления!']));

        exit(json_encode(['delete_pages_res'=>'true']));
    }

    //Редактирование категории
    if(isset($_POST['fields_edit_success'])){
        //debug_arr($_POST);exit;
        $param_name = clear_string($_POST['edit_attribute_fields']);
        //debug_arr($arr_post);exit;
        //продолжить разработку---->
        $edit_fields_for_category = edit_fields_for_category($param_name, $pages_id);
    }





require_once TMP_ADM . $view .'.php';