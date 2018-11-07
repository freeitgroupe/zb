<?php //поиск в хедере сайта?>
<script>

    <?php //передаем id страницы в попап окно на аннулирование акции ?>
    $(".btn-cancel-pages").click(function () {
        $(".title-for-popup").text("Cancel ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_cancel_submit");
    });



    <?php //передаем id страницы в попап окно на удаление ?>
    $(".btn-delete-pages").click(function () {
        $(".title-for-popup").text("Delete ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_delete_submit");
    });

    <?php //Удаление страницы ?>
    $(document).on("click",".page_delete_submit, .page_cancel_submit",function() {
        var pageId= $("#processed-page").val();
        var submit = $(event.target).attr('class');
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "pages_id=" + pageId + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['action_pages_res']) != 'undefined'){
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    if(submit == 'page_delete_submit'){
                        $('.pg-' + pageId).fadeOut(100);
                    }
                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-edit').fadeOut()",1500);

                }
                else{
                    $('#form_action_page').fadeOut(50);
                    $('.success-err').fadeIn(300);
                    $('.modal-title-err-mess').text(data['action_pages_mess']);

                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-err').fadeOut()",4000);
                }
            }
        });
        event.preventDefault();
    });
</script>