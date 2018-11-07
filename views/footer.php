<?php defined("CATALOG") or die("Access denied");?>
<!-- Footer -->
<footer class="emraceFull">
    <div class="embrace clear">
        <div class="left footerLeft">
            <div class="workingHours">
                Working hours : <span class="workHours">8.00 - 23.00</span> &copy 2017 Zupply Box Inc. All rights reserved.
            </div>
            <div class="socialBox clear">
                <a href="#" class="socialLink">Facebook</a>
                <a href="#" class="socialLink">Twitter</a>
                <a href="#" class="socialLink">Instagram</a>
            </div>
        </div>
        <div class="right footerRight">
            <div class="systemBox clear">
            <?php if(isset($pages['footer'])):?>
                <ul class="systemMenu clear">
                <?php foreach ($pages['footer'] as $v):?>
                    <li>
                        <a href="<?='/page/'.$v['alias']?>"><?=$v['title']?></a>
                    </li>
                <?php endforeach;?>
                </ul>
            <?php endif;?>
            </div>
            <div class="trustLogos">
                <div class="trustIcon">;</div>
                <div class="trustIcon"><</div>
                <div class="trustIcon">:</div>
            </div>
        </div>
    </div>
</footer>

<div class="modal" id="modal-edit-name" style="display: none">
    <form action="" method="post" id="form_edit_wishlist" class="uInfo">
        <div class="col-md-12 form-group">
            <h4 class="col-md-12 modal-title-wishlist">List Name</h4><br/>
            <input type="text" id="wishlist_name" class="form-control profile-input" value="" name="wishlist_name" placeholder="" required>
            <span id="helpBlock2" class="help-block" style="display: none"></span>
        </div>
        <div class="col-sm-4 col-sm-offset-4 btn-block-form" role="group" aria-label="...">
            <input type="submit" class="login-btn-form addToCart" name="wish_edit_submit" id="wish_edit_submit" value="Confirm">
            <input type="hidden" hidden id="edit_wishlist_id" name="parent_comment" value="0">
        </div>
    </form>
    <div class="col-md-12 success-edit" style="display: none">
        <div class="modal-header center" style="text-align: center">
            <img src="/images/cart_deal.png" alt="">
        </div>
    </div>
</div>

<div class="modal" id="modal-edit-del-product" style="display: none">
    <form action="" method="post" id="form_delete_wishlist_product">
        <h4 class="col-md-12 modal-title-wishlist">Delete the selected product ?</h4><br/>
        <div class="col-sm-4 col-sm-offset-4 btn-block-form" role="group" aria-label="...">
            <input type="submit" class="login-btn-form addToCart" name="wish_delete_product_submit" id="wish_delete_product_submit" value="Confirm">
            <input type="text" hidden id="delete_wishlist_product_id" name="delete_wishlist_product_id" value="">
            <input type="text" hidden id="delete_from_wishlist" name="delete_from_wishlist" value="">
        </div>
    </form>
    <div class="col-md-12 success-edit" style="display: none">
        <div class="modal-header center" style="text-align: center">
            <img src="/images/cart_deal.png" alt="">
        </div>
    </div>
</div>
</div>

<div class="modal" id="modal-edit-del-wishlist" style="display: none">
    <form action="" method="post" id="form_delete_wishlist">
        <h4 class="col-md-12 modal-title-wishlist">Delete the selected list ?</h4><br/>
        <div class="col-sm-4 col-sm-offset-4 btn-block-form" role="group" aria-label="...">
            <input type="submit" class="login-btn-form addToCart" name="wish_delete_submit" id="wish_delete_submit" value="Confirm">
            <input type="text" hidden id="delete_wishlist_id" name="delete_wishlist_id" value="">
        </div>
    </form>
    <div class="col-md-12 success-edit" style="display: none">
        <div class="modal-header center" style="text-align: center">
            <img src="/images/cart_deal.png" alt="">
        </div>
    </div>
</div>

