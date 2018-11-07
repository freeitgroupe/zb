<script>
    <?php //Удаление файлов галереи?>
    <?php //передаем id страницы в попап окно на удаление для превью акции ?>
    $(".btn-delete-img").click(function () {
        $(".title-for-popup").text("Delete ?");
        var btnId = $(this).data('page');
        var nameFile = $(this).data('name-file');
        $('#processed-page').val(btnId);
        $('#processed-file-del').val(nameFile);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_delete_img");
    });

    <?php //передаем id страницы в попап окно на удаление для лого акции ?>
    $(".btn-delete-thumbnail").click(function () {
        $(".title-for-popup").text("Delete ?");
        var btnId = $(this).data('page');
        var nameFile = $(this).data('name-file');
        $('#processed-page').val(btnId);
        $('#processed-file-del').val(nameFile);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_delete_thumbnail");
    });

    <?php //Удаление фото из галереи ?>
    $(document).on("click",".page_delete_img, .page_delete_thumbnail",function() {
        event.preventDefault();
        var pageId= $("#processed-page").val();
        var pageFileDel= $("#processed-file-del").val();
        var pageBlockDel= pageFileDel.replace('.','_');
        var submit = $(event.target).attr('class');

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "delete_pages_id=" + pageId + "&pageFileDel=" + pageFileDel + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['action_pages_res']) != 'undefined'){
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.pg-' + pageBlockDel).fadeOut(100);
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
                    setTimeout("$.modal().close()",3000);
                    setTimeout("$('.success-err').fadeOut()",4000);
                }
            }
        });
    });
</script>