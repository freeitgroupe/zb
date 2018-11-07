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
                '<option value="text">text</option>' +
                '<option value="textarea">textarea</option>' +
                '<option value="number">number</option>' +
                '<option value="radio">radioButton</option>' +
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
</script>

<script>
    window.CKEDITOR_BASEPATH = "<?=PATH_ADMIN?>js/ckeditor/";
</script>

<script src="<?=PATH_ADMIN?>js/ckeditor/ckeditor.js"></script>    <!-- -->
<script>
//    CKEDITOR.replace('editckeditor');
</script>

