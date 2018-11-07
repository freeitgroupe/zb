<script>
    <?php //передаем id страницы в попап окно на удаление ?>

    $(".btn-delete-pages").click(function () {
        $(".title-for-popup").text("Delete ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_delete_submit");
    });

    <?php //Удаление страницы ?>
    $(document).on("click",".page_delete_submit",function(evt) {
        evt.preventDefault()
        //event.preventDefault();
        var pageId= $("#processed-page").val();
        var submit = 'delete_pages';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "delete_pages_id=" + pageId + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['delete_pages_res']) != 'undefined'){
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.pg-' + pageId).fadeOut(100);

                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-edit').fadeOut()",1500);

                }
                else{
                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-err').fadeOut()",4000);
                }
            }
        });
    });
</script>