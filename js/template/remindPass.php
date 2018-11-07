<script>
$(document).ready(function() {
    <?php //Ф-я Валидация email адреса ?>
    function validEmail(email, err_mess_block, btn_submit){
        var pattern = /^[a-z0-9_-]+@[a-z0-9-]+\.[a-z]{2,6}$/i;
        var mail = email;
        mail.blur(function(){
            if(mail.val() != ''){
                if(mail.val().search(pattern) == 0){
                    err_mess_block.fadeOut(200);
                    // err_mess_block.text('');
                    btn_submit.attr('disabled', false);
                    mail.removeClass('has-error');
                    //return true;
                }else{
                    //err++;
                    err_mess_block.fadeIn(200);
                    err_mess_block.text('INCORRECT EMAIL!');
                    btn_submit.attr('disabled', true);
                    mail.addClass('has-error');
                    return false;
                }
            }else{
                err_mess_block.fadeIn(200);
                err_mess_block.text('The e-mail field must not be empty!');
                mail.addClass('has-error');
                btn_submit.attr('disabled', true);
                return false;
            }
        });
        return false;
    }
    <?php //вызов ф-ии валидации email?>
    validEmail($("#reg_email"), $("#helpBlock2"), $("#conf_reg"));

    <?php //обрабатываем данные при отправке регистрации ?>
    $(".confirm").click(function(ev) {
        ev.preventDefault();
        var reg_email, mess;
        var err_mess_block = $("#helpBlock2");
        var pattern = /\*{6,20}$/i;
        var btn_submit = $(".confirm");
        mess ='';
        //получаем данные из формы
        reg_email = $.trim($("#reg_email").val());
        //заносим обязательные данные в массив
        var verification_arr =
            {
                'reg_email' : reg_email
            };

        for(var key in verification_arr){
            if(verification_arr[key] == '')
                mess = mess + key + '-';
            $("#"+key).addClass('has-error');
        }
        if(mess > ''){
            alert("Fill in required fields!");
            return false;
        }
        if (mess=='')
        {
            btn_submit.attr('disabled', true);
            btn_submit.addClass('has-load');
            //AJAX
            $.ajax({
                type: "POST",
                url: window.location.href,
                dataType: "html",
                data: "email="+reg_email+"&event_remind=true",
                cache: false,
                success: function(data) {
                    if (data == 'yes')
                    {
                        err_mess_block.fadeIn(200);
                        err_mess_block.text('A letter has been sent to your e-mail!');
                        err_mess_block.addClass("has-good");
                        $('#reg_email').val('');
                        $("#form_reg").find("input").removeClass("has-error");
                        btn_submit.attr('disabled', false);
                        btn_submit.removeClass('has-load');
                    }else
                    {
                        err_mess_block.fadeIn(200);
                        err_mess_block.text(data);
                        btn_submit.attr('disabled', false);
                        btn_submit.removeClass('has-load');
                    }
                }
            });
        }
    });
});
</script>