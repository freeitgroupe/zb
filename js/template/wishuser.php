<?php //Формируем данные для модального окна редактирования списка желаний ?>
<?php //Отправляем данные на сервер ?>
<script>
    <?php //Отдаем данные в модальное окно на редактирование Листа желаний ?>
    $('.edit_wish_list').click(function(){
        var nameList = $(this).data('wish-title');
        var wishId =$(this).data('wish-id');
        var nameForEdit = $('#wishlist_name').val(nameList);
        var wishIdForEdit = $('#edit_wishlist_id').val(wishId);
    });

    <?php //Отдаем данные в модальное окно на удаление Листа желаний ?>
    $('.delete-wishlist').click(function(){
        var wishId =$(this).data('wish-id');
        var wishIdForEdit = $('#delete_wishlist_id').val(wishId);
    });

    <?php //Отдаем данные в модальное окно на удаление продукта из листа желаний  ?>
    $('.delete-prod-wl').click(function(){
        var wishIdProduct =$(this).data('product');
        var wishList =$(this).data('wishlist');
        var wishIdProductForEdit = $('#delete_wishlist_product_id').val(wishIdProduct);
        var wishIdListForEdit = $('#delete_from_wishlist').val(wishList);
    });

    <?php //Валидация input поля ?>
    function validInputText(lineInput, err_mess_block, btn_submit){
        var pattern = /^[a-z0-9_А-Я- ]{3,20}$/i;
        var validInput = lineInput;

        if(validInput.val() != ''){
            if($.trim(validInput.val()).search(pattern) == 0){
                err_mess_block.fadeOut(200);
                // err_mess_block.text('');
                // btn_submit.attr('disabled', false);
                validInput.parent().removeClass('has-error');
                return true;

            }else{
                //err++;
                err_mess_block.fadeIn(200);
                err_mess_block.text('Specify at least 3 characters!');
                // btn_submit.attr('disabled', true);
                validInput.parent().addClass('has-error');
                return false;
            }
        }else{
            err_mess_block.fadeIn(200);
            err_mess_block.text('Fill this field!');
            validInput.parent().addClass('has-error');
            btn_submit.attr('disabled', true);
            return false;
        }


    }

    <?php //Обработка полей формы удаляем класс ошибки ?>
    $("input").click(function () {
        $(this).parent().removeClass('has-error');
        $('#helpBlock2').text('');
    });

    <?php //Редактировнаие имени листа желаний?>
    $('#wish_edit_submit').click(function () {
        event.preventDefault();
        if(!validInputText($('#wishlist_name'), $('#helpBlock2'), $('#wish_edit_submit'))) return false;
        var wishlist_name = $('#wishlist_name').val();
        var edit_wishlist_id = $('#edit_wishlist_id').val();
        var submit = 'edit_wishlist';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "wishlist_name=" + wishlist_name + "&edit_wishlist_id=" + edit_wishlist_id + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['wishlist_new_name']) != 'undefined'){
                    var name_title = data['wishlist_new_name'];
                    $('#form_edit_wishlist').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('#list-' + edit_wishlist_id).text(data['wishlist_new_name']);
                    $('.ed-' + edit_wishlist_id).data('wish-title', name_title);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('#form_edit_wishlist').fadeIn()",2000);
                    setTimeout("$('.success-edit').fadeOut()",2000);
                }else{
                    $('#form_edit_wishlist').fadeOut(100);
                    $('#modal-wishlist-edit').text(data['wishlist_mess']);
                    setTimeout("$('#modal-wishlist-edit').modal('hide')",1000);
                }
            }
        });
    });

    <?php //Удаление листа желаний ?>
    $('#wish_delete_submit').click(function () {
        event.preventDefault();
        //if(!validInputText($('#wishlist_name'), $('#helpBlock2'), $('#wish_edit_submit'))) return false;
        var delete_wishlist_id = $('#delete_wishlist_id').val();
        var submit = 'delete_wishlist';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "delete_wishlist_id=" + delete_wishlist_id + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['wishlist_res']) != 'undefined'){
                    $('#form_delete_wishlist').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('#t-b-' + delete_wishlist_id).fadeOut(100);
                    $('.c-b-' + delete_wishlist_id).fadeOut(100);

                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('#form_delete_wishlist').fadeIn()",2000);
                    setTimeout("$('.success-edit').fadeOut()",2000);

                }
                else{
                    $('#form_edit_wishlist').fadeOut(100);
                    $('#modal-wishlist-delete').text(data['wishlist_mess']);
                    setTimeout("$('#modal-wishlist-edit').modal('hide')",1000);
                }
            }
        });

        loadWishList();
    });

    <?php //Удаление продукта из листа желаний ?>
    $('#wish_delete_product_submit').click(function () {
        event.preventDefault();
        //if(!validInputText($('#wishlist_name'), $('#helpBlock2'), $('#wish_edit_submit'))) return false;
        var delete_wishlist_product_id = $('#delete_wishlist_product_id').val();
        var delete_from_wishlist = $('#delete_from_wishlist').val();
        var submit = 'delete_wishlist_product';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "delete_wishlist_product_id=" + delete_wishlist_product_id + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['wishlist_res']) != 'undefined'){
                    $('#form_delete_wishlist_product').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.pr-i-' + delete_wishlist_product_id).fadeOut(100);

                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('#form_delete_wishlist_product').fadeIn()",2000);
                    setTimeout("$('.success-edit').fadeOut()",2000);
                    loadWishList();
                }
                else{
                    $('#form_edit_wishlist').fadeOut(100);
                    $('#modal-wishlist-edit').text(data['wishlist_mess']);
                    setTimeout("$('#modal-wishlist-edit').modal('hide')",1000);
                }
            }
        });

    });
</script>