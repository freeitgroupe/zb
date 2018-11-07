<script>
    <?php //Ф-я Валидация email адреса ?>
    function validPattern(argument_input, err_mess_block, btn_submit, valid_pattern){
        var pattern = valid_pattern;
        var alert_text = 'INCORRECT PHONE! Matches: 1-(123)-123-1234 | 123 123 1234 | 1-800-ALPHNUM';
        if(valid_pattern === 'phone'){
            pattern = /^(\s*)?(\+)?([- _():=+]?\d[- _():=+]?){10,16}(\s*)?$/i;
            alert_text = 'The phone field must not be empty! Matches: 1-(123)-123-1234 | 123 123 1234 | 1-800-ALPHNUM!';

        }
        if(valid_pattern === 'email'){
            pattern = /^[a-z0-9_-]+@[a-z0-9-]+\.[a-z]{2,6}$/i;
            alert_text = 'The e-mail field must not be empty!';
        }
        if(valid_pattern === 'name'){
            pattern = /^[a-zA-Z0-9- _А-Яа-я]{3,25}/;
            alert_text = 'The name field must not be empty (3-25 characters)!';
        }
        if(valid_pattern === 'address'){
            pattern = /^[a-zA-Z0-9- _А-Яа-я().,]{3,100}/;
            alert_text = 'The address field must not be empty (3-100 characters)!';
        }
        if(valid_pattern === 'zipcode'){
            pattern = /^[0-9]{4,5}$/i;
            alert_text = 'The zipcode do not correct!';
        }

        var argument = argument_input;
        argument.blur(function(){
            if($.trim(argument.val()) != ''){
                if(argument.val().search(pattern) == 0){
                    err_mess_block.fadeOut(200);
                    btn_submit.attr('disabled', false);
                    argument.removeClass('has-error');
                }else{
                    err_mess_block.fadeIn(200);
                    err_mess_block.text(alert_text);
                    btn_submit.attr('disabled', true);
                    argument.addClass('has-error');
                    return false;
                }
            }else{
                err_mess_block.fadeIn(200);
                err_mess_block.text(alert_text);
                argument.addClass('has-error');
                btn_submit.attr('disabled', true);
                return false;
            }
        });
        return false;
    }

    <?php //вызов ф-ии валидации phone?>
    //validPattern($("#phone"), $("#helpBlock2"), $(".confirm_type_1"), 'phone');
    <?php //вызов ф-ии валидации email?>
    validPattern($("#email"), $("#helpBlock2"), $(".confirm_type_1"), 'email');
    <?php //вызов ф-ии валидации name?>
    validPattern($("#name"), $("#helpBlock2"), $(".confirm_type_1"), 'name');
    <?php //вызов ф-ии валидации алреса?>
    validPattern($("#zipcode"), $("#helpBlock2"), $(".confirm_type_2"), 'zipcode');
    <?php //вызов ф-ии валидации zipcode?>


    <?php //вылидация полей ?>
    $(document).on('click', '.confirm_type_1, .confirm_type_2,.confirm_type_final', function(evt){
        evt.preventDefault();
        var $event_type = $(this).attr('id');
        var $form ='';
        var $inputs ='';
        var $errMes  = [];
        var $element = '';
        var $mess    = '';

        if($event_type == 'confirm_type_1'){
            $form = $('#confirm-form');
            $inputs = $form.find("input, select, textarea");
        }

        if($event_type == 'confirm_type_2'){
            $form = $('#confirm-form_1');
            $inputs = $form.find("input, textarea");
        }

        if($event_type == 'confirm_type_final'){
            $form = $('#confirm-form_2');
            //$inputs = $form.find("input#tag-radio-pay-defUser");
        }

        $.each($inputs, function(i, val) {
            if($.trim($(val).val()) == ''){
                $errMes[[$(val).attr('name')]] = 'err';
                $element = $(val).attr('id');
                $('#' + $element).addClass('has-error');
                $mess = $mess + $element + '/';
            }
        });

        var $data;
        $data = $form.serialize();
        $.ajax({
            type: "POST",
            url: '/checkout',
            data: $data,
            dataType: "json",
            cache: false,
            success: function(data) {
                //alert($data);
                if(data['response'] == 'true' && $event_type == 'confirm_type_1'){
                    $('.detail-info').fadeOut(200);
                    $('.detail-delivery').fadeIn(300);
                }

                if(data['response'] == 'true' && $event_type == 'confirm_type_2'){
                    $('.detail-delivery').fadeOut(200);
                    $('.detail-pay').fadeIn(300);
                    $('.personlaCartInformation .nameInfo').text('Name : ' + data['user_name']);
                    $('.personlaCartInformation .addressInfo').text('Address : ' + data['user_address']);
                    $('.personlaCartInformation .zipcodeInfo').text('ZipCode : ' + data['user_zipcode']);
                    $('.personlaCartInformation .phoneInfo').text('Phone : ' + data['user_phone']);
                    $('.personlaCartInformation .emailInfo').text('Email : ' + data['user_email']);
                    $('.totalRate').text('Rate : ' + data['rate'] + ' USD');
                }

                if(data['response'] == 'true' && $event_type == 'confirm_type_final'){
                    $('.cartDiscount').fadeOut(200);
                    $('.detail-pay').fadeOut(200);
                    $("#mess-confirm").fadeIn(200);
                    $("#mess-confirm").html(data['message']);

                }

                if(data['response'] == false){
                    alert(data['mess']);
                }
            },
            error: function() {
                alert($data);
            }
        });
    });

    $(document).on('click', '.back_to_type_1', function(){
        $('.detail-delivery').fadeOut(200);
        $('.detail-info').fadeIn(300);
    });

    $(document).on('click', '.back_to_type_2', function(){
        $('.detail-pay').fadeOut(200);
        $('.detail-delivery').fadeIn(300);
    });

    <?php //обрабатываем данные при отправке регистрации ?>
    $(document).on('click', '.confirm-log', function(){
        event.preventDefault();

        var err_mess_block = $("#helpBlock2");
        var pattern = /\*{6,20}$/i;
        var btn_submit = $(".confirm-log");
        var $val_name = $.trim($("#valid_name").val());
        var $val_mail = $.trim($("#valid_email").val());
        var $val_phone = $.trim($("#valid_phone").val());
        mess ='';

        //console.log($val_mail);
        if($val_mail=='false' || $val_name=='false' || $val_phone=='false'){
            err_mess_block.text('INCORRECT INPUT!');
            return false;
        }
        else {
            err_mess_block.fadeOut(200);
            err_mess_block.text('');
        }

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



    });

</script>