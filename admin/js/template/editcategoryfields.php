<script>
    $(function () {
        if(typeof(numi) == 'undefined'){var numi = 0;}
        $("#createParam").click(function () {
            alert(numi);
            $('#addition-attribute').before(
                '<tr>' +
                '<td><input type="text" class="form-control" name="additional_attribute['+numi+'][additionaltext_label]" id="additional_attribute['+numi+'][additionaltext_label]" placeholder="Название поля"></td>' +
                '<td><input type="text" class="form-control" name="additional_attribute['+numi+'][position_val]" id="position_val[]" placeholder="Позиция поля"></td>' +
                '<td><textarea type="text" class="form-control" name="additional_attribute['+numi+'][description_val]" id="description_val[]" placeholder="Описание к полю"></textarea></td>' +
                '<td>' +
                '<select type="text" class="form-control" name="additional_attribute['+numi+'][type_val]" id="type_val[]">' +
                '<option value="text">Text</option>' +
                '<option value="textarea">Textarea</option>' +
                '<option value="number">Number</option>' +
                '<option value="radio">Radio</option>' +
                '<option value="checkbox">Chechbox</option>' +
                '<option value="link">link</option>' +
                '</select>' +
                '</td>' +
                '<td><span class="btn btn-danger minus pull-right">&ndash;</span></td>' +
                '</tr>'
            );
            numi = numi + 1;
        });

        $(document).on('click', '.minus', function() {
            $(this).closest('tr').remove();
        });
    });

    <?php //передаем id страницы в попап окно на удаление ?>
    $(".btn-delete-pages").click(function () {
        $(".title-for-popup").text("Delete ?");
        var btnId = $(this).data('page');
        $('#processed-page').val(btnId);
        $("#action-btn").removeClass();
        $("#action-btn").addClass("page_delete_submit");
    });

    <?php //передаем данные по дополнительным параметрам в попап окно на редактирование ?>
    var additionaltext_label, id_val, position_val, type_val, description_val;
    $(".btn-edit-pages").click(function () {
        $('.new-field-block').hide();
        $('.editable-field-block').show();

        $(".title-for-popup").text("Edit Param");

        additionaltext_label = $(this).data('additionaltext_label');
        $('#additionaltext_label').val(additionaltext_label);

        id_val = $(this).data('id_val');
        $('#id_val').val(id_val);

        position_val = $(this).data('position_val');
        $('#position_val').val(position_val);

        type_val = $(this).data('type_val');
        $('#type_val').val(type_val);

        description_val = $(this).data('description_val');
        $('#description_val').val(description_val);

        init_id = $(this).data('init_id');
        $('#init_id').val(init_id);
        $('#init_id').attr("hidden");

        //$('#processed-page').val(btnId);
        //$('#selectorId option:selected').val();
        $("#action-btn").removeClass();
        $("#action-btn").addClass("edit_attribute_fields");
        event.preventDefault();
    });
    $(document).on('click', '#cancel-edit', function(){
        $('.editable-field-block').hide();
        $('.new-field-block').show();
        event.preventDefault();
    });

    <?php //Редактироваие страницы ?>
    $(document).on("click",".edit_attribute_fields",function() {
        var pageId = $("#processed-page").val();
        var submit = 'edit_attribute_fields';
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "additionaltext_label=" + additionaltext_label + "&id_val=" + id_val + "&position_val=" + position_val + "&type_val="+type_val + "&description_val=" + description_val + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['edit_pages_res']) != 'undefined')
                {
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.pg-' + pageId).fadeOut(100);
                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-edit').fadeOut()",2000);
                }
                else
                {
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


    <?php //Удаление страницы ?>
    $(document).on("click",".page_delete_submit",function() {
        var pageId= $("#processed-page").val();
        var submit = 'delete_pages';
        event.preventDefault();
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "delete_pages_id=" + pageId + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['delete_pages_res']) != 'undefined')
                {
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.pg-' + pageId).fadeOut(100);
                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$.modal().close()",1000);
                    setTimeout("$('.success-edit').fadeOut()",2000);
                }
                else
                {
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

</script>

