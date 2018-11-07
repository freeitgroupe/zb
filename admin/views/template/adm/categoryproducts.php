<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<div class="contentBox">
    <div class="fist clear">
        <a href="/admin/edit-category-product/new"><button>Add new</button></a>
    </div>
</div>
<div class="contentBox clear">
    <h2>Categories<i class="icons">layers</i></h2>
    <div class="fist clear">
        <div class="contentBox">
            <div class="tableBox">
                <table>
                    <tbody>
                    <tr>
                        <th>Category</th>
                        <th style="text-align: center;">Edit</th>
                        <th style="text-align: center;">Delete</th>
                        <th style="text-align: center;">View</th>
                        <th style="text-align: center;">Hide</th>
                    </tr>

                    <?php for($i=0, $count=count($get_edit_category_products); $i<$count; $i++):?>
                        <tr class=" pg-<?=$get_edit_category_products[$i]['id']?>">
                            <td>
                                <p><?= implode(' > ', breadcrumbs(get_category(), $get_edit_category_products[$i]['id']));?></p>
                            </td>
                            <td>
                                <a href="/admin/edit-category-product/<?=$get_edit_category_products[$i]['alias']?>" class="btn btn-default btn-warning" >
                                    <i class="fa fa-pencil"></i>
                                </a>
                            </td>
                            <td>
                                <a href="#" class="trigger btn-delete-pages" data-page="<?=$get_edit_category_products[$i]['id']?>"><i class="icons delete">delete</i></a>
                            </td>
                            <td>
                                <button href="" data-toggle="modal" data-target="#modal-pages-action" class="trigger btn btn-default btn-success btn-show-pages b-s-p-<?=$get_edit_category_products[$i]['id']?>" data-page="<?=$get_edit_category_products[$i]['id']?>" <?php if($get_edit_category_products[$i]['view'] == 1):?>disabled<?php endif?>>
                                    <i class="fa fa-eye"></i>
                                </button>
                            </td>
                            <td>
                                <button href="" data-toggle="modal" data-target="#modal-pages-action" class="trigger btn btn-default btn-hide-pages btn-danger b-h-p-<?=$get_edit_category_products[$i]['id']?>" data-page="<?=$get_edit_category_products[$i]['id']?>"  <?php if($get_edit_category_products[$i]['view'] == 0):?>disabled<?php endif?>>
                                    <i class="fa fa-eye-slash"></i>
                                </button>
                            </td>
                        </tr>
                    <?php endfor?>
                    </tbody>
                </table>
            </div>
        </div>
        <span>***"category_1> category_2> category_3" is the nesting of categories. "category_3" is the last category in the list. Remove and hide the categories starting with the last one.</span>
    </div>
</div>

<div class="pageNavigation clear">
    <div class="fist clear">
        <div class="boxOneThird">
            <h3>Page navigation</h3>
            <?=$pagination?>
        </div>
    </div>
</div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>
