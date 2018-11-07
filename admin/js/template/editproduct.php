<script>
   $(document).ready(function(){
       // поля картинок галереи
       var max = 5;
       var min = 1;
       $("#del").attr("disabled", true);

       $("#add").click(function(){
           event.preventDefault();
           var total = $("input[name='package[]").length;
           if(total < max){
               $("#btnimg").append('<div><input class="bottom" type="text" placeholder="Package" value="" name="package[]"></div>');
               if(max == total + 1){
                   $("#add").prop("disabled", true);
               }
               $("#del").removeAttr("disabled");
           }
       });

       $("#del").click(function(){
           event.preventDefault();
           var total = $("input[name='package[]").length;
           if(total > min){
               $("#btnimg div:last-child").remove();
               if(min == total - 1){
                   $("#del").prop("disabled", true);
               }
               $("#add").prop("disabled", false);
           }

       });

       <?php //обрабатыаем превью добавленных изображений ?>
       function readImage (input) {
           //console.log(input.files.length);
           var maxSize=2200000, maxWidth=1200, maxHeight=1600;
           for(var i = 0; i < +(input.files.length); i++){
               if(maxSize > input.files[i]['size']) {

                   if (input.files && input.files[i]) {
                       if ((/\.(gif|jpg|jpeg|tiff|png)$/i).test(input.files[i]['name'])) {
                           var reader = new FileReader();
                           reader.onload = function (e) {
                               var newImg = $('<img width="100" class="prev_img" src="" id="object' + [i] + '">');
                               $(newImg).attr('src', e.target.result);
                               $(".image-preview").append(newImg);
                           };
                           //console.log(input.files[key]);
                           reader.readAsDataURL(input.files[i]);
                       } else {
                           alert('Некорректный загружаемый файл!');
                       }
                   }

               }else{
                   alert('Размер загружаемого изображения превышает 2 мегабайта!');
                   $("#photo").val("");
               }
           }
           //console.log(input.files[0]);

       }

       <?php //обрабатыаем клик по кнопке выбрать файл ?>
       data = new FormData();
       $('#gallery_img').change(function(){

           if($('.image-preview').children()){
               $('.image-preview').children().fadeOut(100);
           }

           readImage(this);

           files = this.files;
           $.each(files, function(key, value ){
               data.append(key, value );
           });

       });

       <?php //Вслучае асинхронной загрузки файлов на сервер ?>
       $(".submit_upload").click(function () {

           $.ajax({
               type: "POST",
               url: window.location.href,
               data: data,
               cache:false,
               contentType: false,
               processData: false,
               success: function(data) {

                   if (data == 'success') {
                       alert('Фото успешно загружено!');
                       if ($('.image-preview').children()) {
                           $('.image-preview').children().fadeOut(100);
                       }
                   }

                   else {
                       alert(data);
                   }
               }});
       });

       <?php //Удаление файлов галереи?>
       <?php //передаем id страницы в попап окно на удаление ?>
       $(".btn-delete-pages").click(function () {
           $(".title-for-popup").text("Delete ?");
           var btnId = $(this).data('page');
           var nameFile = $(this).data('name-file');
           $('#processed-page').val(btnId);
           $('#processed-file-del').val(nameFile);
           $("#action-btn").removeClass();
           $("#action-btn").addClass("page_delete_submit btn btn-warning");
       });
   });

    <?php //Удаление фото из галереи ?>
    $(document).on("click",".page_delete_submit",function() {
        event.preventDefault();
        var pageId= $("#processed-page").val();
        var pageFileDel= $("#processed-file-del").val();
        var pageBlockDel= pageFileDel.replace('.','_');
        var submit = 'delete_pages';

        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "delete_pages_id=" + pageId + "&pageFileDel=" + pageFileDel + "&submit=" + submit,
            dataType: "json",
            cache: false,
            success: function (data) {
                if(typeof(data['delete_pages_res']) != 'undefined'){
                    $('#form_action_page').fadeOut(50);
                    $('.success-edit').fadeIn(300);
                    $('.pg-' + pageBlockDel).fadeOut(100);

                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                    setTimeout("$('#form_action_page').fadeIn()",2000);
                    setTimeout("$('.success-edit').fadeOut()",2000);
                    setTimeout("$.modal().close()",1000);

                }
                else{
                    $('#form_action_page').fadeOut(100);
                    $('#modal-pages-action').text(data['delete_pages_mess']);
                    setTimeout("$('#modal-pages-action').modal('hide')",1000);
                }
            }
        });
    });
</script>