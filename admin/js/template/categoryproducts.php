<!-- DataTables -->
<script>

    <?php //передаем id страницы в попап окно на удаление ?>
    $(".btn-delete-pages").click(function () {
        $(".title-for-popup").text("Delete ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_delete_submit");
    });

    <?php //передаем id страницы в попап окно для скрытия на фронтэнде ?>
    $(".btn-hide-pages").click(function () {
        $(".title-for-popup").text("Hide ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_hide_submit");
    });

    <?php //передаем id страницы в попап окно для отображения на фронтэнде ?>
    $(".btn-show-pages").click(function () {
        $(".title-for-popup").text("Show ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_show_submit");
    });

    <?php //Удаление страницы ?>
    $(document).on("click",".page_delete_submit",function() {
        event.preventDefault();
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
                    setTimeout("$('.success-edit').fadeOut()",2000);

                }
                else{
                    $('#form_action_page').fadeOut(50);
                    $('.success-err').fadeIn(300);
                    $('.modal-title-err-mess').text(data['delete_pages_mess']);

                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-err').fadeOut()",4000);
                }
            }
        });
    });


    <?php //Показываем на фронтэнде ?>
    $(document).on("click", ".page_show_submit", function () {
        event.preventDefault();
        var pageId= $("#processed-page").val();
        var submit = 'show_pages';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "show_pages_id=" + pageId + "&submit=" + submit,
            dataType: "json",
            cache: false,

            success: function (data) {
                if(typeof(data['show_pages_res']) != 'undefined'){
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.b-s-p-' + pageId).prop('disabled','true');
                    $('.b-h-p-' + pageId).prop('disabled','');

                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-edit').fadeOut()",1000);

                }
                else{
                    $('#form_action_page').fadeOut(50);
                    $('.success-err').fadeIn(300);
                    $('.modal-title-err-mess').text(data['show_pages_mess']);

                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$('.success-err').fadeOut()",5000);
                    setTimeout("$.modal().close()",4000);
                }
            }
        });

    });

    <?php //Скрываем на фронтэнде ?>
    $(document).on("click", ".page_hide_submit", function () {
        event.preventDefault();
        var pageId= $("#processed-page").val();
        var submit = 'hide_pages';
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "hide_pages_id=" + pageId + "&submit=" + submit,
            dataType: "json",
            cache: false,

            success: function (data) {
                if(typeof(data['hide_pages_res']) != 'undefined'){
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.b-h-p-' + pageId).prop('disabled','true');
                    $('.b-s-p-' + pageId).prop('disabled','');

                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-edit').fadeOut()",1000);

                }
                else{
                    $('#form_action_page').fadeOut(100);
                    $('#modal-pages-action').text(data['hide_pages_mess']);
                    setTimeout("$.modal().close()",1000);
                }
            }
        });

    });
</script>