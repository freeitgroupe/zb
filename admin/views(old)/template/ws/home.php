<?php defined("CATALOG") or die("Access denied");?>
<?php require_once "header.php"?>
            <div class="col-md-9" id="right-cont-prof">

                <?php //require_once "message.php"?>
                <style>
                    .tabs__content {
                        display: none; /* по умолчанию прячем все блоки */
                    }
                    .tabs__content.active {
                        display: block; /* по умолчанию показываем нужный блок */
                    }
                </style>
                <div class="tabs tabs-nav-info-prod">
                    <ul class="tabs__caption tabs-nav-info-profile">
                        <li class="tabs-nav tabs-nav-profile active"><i class="fa fa-edit"></i>Профиль</li>
                        <li class="tabs-nav tabs-nav-profile"><i class="fa fa-gears"></i> Смена пароля</li>
                        <li class="tabs-nav tabs-nav-profile"><i class="fa fa-wechat"></i> Социальные сети</li>
                    </ul>
                    <div class="tabs__content active">



                        <h1>Настройки профиля</h1>
                        <div class="profile-option">
                            <div class="block-form-profile">
                                <form action="/profile" method="post">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Имя<sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="text" class="form-control profile-input"
                                                       value="<?=$_SESSION['auth_name']?>" name="name" >
                                                <input type="text" hidden name="id" value="<?=$_SESSION['auth_id']?>">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Отчество<sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="text" class="form-control profile-input"
                                                       value="<?=$_SESSION['auth_patronymic']?>" name="patronymic" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Фамилия<sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="text" class="form-control profile-input"
                                                       value="<?=$_SESSION['auth_surname']?>" name="surname" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Пол <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <div class="line-block">
                                                    <input type="radio" id="tag-radio1" name="sex" value="2" class="stl" <?php if($_SESSION['auth_sex'] == '2'):?>checked<?php endif;?>>
                                                    <label for="tag-radio1" class="stl stl-right">
                                                        <span></span>
                                                        <p class="text-fl">Мужской</p>
                                                    </label>
                                                </div>
                                                <div class="line-block">
                                                    <input type="radio" id="tag-radio2" name="sex" value="1" <?php $_SESSION['auth_sex'] == '1' ? print 'checked' : ''?>
                                                           class="stl">
                                                    <label for="tag-radio2" class="stl stl-right">
                                                        <span></span>
                                                        <p class="text-fl">Женский</p>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Телефон <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8" id="phone-info">
                                            <?php if (!empty($_SESSION['auth_phone'])):?>
                                               <?php if(is_array($_SESSION['auth_phone'])):?>
                                                    <?php foreach ($_SESSION['auth_phone'] as $phone):?>
                                                        <div class="input-block-form list-phone">
                                                            <input type="text" class="form-control profile-input phone" name="phone[]" value="<?=$phone?>">
                                                        </div>
                                                    <?php endforeach;?>
                                               <?php else:?>
                                                    <div class="input-block-form list-phone">
                                                        <input type="text" class="form-control profile-input phone" name="phone[]" value="<?=$_SESSION['auth_phone']?>">
                                                    </div>
                                                <?php endif;?>
                                                
                                            <?php else:?>
                                                <div class="input-block-form list-phone">
                                                    <input type="text" class="form-control profile-input phone" name="phone[]" placeholder="+38(098)567-44-05"
                                                           value="">
                                                </div>
                                            <?php endif;?>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Дополнительный телефоны</h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <a class="add-info" href="#">+ Добавить телефон</a>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Email <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="text" class="form-control profile-input" value="<?=$_SESSION['auth_email']?>" name="email" placeholder="Например, test@gmail.com">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Дата рождения </h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="text" class="form-control profile-input date" value="<?php if(!empty($_SESSION['auth_birthday'])){ print $_SESSION['auth_birthday'];}?>" placeholder="01-01-1980" name="birthday">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Город </h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="text" class="form-control profile-input" value="<?=$_SESSION['auth_city']?>" placeholder="Например: Киев" name="city">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Адрес доставки </h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <textarea type="text" class="form-control profile-input" placeholder="" name="address"><?=$_SESSION['auth_address']?></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Зарегистрироваться как <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <div class="line-block">
                                                    <input type="radio" id="tag-radio-defUser" name="type" value="0" class="stl" <?php if($_SESSION['auth_type'] == '0'):?>checked<?php endif ?>>
                                                    <label for="tag-radio-defUser" class="stl stl-right">
                                                        <span></span>
                                                        <p class="text-fl">Частное лицо</p>
                                                    </label>
                                                </div>
                                                <div class="line-block">
                                                    <input type="radio" id="tag-radio-bsnsUsers" name="type"
                                                           value="1" class="stl" <?php if($_SESSION['auth_type'] == '1'):?>checked<?php endif ?>>
                                                    <label for="tag-radio-bsnsUsers" class="stl stl-right">
                                                        <span></span>
                                                        <p class="text-fl">Юридическое лицо</p>
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4  col-sm-offset-4 btn-block-form" role="group" aria-label="...">
                                            <input type="submit" class="login-btn-form" value="Отправить" name="personal_info">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="tabs__content">



                        <h1>Управление паролями</h1>
                        <div class="profile-option">
                            <div class="block-form-profile">
                                <form action="/profile" method="post" id="user_new_password">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Введите старый пароль <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="password" class="form-control profile-input" value="" placeholder="******" name="old_password">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Введите новый пароль <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="password" class="form-control profile-input" value="" placeholder="******" name="new_password" id="new_password">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <h3>Еще раз новый пароль <sub>*</sub></h3>
                                        </div>
                                        <div class="col-md-8">
                                            <div class="input-block-form">
                                                <input type="password" class="form-control profile-input" value="" placeholder="******" name="confirm_password" >
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-sm-4  col-sm-offset-4 btn-block-form" role="group" aria-label="...">
                                            <input type="submit" class="login-btn-form" name="new_pass_submit" value="Отправить">
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="tabs__content">
                        <h1>Социальные ресурсы</h1>
                        <p>Свяжите свою учетную запись “WODsports” с учетными записями социальных сетей и заходите в личный кабинет быстро и удобно</p>
                        <div class="profile-option">
                            <div class="block-form-profile">
                                <div class="social-login text-right">
                                    <div class="whith-f-t">
                                        <p>Facebook или Google</p><br>
                                        <a href="#" class="facebook"><i class="fa fa-facebook"></i> facebook</a>
                                        <a href="#" class="google"><i class="fa fa-google"></i> google</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!-- .tabs-->
            </div>

        </div>
    </div>
</section>
<?php if(isset($_SESSION['message']['error'])){ unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php require_once "footer.php"?>