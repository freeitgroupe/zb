<script>
    <?php //Ф-я Валидация email адреса ?>
    function validEmail(email, err_mess_block, btn_submit){
        var pattern = /^[a-z0-9_-]+@[a-z0-9-]+\.[a-z]{2,6}$/i;
        var mail = email;
        var valid_mail = $('#valid_email');
        mail.blur(function(){
            if(mail.val() != ''){
                if(mail.val().search(pattern) == 0){
                    err_mess_block.fadeOut(200);
                    // err_mess_block.text('');
                    btn_submit.attr('disabled', false);
                    mail.removeClass('has-error');
                    valid_mail.val('true');
                    //return true;
                }else{
                    //err++;
                    err_mess_block.fadeIn(200);
                    err_mess_block.text('INCORRECT EMAIL!');
                    btn_submit.attr('disabled', true);
                    mail.addClass('has-error');
                    valid_mail.val('false');
                    return false;
                }
            }else{
                err_mess_block.fadeIn(200);
                err_mess_block.text('The e-mail field must not be empty!');
                mail.addClass('has-error');
                btn_submit.attr('disabled', true);
                valid_mail.val('false');
                return false;
            }
        });
        return false;
    }

    <?php //вызов ф-ии валидации email?>
    validEmail($("#log_email"), $("#helpBlock2"), $("#confirm-log"));

    <?php //обрабатываем данные при отправке регистрации ?>
    $(document).on('click', '.confirm-log', function(ev){
        ev.preventDefault();
        //console.log(typeof($("#valid_email").val()));

        var log_email,log_pass,mess;
        var err_mess_block = $("#helpBlock2");
        var pattern = /\*{6,20}$/i;
        var btn_submit = $(".confirm-log");
        var $val_mail = $("#valid_email").val();
        mess ='';

        //console.log($val_mail);
        if($val_mail=='false'){
            err_mess_block.text('INCORRECT EMAIL!!!');
            return false;
        }
        else
        {
            err_mess_block.fadeOut(200);
            err_mess_block.text('');
        }

        //получаем данные из формы
        log_email = $.trim($("#log_email").val());
        log_pass = $.trim($("#log_pass").val());

        //заносим обязательные данные в массив
        var verification_arr =
            {
                'log_email' : log_email,
                'log_pass' :log_pass
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

        if(log_pass.length >= 6){
            err_mess_block.fadeOut(200);
        }else{
            err_mess_block.fadeIn(200);
            err_mess_block.text('Specify at least 6 characters!');
            $('#log_pass').addClass('has-error');
            return false;
        }

        if (mess=='')
        {
            var data = new FormData();
            $.each(verification_arr, function(key, value ){
                data.append(key, value);
            });

            btn_submit.attr('disabled', true);
            btn_submit.addClass('has-load');
            setTimeout(myAjax, 2000);
            function myAjax() {
                $.ajax({
                    type: "POST",
                    url: window.location.href,
                    data: "login="+log_email+"&pass="+log_pass+"&captcha="+grecaptcha.getResponse(),
                    dataType: "json",
                    cache: false,
                    success: function(data) {

                        if (data['auth'] == 'yes')
                        {
                            window.location.replace("/");
                            err_mess_block.fadeIn(200);
                            err_mess_block.text('Successful!');
                            err_mess_block.addClass("has-good");

                            $('#log_email').val('');
                            $('#log_pass').val('');
                            $("#form_auth").find("input").removeClass("has-error");
                            btn_submit.attr('disabled', false);
                            btn_submit.removeClass('has-load');

                            $('#auth-info').text('logout');
                            $('#auth-info').attr('href', 'logout');

                        }
                        else
                        {
                            err_mess_block.fadeIn(200);
                            err_mess_block.text(data['text']);
                            btn_submit.attr('disabled', false);
                            btn_submit.removeClass('has-load');

                            if(data['fealt'] > 2){
                                $('.auth').show();
                                //$('.auth').replaceWith(data['protect']);
                            }
                        }
                    }
                });
            }
        }
    });
</script>

<?php // пост запрос при авторизации через facebook?>
<script>
//    $(document).on('click', '.loginFacebook', function(ev){
//        ev.preventDefault();
//        $.ajax({
//            type: "POST",
//            url: window.location.href,
//            data: "facebookAuth=true",
//            dataType: "html",
//            cache: false,
//            success: function(data) {
//                if (data['auth'] == 'yes') {
//                    window.location.replace("/");
//                }
//            }
//        })
//    });
</script>
