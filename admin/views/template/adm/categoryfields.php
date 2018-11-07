<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topProductsMenu.php'?>
<div class="contentBox clear">
    <div class="top bottom">
        <h3>Add rule</h3>
        <input class="bottom" type="text" value="Category" readonly="readonly">
        <select class="bottom" name="id" id="category_id" value="">
            <option value="">Select category</option>
            <?=$category_menu_admin?>
        </select>
        <a href="/admin/edit-category-fields/" class="button" id="btn-for-edit-category">Add fields group</a>
    </div>
</div>
<div class="contentBox">
    <div class="tableBox">
        <table>
            <tbody>
            <tr>
                <th>ID</th>
                <th>Group name</th>
                <th>Related categories</th>
                <th>Edit</th>
            </tr>
            <?php foreach ($ReturnNeArrFromJson as $item):?>
                <tr>
                    <td>#<?=$item['id']?></td>
                    <td><?php //foreach($item['additional_attribute_category'] as $item): echo $item['additionaltext_label'] . ', ';  endforeach;?></td>
                    <td><?=$item['title']?></td>
                    <td>
                        <a class="edit" href="/admin/edit-category-fields/<?=$item['alias']?>"><i class="icons edit">edit</i></a>
                    </td>
                </tr>
            <?php endforeach?>
            </tbody>
        </table>
    </div>
</div>
<script>
    $(document).on('change','#category_id',function(){
        console.log($(this).find(':selected').data('alias'));
        $("#btn-for-edit-category").prop('href', '/admin/edit-category-fields/' +  $(this).find(':selected').data('alias'));
    });
</script>

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>