<div class="modal" id="modal-choice-suppliers" style="display: none">
    <form action="" method="post" id="modal_choice_sup" class="modal_choice_sup">
        <h4 class="col-md-12 modal-title-form">Choice suppliers for product</h4><br/>
        <div class="col-md-12 form-group">
          <?php //Список поставщиков ?>
          <div id="supplierInfo"></div>
          <?php //$selectViewSuppliers?>
        </div>
        <br/>
        <div class="col-sm-4 col-sm-offset-4 btn-block-form" role="group" aria-label="...">
            <input type="submit" class="addSup login-btn-form addToCart" name="choice_suppliers_submit"  id="choice_suppliers_submit" value="Confirm">
            <input type="text" hidden id="choice_product_id" name="choice_product_id" value="">
        </div>
    </form>
    <div class="col-md-12 success-edit" style="display: none">
        <div class="modal-header center" style="text-align: center">
            <img src="/images/cart_deal.png" alt="">
        </div>
    </div>
</div>


<!-- responsive and menu elemants -->
<?php if(isset($_SESSION['category_search'])){unset($_SESSION['category_search']);}?>
<?php if(isset($_SESSION['message'])){unset($_SESSION['message']);}?>
<?php if(isset($_SESSION['search'])){unset($_SESSION['search']);}?>
<?php if(isset($_SESSION['cart'])){unset($_SESSION['cart']);}?>
<!-- scripts -->
<script>
    <?php //Проверка заголовка ?>
    $.ajaxSetup({
        headers : {'CsrfToken': $('meta[name="csrf-token"]').attr('content')}
    });

    <?php //попап окно ?>
    jQuery(function($){
        // bind event handlers to modal triggers
        $('body').on('click', '.trigger-edit-name', function(e){
            e.preventDefault();
            $('#modal-edit-name').modal().open();
        });

        $('body').on('click', '.trigger-del-product', function(e){
            e.preventDefault();
            $('#modal-edit-del-product').modal().open();
        });

        $('body').on('click', '.trigger-del-wishlist', function(e){
            e.preventDefault();
            $('#modal-edit-del-wishlist').modal().open();
        });

        // attach modal close handler
        $('.modal .close').on('click', function(e){
            e.preventDefault();
            $.modal().close();
        });

        // below isn't important (demo-specific things)
        $('.modal .more-toggle').on('click', function(e){
            e.stopPropagation();
            $('.modal .more').toggle();
        });

        // view all suppliers
        $('.view-all-suppliers').on('click', function (e){
            e.preventDefault();
            $('.table-suppliers').fadeToggle();
        });

        // bind event handlers to modal triggers add-suppl;iers
        $('body').on('click', '.trigger-add-product', function(e){
            e.preventDefault();
            $('#modal-choice-suppliers').modal().open();
        });

    });


    <?php //Обработка запроса при добавлении поставщика?>

    $(document).on('click', '.addSup', function(e){
        e.preventDefault();
        var ob = {'id': $('#choice_product_id').val()};
        var supplierVal = $("select#suppliersProduct").val();
        if(typeof(supplierVal) == 'undefined') supplierVal = false;
        $.ajax({
            type: "POST",
            url: "/cartajax",
            dataType: "json",
            data: "param=" + JSON.stringify(ob) + "&param_action=add_product"+ "&param_suppliers=" + supplierVal,
            cache: false,
            success: function (data) {
                if(data == 'true'){
                    alert('Product added!');
                    $('#modal_choice_sup').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('#modal_choice_sup').fadeIn()",1500);
                    setTimeout("$('.success-edit').fadeOut()",1500);
                    loadcart();
                }
                else{
                    alert('Product is not available for purchase!');
                    $('#modal-choice-suppliers').modal().close();
                }
            }
        });
    });

    <?php //Обработка запроса на добавление товара ?>
    $(document).on('click', '.button-add', function(){
        var ob = {'id': $(this).data('product')};
        //$("input[name='surname']").val()
        var supplierVal = $(this).data('suppliers');
        if(typeof(supplierVal) == 'undefined') supplierVal = false;
        var ob2 = {'id_suppliers': $(this).data('suppliers')};
        $.ajax({
            type: "POST",
            url: "/cartajax",
            dataType: "json",
            data: "param=" + JSON.stringify(ob) + "&param_action=add_product"+ "&param_suppliers=" + supplierVal,
            cache: false,
            success: function (data) {
                if(data == 'true'){
                    alert('Product added!');
                    loadcart();
                }
                else if(data['mess'] == 'supplierChoice'){
                    $('#modal-choice-suppliers').modal().open();
                    $('#choice_product_id').val(data['choice_product_id']);
                    $('#supplierInfo').html(data['supplierView']);
                }
                else{
                    alert('Product is not available for purchase!');
                }
            }
        });
    });

    <?php //Обработка запроса на удаление товара ?>
    $(document).on('click', '.deleteItem', function(){
        var delete_product = $(this).closest('li');
        //console.log(delete_product);
        var ob = {'id': $(this).data('product')};
        var ob_1 = {'action': $(this).data('action')};
        //console.log(ob);
        $.ajax({
            type: "POST",
            url:"/cartajax",
            dataType: "json",
            data: "param=" + JSON.stringify(ob) + "&param_action="+ JSON.stringify(ob_1),
            cache: false,
            success: function (data) {
                if(data == 'true'){
                    alert('Success delete!');
                    delete_product.remove();
                    loadcart();
                }
            }
        });
    });
    
    <?php //Переключаем чекбокс при клике на пустое поле для ввода имени нового листа желаний ?>
    $('#new_wishlist').click(function () {
        $('#optionsWishlistNew').prop('checked', true);
    });
    
    <?php //передаем значение id продукта в попап окно ?>
    $(document).on('click', '.bookmark', function(){
        var productId = $(this).data('product');
        var product_wish = $('#product_id').val(productId);
    });
    
    <?php //Обработка запроса на добавление товара в лист желаний ?>
    $(document).on('click', '#wishlist_submit', function(){
        event.preventDefault();
        var err_mess_block = $("#helpBlockMess");
        var data = $('#form_add_wish_list').serializeArray();
        err_mess_block.fadeOut(200);
        $.ajax({
            type: "POST",
            url: '/cartajax',
            dataType: "json",
            data: data,
            cache: false,
            success: function (data) {
                if(typeof(data['wishlist_user']) != 'undefined'){
                    $('.content-wishlist').text('');
                    $.each(data['wishlist_user'] , function (index, val) {
                        $('.content-wishlist').append(
                            '<li class="wish-info-li">'+
                            '<label>' +
                            '<input type="radio" name="optionsWishlist" id="optionsRadios'+val["id"]+'" value="'+val["id"]+'">'+val["title"]+'</label>'+'</li>');
                    });
                    //$("#modal-wishlist").modal('hide');
                    $(".modal-title-wishlist").text('Продукт добавлен!');
                   // $("#modal-wishlist-success").modal('show');
                    //setTimeout(function(){$('#modal-wishlist-success').modal('hide')}, 1500);
                    $("#new_wishlist").val('');

                }

                if(typeof(data['wishlist_mess']) != 'undefined' ){
                    //$("#modal-wishlist").modal('hide');
                    err_mess_block.fadeIn(200);
                    err_mess_block.text(data['wishlist_mess']);
                    //$("#modal-wishlist-success").modal('show');
                    //setTimeout(function(){$('#modal-wishlist-success').modal('hide')}, 1500);
                    $("#new_wishlist").val('');
                }

                loadWishList();
            }
        });
    });

    <?php //Данные о корзине ?>
    function loadcart() {
        var ob_1 = {'res': '1'};
        var id_prod ='';
        var title_prod ='';
        var count_prod ='';
        $.ajax({
            type: "POST",
            url: "/cartajax",
            dataType: "json",
            data: "param_res=" + JSON.stringify(ob_1),
            cache: false,
            success: function (data) {
                if (data == "0")
                {
                    $(".cart-count").html('');
                    $(".summ-cart").html('not added');
                    $('.building-price').html('Total: '+ 0 + ' USD');
                } else
                {
                    $('.cart-info').html('');
                   // console.log(data);
                    $.each(data['product_info_res'], function(index, value) {
                        //console.log('index:' + index + '//' + 'value:' + value);
                        //alert(count_prod);
                        $('.cart-info').append("<li><a href='/product/"+value["alias"]+"'>"+value["title"]+' '+'(' + value["count"]+ ' * '+ +value["price"]+'$)'+"</a><span class='deleteItem' data-product='"+value["id"]+"' data-action='delete'>`</span></li>");

                    });
                    $(".cart-count").html(data['count']);
                    $(".summ-cart").html(' '+(accounting.formatNumber(data['int'], 2, " ", ",")) + "$");
                    $('.building-price').html('Total: '+ data['int'] + ' USD');
                }
            }
        });
    }

    <?php //Вызыв ф-ии для формирования корзины ?>
    loadcart();

    <?php //Вызов ф-ии для формирования листа желаний, Вызываем если пользователь авторизован ?>
    <?php if(isset($_SESSION['auth']) && $_SESSION['auth'] == 'yes_auth'):?>
        function  loadWishList() {
            var post = 'loadWishlist';
            $.ajax({
                type: "POST",
                url: "/",
                dataType: "json",
                data: "param_post=" + post,
                cache: false,
                success: function (data) {
                    //console.log(data['id_select_products_wish_list']);
                    if (data)
                        {
                            $.each(data['id_select_products_wish_list'], function (index, value) {
                                event_deal_btn = $('.bookmark').filter($("[data-product =" + value + "]"));
                                event_deal = event_deal_btn.children('.fa');
                                event_deal_name = $('.bookmark').filter($("[data-product =" + value + "]")).children('.name-for-button').text('В избранном');
                                if (!event_deal_btn.hasClass("disabled")) {
                                    event_deal_btn.prop('disabled', true);
                                    event_deal_btn.addClass("disabled");
                                }
                            });
                        }
                    else
                        {
                            $(".label-wish").text('0');
                        }
                }
            });
        }
        loadWishList();
    <?php endif;?>

    <?php //Подгрузка товара при нажатии на кнопку #refreash?>
    $(function () {
        if(typeof(num) == 'undefined'){var num = 8;}
        //if(typeof(save_num) == 'undefined'){var save_num = num;}
        $('#refreash').click(function(){
            $('#refreash').prop('disabled', 'true');
            $.ajax({
                url: window.location.href,
                type: "POST",
                data: {"num_page_product": num},
                cache: false,
                success: function(data){
                    if(!data || data == 'false'){$('#refreash').fadeOut(200);return};
                    $('#content-product').append(data);
                    setTimeout(function(){$('.load-content').fadeIn(800);}, 200);
                    $('#refreash').prop('disabled', '');
                    num = num + 8;
                    //var save_num = $.cookie("num_page", num, {expires: 1});
                }
            });
        });
    });

    <?php //выход пользователя?>
    $('#logout').click(function(ev){
        var event_user = $(this).data('event-user');
        //alert(event_user);
        $.ajax({
            type: "POST",
            url: window.location.href,
            dataType: "html",
            data: "event_user="+ event_user,
            cache: false,
            success: function(data) {

                if (data == 'logout')
                {
                    location.reload();
                }

                if (data == 'false')
                {
                    alert("false");
                }

            }
        });
        ev.preventDefault();
    });
