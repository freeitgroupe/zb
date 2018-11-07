<?php require_once "header.php"?>
<?php require_once 'top_nav_products.php'?>
<div class="contentBox clear">
    <nav class="pageNav clear">
        <ul>
            <a href="/admin/warehouse"><i class="icons">storage</i><li>Warehouses</li></a>
            <a href="/admin/edit-warehouse/new"><i class="icons">queue</i><li>Add new</li></a>
        </ul>
    </nav>
</div>
<div class="contentBox clear">
    <h2>Warehouse <?=$param_id['name']?><i class="icons">add</i></h2>
    <form action="<?=$_SERVER['REQUEST_URI']?>" method="post">
        <div class="fist clear">
            <div class="boxOneThird">
                <h3>Main</h3>
                <input class="bottom" type="text" placeholder="Warehouse name" name="name" value="<?=$param_id['name']?>">
                <input class="bottom" type="text" placeholder="Regional prefix" name="region_code" value="<?=$param_id['region_code']?>">
                <input class="bottom" type="text" placeholder="Legal number" name="license_number" value="<?=$param_id['license_number']?>">
                <input type="text" placeholder="Tax rate" name="tax_summ" value="<?=$param_id['tax_summ']?>">
            </div>

            <div class="boxOneThird">
                <h3>Region</h3>
                <select class="bottom" name="state_id">
                    <option value="0">All States</option>
                    <?php for($i=0, $count=count($states_of_usa); $i<$count; $i++):?>
                        <option value="<?=$states_of_usa[$i]['id']?>"
                            <?php $param_id['state_id'] == $states_of_usa[$i]['id'] ? print 'selected':'';?>><?=$states_of_usa[$i]['name']?></option>
                    <?php endfor;?>
                </select>

                <h3>Official Registration</h3>
                <select class="bottom" name="official_registration">
                    <option value="0" <?php $param_id['official_registration'] == '0' ? print 'selected':'';?>>No</option>
                    <option value="1" <?php $param_id['official_registration'] == '1' ? print 'selected':'';?>>Yes</option>

                </select>

                <input  class="bottom" type="text" placeholder="city" name="city" value="<?=$param_id['city']?>">
                <input class="bottom" type="text" placeholder="Post index" name="warehouse_index" value="<?=$param_id['warehouse_index']?>">
                <input class="bottom" type="text" placeholder="Enterprise id" name="enterprise_id" value="<?=$param_id['enterprise_id']?>">
            </div>
            <div class="boxOneThird">
                <h3>GPS</h3>
                <input class="bottom" type="text" placeholder="Longitude" name="coordinate_long" value="<?=$param_id['coordinate_long']?>">
                <input class="bottom" type="text" placeholder="Latitude" name="coordinate_latitude" value="<?=$param_id['coordinate_latitude']?>">
                <input class="bottom" type="text" placeholder="Address" name="address" value="<?=$param_id['address']?>">
            </div>
        </div>
        <div class="fist class">
            <div class="boxOneThird">
                <h3>Contacts</h3>
                <input class="bottom" type="text" placeholder="Manager Name" name="responsible_person" value="<?=$param_id['responsible_person']?>">
                <input class="bottom" type="text" placeholder="Phone number" name="phone" value="<?=$param_id['phone']?>">
                <input type="text" placeholder="Exrteme Phone" name="hotline_phone" value="<?=$param_id['hotline_phone']?>">
            </div>
            <div class="boxTwoThirds">
                <h3>Important information</h3>
                <textarea placeholder="Print instruction" name="notice">
                <?=$param_id['notice']?>
                </textarea>
            </div>
        </div>
        <input class="fat" type="submit" value="Confirm Warehouse" name="edit_pages_success">
    </form>
</div>

<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php require_once "footer.php"?>
