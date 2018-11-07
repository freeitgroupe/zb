<?php require_once 'header.php'?>
<?php require_once 'top_nav_products.php'?>
<?php require_once 'tpl/topSettingsMenu.php'?>
    <!-- Content Wrapper. Contains page content -->
    <div class="contentBox">
        <div class="fist clear">
            <a href="/admin/edit-static-pages/new"><button>Add new</button></a>
        </div>
    </div>
    <div class="contentBox clear">
        <h2>Pages list</h2>
        <div class="tableBox clear">
            <table>
                <tbody>
                <tr>
                    <th>Title</th>
                    <th>Created Date</th>
                    <th>Updated Date</th>
                    <th>Status Page</th>
                    <th style="text-align: center;">Edit</th>
                    <th style="text-align: center;">Delete</th>
                </tr>
                <?php if(is_array($get_pages_admin)):?>
                    <?php foreach ($get_pages_admin as $item):?>
                        <tr class="pg-<?=$item['page_id']?>">
                            <td><?=$item['title']?></td>
                            <td><?=$item['created_at']?></td>
                            <td><?=$item['updated_at']?></td>
                            <td><?=$item['status'] == 0 ? 'draft':'public';?></td>
                            <td class="move" style="text-align: center;">
                                <a href="/admin/edit-static-pages/<?=$item['page_id']?>" class="btn-cancel-pages" data-page="<?=$item['page_id']?>"><i class="icons delete">edit</i></a>
                            </td>
                            <td class="move" style="text-align: center;">
                                <a href="#" class="trigger btn-delete-pages" data-page="<?=$item['page_id']?>"><i class="icons delete">delete</i></a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                <?php else:?>
                    <tr><td colspan="8"><?=$get_pages_admin?></td></tr>
                <?php endif; ?>
                </tbody>
            </table>
        </div>
        <div class="pageNavigation clear">
            <div class="fist clear">
                <div class="boxOneThird">
                    <?=$pagination?>
                </div>
            </div>
        </div>
    </div>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once 'footer.php'?>