</script>

<?php //поиск в хедере сайта?>
<script>
    $("#catSelect").change(function(){
        var category_search = this.value; // $(this).val()
        $.ajax({
            url: "<?=PATH . 'search/'?>",
            type: "POST",
            data: {"category_search": category_search},
            dataType: "html",
            cache: false,
            success: function(data){
                //if(data == 'true') console.log('ok');
            }
        })

    });

    $('#autocomplete').autocomplete({
        source:'<?=PATH . 'search/'?>',
        minLength:2,
        select:function (event, ui){
            window.location = '<?=PATH?>' + 'search/?search=' + encodeURIComponent(ui.item.value);
        }
    });

    $( "#autocomplete" ).autocomplete({
        delay: 500
    });
</script>

<?php //Информация о складе ?>
<script>
    $("#WarehouseSelect").change(function(){
        var WarehouseChoiceValue = this.value; // $(this).val()
        $.ajax({
            url: window.location.href,
            type: "POST",
            data: {"WarehouseChoice": WarehouseChoiceValue},
            cache: false,
            success: function(data){
                location.reload();
                console.log(data);
            }
        });
    });
</script>
<script type="text/javascript">
    if (window.location.hash && window.location.hash == '#_=_') {
        if (window.history && history.pushState) {
            window.history.pushState("", document.title, window.location.pathname);
        } else {
            // Prevent scrolling by storing the page's current scroll offset
            var scroll = {
                top: document.body.scrollTop,
                left: document.body.scrollLeft
            };
            window.location.hash = '';
            // Restore the scroll offset, should be flicker free
            document.body.scrollTop = scroll.top;
            document.body.scrollLeft = scroll.left;
        }
    }
</script>
<?php
$filename = $_SERVER["DOCUMENT_ROOT"]. '/js/template/' . $view . '.php';
if (file_exists($filename) > 0){  require_once "$filename"; }

//Обновляем токен
//if(isset($_SESSION['csrf_token'])){unset($_SESSION['csrf_token']);}
?>
<!-- end scripts -->
</body>
</html>

