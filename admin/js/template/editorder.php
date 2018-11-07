<script>
    <?php //передаем id страницы в попап окно на удаление ?>
    $(document).ready(function(){
        $(".btn-delete-pages").click(function () {
            $(".title-for-popup").text("Delete ?");
            <?php // id из order_items ?>
            var btnId = $(this).data('page');
            $('#processed-page').val(btnId);
            $("#action-btn").removeClass();
            $("#action-btn").addClass("login-btn-form page_delete_submit btn btn-success");
        });

        <?php // передаем id ордера в попап окно при обновлении цены ?>
        $(".new-qty").click(function () {
            $(".title-for-popup").text("Update qty ?");
            <?php // id из order_items ?>
            $("#processed-page").val($(this).data('page'));
            <?php // новое количество товара ?>
            $("#processed-page-param-1").val($("#val-qty-" + $(this).data('page')).val());
            <?php // order_id для order_items ?>
            $("#processed-page-param-2").val($(this).data('order-id'));
            $("#action-btn").removeClass();
            $("#action-btn").addClass("login-btn-form page_new_qty_submit btn btn-success");
            //alert($("#val-qty-" + $(this).data('page')).val());
        });

        <?php //Удаление ?>
        $(document).on("click",".page_delete_submit",function() {
            event.preventDefault();
            var pageId= $("#processed-page").val();
            var submit = 'page_delete_submit';
            $.ajax({
                type: "POST",
                url: window.location.href,
                data: "order_item_id=" + pageId + "&submit=" + submit,
                dataType: "json",
                cache: false,
                success: function (data) {
                    if(typeof(data['res']) != 'undefined'){
                        $('#form_action_page').fadeOut(50);
                        $('.success-edit').fadeIn(300);
                        $('.pg-' + pageId).fadeOut(100);
                        $('.total-sum').text(' '+(accounting.formatNumber(data['total_sum_order'], 2, " ", ",")) + "<?= $currency?>");
                        $('.log-record').prepend("<p>"+data['record_log']+"</p>");
                        setTimeout("$.modal().close()",1000);
                        setTimeout("$('#form_action_page').fadeIn()",2000);
                        setTimeout("$('.success-edit').fadeOut()",2000);
                    }
                    else{
                        $('#form_action_page').fadeOut(50);
                        $('.success-err').fadeIn(300);
                        $('.modal-title-err-mess').text(data['messages']);
                        setTimeout("$.modal().close()",3000);
                        setTimeout("$('#form_action_page').fadeIn()",4000);
                        setTimeout("$('.success-err').fadeOut()",4000);
                    }
                }
            });
        });

        <?php //Обновление количества товара ?>
        $(document).on("click",".page_new_qty_submit",function() {
            event.preventDefault();
            var pageId= $("#processed-page").val();
            var pageParam_1= $("#processed-page-param-1").val();
            var pageParam_2= $("#processed-page-param-2").val();
            var submit = 'page_new_qty_submit';

            $.ajax({
                type: "POST",
                url: window.location.href,
                data: "order_item_id=" + pageId + "&new_qty=" + pageParam_1 + "&order_id=" + pageParam_2 + "&submit=" + submit,
                dataType: "json",
                cache: false,
                success: function (data) {
                    if(typeof(data['res']) != 'undefined'){
                        $('#form_action_page').fadeOut(50);
                        $('.success-edit').fadeIn(300);
                        //$('.pg-' + pageId).fadeOut(100);
                        $('.td-summ-' + pageId).text(data['new_price_for_item']);
                        $('.total-sum').text(' '+(accounting.formatNumber(data['total_sum_order'], 2, " ", ",")) + "<?= $currency?>");
                        $('.log-record').prepend("<p>"+data['record_log']+"</p>");
                        setTimeout("$.modal().close()",1000);
                        setTimeout("$('#form_action_page').fadeIn()",2000);
                        setTimeout("$('.success-edit').fadeOut()",2000);

                    }
                    else{
                        $('#form_action_page').fadeOut(50);
                        $('.success-err').fadeIn(300);
                        $('.modal-title-err-mess').text(data['messages']);
                        setTimeout("$.modal().close()",3000);
                        setTimeout("$('#form_action_page').fadeIn()",4000);
                        setTimeout("$('.success-err').fadeOut()",4000);
                    }
                }
            });
        });
    });

</script>