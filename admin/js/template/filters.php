<!-- DataTables -->
<script src="<?=PATH_ADMIN?>include/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="<?=PATH_ADMIN?>include/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>

<script>
    <?php //Инициализация table ?>

    $(function () {
        $('#table-pages').DataTable()
    });

    <?php //передаем id страницы в попап окно на удаление ?>
    $(".btn-delete-pages").click(function () {
        $(".title-for-popup").text("Удалить ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("login-btn-form page_delete_submit");
        $(".rename-form").hide();
    });

    <?php //передаем id страницы в попап окно на событие -> ?>
    $(".btn-rename-pages").click(function () {
        $(".title-for-popup").text("Переименовать ?");
        var btnId = $(this).data('page');
        var name_input_filter = $(this).data('title');        
        $('#processed-page').val(btnId);

        $("#action-btn").removeClass();
        $("#action-btn").addClass("login-btn-form page_rename_submit btn btn-success");

        //открываем инпут для ввода и редактирования имени
        $(".rename-form").show();
        $("#filter_name").val(name_input_filter);


    });

    
    <?php //Удаление ?>
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
                    setTimeout("$('.success-edit').fadeOut()",2000);

                }
                else{
                    $('#form_action_page').fadeOut(50);
                    $('.success-err').fadeIn(300);
                    $('.modal-title-err-mess').text(data['delete_pages_mess']);

                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$('.success-err').fadeOut()",4000);
                }
            }
        });
    });

    <?php //Обработка полей формы удаляем класс ошибки ?>
    $("input").click(function () {
        $(this).parent().removeClass('has-error');
        $('#helpBlock2').text('');
    });


    <?php //Редактировнаие имени фильтра ?>
    $(document).on("click",".page_rename_submit",function() {
        event.preventDefault();
        if(!validInputText($('#filter_name'), $('#helpBlock2'), $('.page_rename_submit'))) return false;
        var param_name = $('#filter_name').val();
        var param_id = $('#processed-page').val();
        var submit = 'event_rename';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "param_name=" + param_name + "&param_id=" + param_id + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['success_result']) != 'undefined'){
                    var name_title = data['param_response_name'];

                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    
                    $('#list-filter' + param_id).text(name_title);
                    $('.ed-' + param_id).data('title', name_title);

                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$('.success-edit').fadeOut()",2000);
                    
                }
                else{
                    $('#form_action_page').fadeOut(50);
                    $('.success-err').fadeIn(300);
                    $('.modal-title-err-mess').text(data['pages_mess']);

                    setTimeout("$('#modal-pages-action').modal('hide')",3000);
                    setTimeout("$('#form_action_page').fadeIn()",4000);
                    setTimeout("$('.success-err').fadeOut()",4000);
                }
            }
        });
    });
    

    
</script>