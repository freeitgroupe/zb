<script type="text/javascript">

    $(document).ready(function() {
        $("#form_reg").submit(function(e){
            //return false;
        });

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
                        err_mess_block.text('INCORRECT EMAIL');
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

        $("input").blur(function(){
            //$(this).removeClass('has-error')
        });

        <?php //обрабатываем данные при отправке регистрации ?>
        $(".confirm").click(function() {
            event.preventDefault();

            var reg_email, reg_pass,  reg_pass_again, mess;
            var err_mess_block = $("#helpBlock2");
            var pattern = /\*{6,20}$/i;
            var btn_submit = $(".confirm");
            mess ='';

            //получаем данные из формы
            reg_email = $.trim($("#reg_email").val());
            reg_pass = $.trim($("#reg_pass").val());
            reg_pass_again = $.trim($("#reg_pass_again").val());

            //заносим обязательные данные в массив
            var verification_arr =
                {
                    'reg_email' : reg_email,
                    'reg_pass' :reg_pass,
                    'reg_pass_again':reg_pass_again
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

            if(reg_pass !== reg_pass_again){
                err_mess_block.fadeIn(200);
                err_mess_block.text('The passwords you entered do not match!');
                return false;
            }

            if(reg_pass.search(pattern) !== 0){
                err_mess_block.fadeOut(200);
            }else{
                err_mess_block.fadeIn(200);
                err_mess_block.text('Specify at least 6 characters!');
                $("#reg_pass").addClass('has-error');
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

                $.ajax({
                    type: "POST",
                    url: window.location.href,
                    data: data,
                    cache:false,
                    contentType: false,
                    processData: false,
                    success: function(data) {
                        if (data == 'true') {
                            err_mess_block.fadeIn(200);
                            err_mess_block.text('Successful registration!');
                            err_mess_block.addClass("has-good");

                            $('#reg_email').val('');
                            $('#reg_pass').val('');
                            $('#reg_pass_again').val('');
                            $("#form_reg").find("input").removeClass("has-error");
                            btn_submit.attr('disabled', false);
                            btn_submit.removeClass('has-load');
                        }
                        else {
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