<!-- DataTables -->
<script src="<?=PATH_ADMIN?>include/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<?=PATH_ADMIN?>include/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
    <?php //Инициализация table ?>

    $(function () {
        $('#table-pages_product').DataTable()
    });
</script>

<script>
    <?php //передаем id страницы в попап окно для скрытия на фронтэнде ?>
    $(".btn-hide-pages").click(function () {
        $(".title-for-popup").text("Убрать фильтр для данного продукта?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("login-btn-form page_hide_submit");
    });

    <?php //передаем id страницы в попап окно для отображения на фронтэнде ?>
    $(".btn-show-pages").click(function () {
        $(".title-for-popup").text("Добавить фильтр для данного продукта?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("login-btn-form page_show_submit");
    });

    <?php //передаем id страницы в попап окно для скрытия на фронтэнде ?>
    $(".btn-hide-pages").click(function () {
        $(".title-for-popup").text("Скрыть на сайте?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("login-btn-form page_hide_submit");
    });

    <?php //передаем id страницы в попап окно для отображения на фронтэнде ?>
    $(".btn-show-pages").click(function () {
        $(".title-for-popup").text("Показать на сайте ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("login-btn-form page_show_submit");
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
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$('.success-edit').fadeOut()",2000);

                }
                else{
                    $('#form_action_page').fadeOut(50);
                    $('.success-err').fadeIn(300);
                    $('.modal-title-err-mess').text(data['show_pages_mess']);

                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$('.success-err').fadeOut()",4000);
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
                    setTimeout("$('.success-edit').fadeOut()",2000);

                }
                else{
                    $('#form_action_page').fadeOut(100);
                    $('#modal-pages-action').text(data['hide_pages_mess']);
                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                }
            }
        });

    });

</script>

<script>
    // поля картинок галереи
    var max = 10;
    var min = 1;
    $("#del_param").attr("disabled", true);

    $("#add_param").click(function(){
        var total = $("input[name='value_filter[]']").length;
        if(total < max){
            $("#param_fil").append('<div><input type="text" class="form-control profile-input form-group" name="value_filter[]" /></div>');
            if(max == total + 1){
                $("#add_param").prop("disabled", true);
            }
            $("#del_param").removeAttr("disabled");
        }
    });
    $("#del_param").click(function(){
        var total = $("input[name='value_filter[]']").length;
        if(total > min){
            $("#param_fil div:last-child").remove();
            if(min == total - 1){
                $("#del_param").prop("disabled", true);
            }
            $("#add_param").prop("disabled", false);
        }
    });
</script>

