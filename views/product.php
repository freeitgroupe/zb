<?php defined("CATALOG") or die("Access denied");
require_once 'header.php';
?>
<!-- single page content -->
<div class="emraceFull">
    <div class="embrace clear singlePage">
        <div class="breadCrumbs clear">
            <?=$breadcrumbs?>
        </div>
        <section class="singleBox clear">
            <div class="leftBox clear left">
                <!-- leftBox inner -->
                <div class="thumbnail mainThumbnail">
                    <img src="<?= PROD_IMG . $get_one_product['image']?>" alt="<?=$get_one_product['title']?>" class="single-img">
                    <?php if($get_one_product['upsell_product']):?>
                        <div class="saleNotice">Sale</div>
                    <?php endif;?>
                    <?php if(isset($get_stock_info)):?>
                        <div class="stockNotice" id="stock"><?=$get_stock_info['title']?></div>
                    <?php endif;?>
                </div>

                <?php if($get_one_product['gallery_image'] > ''):?>
                    <div class="groductGallery clear">
                        <div class="galLeft">
                            <div class="nav" id="navGalLeft">.</div>
                        </div>
                        <div class="galThumbs clear">
                        <?php if(isset($get_one_product['gallery_image']) && $get_one_product['gallery_image'] > ''):?>
                        <?php $arr = explode("|", $get_one_product['gallery_image']);$arr = array_diff($arr,['']);?>
                        <?php foreach($arr as $item):?>
                            <div class="slide-item" >
                                <img src="<?=GALLERY_IMG . $item?>" class="galThumb">
                            </div>
                        <?php endforeach;?>
                        <?php endif;?>
                                <div class="slide-item" >
                                    <img src="<?=PROD_IMG . $get_one_product['image']?>" class="galThumb">
                                </div>
                        </div>
                        <div class="galRight">
                            <div class="nav" id="navGalRight">.</div>
                        </div>
                    </div>
                <?php endif;?>

                <?php if($get_one_product['fast_delivery']):?>
                    <div class="extraFast">
                        <span class="exBox">s</span>Extra fast delivery to your warhouse
                    </div>
                <?php endif;?>

                <!-- leftBox inner end -->
            </div>
            <div class="rightBox clear left">
                <!-- rightBox inner -->
                <h1 class="proName">
                    <?=$get_one_product['title']?>
                </h1>
                <div class="proId">Product ID : <?=$get_one_product['article']?></div>
                <div class="rating-prod">
                   <input name="rating" value="<?=$product_rating['average_rating']?>" id="rating_star" type="hidden" postID="<?=$get_one_product['id']?>"/>
                   <div class="overall-rating">(Average Rating <span id="avgrat"><?=$product_rating['average_rating']?></span> Based on <span id="totalrat"><?=$product_rating['rating_number']?></span>  rating)</div>
                </div>
                <br class="zupLier">Sold & Shipped by <?=$countSuppliersProduct?></br>
                <p class="table-suppliers"><?=$stringViewSuppliers?></p>
                <?php if(isset($get_stock_info)):?>
                    <div class="timerBox">
                        <p>End time <?php //$res_interval?></p>
                        <p id="timerForStock"></p>
                    </div>
                <?php endif;?>
                <div class="buyBox clear">
                    <?php if(!$get_one_product['stock_price']):?>
                        <div class="proPrice"><?=$get_one_product['price']?>$
                            <span class="unitPrice">(unit price)</span>
                        </div>
                    <?php else:?>
                        <div class="proPrice"><?=$get_one_product['price']?>$
                            <span class="unitPrice">(basic: <strike style="color:#E84C3D"><?=$get_one_product['price']?>$</strike>)
                            </span>
                        </div>
                    <?php endif?>
                    <div class="proBuy">
                        <div class="bookmark shoppingPopupWindow favButton right" data-product="<?=$get_one_product['id']?>">2</div>
                        <input data-product="<?=$get_one_product['id']?>" data-price="<?=$get_one_product['price']?>" type="button" class="addToCart button-add" value="Add to cart">
                    </div>
                </div>
                <?php if(isset($get_stock_info)):?>
                    <div class="stockSingleInformer">
                        <a href="/stock-product/<?=$get_stock_info['alias']?>">
                        <span class="stockLabel"><?=$get_stock_info['title']?></span>
                        </a>
                        <p>
                            <?=$get_stock_info['description']?>
                        </p>
                    </div>
                <?php endif;?>
                
                <div class="exerptInfo">
                    <p><?=$get_one_product['notice']?></p>
                    <div class="shareBox clear">
                        <a
                            target="_blank"
                            title="On Facebook"
                            href="https://www.facebook.com/sharer/sharer.php?u=<?=urlencode(substr(PATH, 0, -1) . $_SERVER['REQUEST_URI'])?>"
                            onclick="window.open(this.href, 'Share to Facebook', 'width=640,height=436,toolbar=0,status=0');
                            return false"
                            class="shareLink facebook"
                        >
                            Facebook
                        </a>
                        <a
                            href="http://twitter.com/share?url=<?=urlencode(substr(PATH, 0, -1) . $_SERVER['REQUEST_URI'])?>&text=<?=$title_header?>"
                            class="shareLink twitter"
                        >
                            Twitter
                        </a>
                    </div>
                </div>
                <!-- rightBox inner end -->
            </div>
        </section>
        <!-- more information -->
        <div class="cutomFields content clear">
            There will be all the necessary information about the additional fields.
        </div>
        <!-- more information end -->
        <?php if($permissionCreateComments): ?>
        <div class="singleBox">
            <div class="singleContent commentBox clear top">
                <div class="loopHeading"><h3><i class="icons">chat_bubble_outline</i> Discussion</h3></div>
                <div class="clear">
                    <div class="answerBox top">
                        <div class="linkAnswer action reply">
                            <a href="#">New comment </a>
                        </div>
                    </div>
                    <?php if((isset($comments)) && $comments > false):?>
                    <div class="comm-data">
                        <?=$comments?>
                    </div>
                    <?php //Подгрузка комментариев по клику в зависимости от их количества?>
                    <?php if(($count_comments - COUNT_COMM) > 0 ): ?>
                        <div class="all_view_comments" id="all_view_comments" data-count-comments="<?=$count_comments?>" data-count-limit="<?=COUNT_COMM ?>" data-product-comm="<?=$get_one_product['id'] ?>">
                            More comments
                        </div>
                    <?php endif; ?>

                    <?php else: ?>
                        <h3>No comments.</h3>
                    <?php endif?>
                </div>
            </div>
        </div>
        <? endif; ?>
        <?php if($get_related_additions):?>
            <!-- Similar products -->
            <div class="SimilarProducts clear">
                <div class="similarIndex clear">
                    <div class="similarHead clear">
                        <h3 class="stipeHeading">Similar products</h3>
                    </div>
                    <div class="choiceLoop clear">
                    <?php foreach ($get_related_additions as $item):?>
                        <!-- single product -->
                        <div class="singleProduct clear">
                            <a href="<?=$item['alias']?>">
                                <div class="hrefBox">
                                    <div class="thumbnail">
                                        <?php if($item['upsell_product'] > 0): ?>
                                            <div class="saleNotice">Sale</div>
                                        <?php endif;?>
                                        <?php if($item['stock_id'] > 0): ?>
                                            <div class="stockNotice" id="stock">Stock</div>
                                        <?php endif; ?>
                                        <img src="<?= PROD_IMG . $item['image']?>" alt="<?=$item['title']?>">
                                    </div>
                                    <div class="favBox clear">
                                        <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$item['id']?>">q</div>
                                    </div>
                                    <div class="pruductName">
                                        <?=$item['title']?>
                                    </div>
                                    <div class="procuctPrice">
                                        <span class="currency">$</span><?=$item['price']?>
                                    </div>
                                </div>
                            </a>
                            <div class="productFooter clear">
                                <input data-product="<?=$item['id']?>" data-price="<?=$item['price']?>" type="button" class="addToCart button-add" value="Add to cart">
                            </div>
                        </div>
                        <!-- single product end -->
                    <?php endforeach;?>
                    </div>
                </div>
            </div>
            <!-- Similar products end-->
        <?php endif; ?>
        <?php if(isset($get_watch_list) and $get_watch_list > false):?>
        <!-- Watchlist -->
        <div class="watchList">
            <div class="watchIndex clear">
                <div class="watchHead clear">
                    <h3 class="stipeHeading">Watchlist</h3>
                    <div class="refreashBox"></div>
                </div>
                <div class="choiceLoop clear">
                    <?php foreach($get_watch_list as $item):?>
                    <!-- single product -->
                    <div class="singleProduct clear">
                            <div class="hrefBox">
                                <a href="<?='/product/' . $item['alias']?>">
                                    <div class="thumbnail">
                                        <?php if($item['upsell_product'] > 0): ?>
                                            <div class="saleNotice">Sale</div>
                                        <?php endif;?>
                                        <?php if($item['stock_id'] > 0): ?>
                                            <div class="stockNotice" id="stock">Stock</div>
                                        <?php endif; ?>
                                        <img src="<?=PROD_IMG . $item['image']?>" alt="<?=$item['title']?>">
                                    </div>
                                </a>
                                <div class="favBox clear">
                                    <div class="favIcon bookmark shoppingPopupWindow" data-product="<?=$item['id']?>">q</div>
                                </div>
                                <div class="pruductName">
                                    <?=$item['title']?>
                                </div>
                                <div class="procuctPrice">
                                    <span class="currency">$</span><?=$item['price']?>
                                </div>
                            </div>

                        <div class="productFooter clear">
                            <input data-product="<?=$item['id']?>" data-price="<?=$item['price']?>" type="button" class="addToCart button-add" value="Add to cart">
                        </div>

                    </div>
                    <!-- single product end -->
                    <?php endforeach;?>

                </div>
            </div>
        </div>
        <!-- Watchlist end -->
        <?php endif;?>

    </div>
</div>
<script>
    $(document).on('click', '.rateDown', function(evt){
        evt.preventDefault();
        setVote('dislike', $(this));
    });
    $(document).on('click', '.rateUp', function(evt){
        evt.preventDefault();
        setVote('like',$(this));
    });

    function setVote(type, element){
        var paramVote = element.parent().find('#comment-id').val();
        //console.log(paramVote);return;
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: {'paramVote': paramVote,'type': type},
            dataType: "json",
            success: function(data){
               if(data['result'] == 'success'){
                    alert('Success!');
                   var count = parseInt(element.find('b').html());
                   element.find('b').html(count+1);
                }else{
                    // вывод сообщения об ошибке
                    alert(data.msg);
                }
            }
        });
    };
</script>
<!-- single page content end -->
<?php if($permissionCreateComments):?>
<script>
    <?php //Подгрузка полного списка комментариев?>
    $('#all_view_comments').click(function () {
        var count_comments = $(this).data('count-comments');
        var count_limit = $(this).data('count-limit');
        var product_comm = $(this).data('product-comm');
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "count_comments="+count_comments+"&count_limit="+count_limit+"&product_comm="+product_comm,
            dataType: "html",
            cache: false,
            success: function(data) {
                $('.comm-data').replaceWith(data);
                $('#all_view_comments').text('скрыть');
            }
        });
    });
    <?php //Подгрузкаблока с созданием комментария?>
    $(document).on('click', '.linkAnswer',function(evt){
        evt.preventDefault();
        if ($(".comments-form").length){
            $(".comments-form").remove();
        }
        $(this).after('<div class="comments-form">\n' +
            '                            <form id="comment_product" enctype="multipart/form-data" method="post">\n' +
        '                                    <div class="form-group">\n'+
            '                                <input type="text" class="top" value="" name="author_name" id="author_name" placeholder="Your name*">\n' +
        '                                    </div>\n'+
            '                                <input type="text" class="top" value="" name="comment_good" id="comment_good" placeholder="Advantage">\n' +
            '                                <input type="text" class="top" value="" name="comment_bad" id="comment_bad" placeholder="Disadvantages">\n' +
            '                                <textarea class="top" type="text" name="comment_text" id="comment_text" placeholder="the context of the comment*"></textarea>\n' +
            '                                <input type="text" class="top" value="" name="author_email" id="author_email" placeholder="Your email*">\n' +
            '                                <input type="hidden" id="parent_comment" name="parent_comment" value="0">\n' +
            '                                <input type="hidden" id="product_id_comm" name="product_id" value="<?= $get_one_product['id']?>">\n'+
'                                <input type="submit" class="menuButton top" name="comment_submit" id="comment_submit" value="Confirm">\n' +
'                            </form>\n' +
'                        </div>');
        var parent = $(this).data("parent-comment");
        if(!parseInt(parent)) parent = 0;
        //console.log(parent);
        $("#parent_comment").val(parent);
        //console.log($("#parent_comment").val());
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
                    err_mess_block.text('Invalid Email!');
                    btn_submit.attr('disabled', true);
                    mail.addClass('has-error');
                    //email.selectionStart;
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
    <?php //Обработка полей формы для комментария, скрываем красную обводку ?>
    $(document).on('click', 'input, textarea', function(evt){
        evt.preventDefault();
        $(this).removeClass('has-error');
    });
    <?php // ?>
    data = new FormData();
    <?php //обрабатываем данные при отправке комментария ?>
    $(document).on('click', '#comment_submit', function(evt){
        evt.preventDefault();
        var author_name, author_email,  comment_good, comment_bad, comment_text, parent_comment, product_id, mess='';
        //получаем данные из формы
        author_name = $.trim($("#author_name").val());
        author_email = $.trim($("#author_email").val());
        comment_good = $.trim($("#comment_good").val());
        comment_bad = $.trim($("#comment_bad").val());
        comment_text = $.trim($("#comment_text").val());
        parent_comment = $.trim($("#parent_comment").val());
        product_id = $.trim($("#product_id_comm").val());
        var verification_arr =
            {
                'author_name' : author_name,
                'comment_text':comment_text,
                'author_email' :author_email,
            };
        var key;
        for(key in verification_arr){
            //console.log(verification_arr[key]);
            if(verification_arr[key].length == 0){
                mess = mess + key + '-';
                $("#"+key).addClass('has-error');
            }
        }

        if(author_name.length < 3 || author_name.length >= 30){
            alert("The name must contain between 3 and 20 characters!");
            $("#author_name").addClass('has-error');
            return;
        }
        if(comment_text.length < 10 || comment_text.length >= 250){
            alert("The review text should contain from 10 to 250 characters!");
            $("#comment_text").addClass('has-error');
            return;
        }
        if(mess > ''){
            alert("Fill in required fields!");
            return;
        }

        if(author_email.length < 5 || author_email.length >= 80){
            validEmail($("#author_email"), $('#helpBlock2'),$('#comment_submit'));
            alert("Check Email!");
            $("#author_email").addClass('has-error');
            return;
        }
        <?php //вызов ф-ии валидации email?>

        if (mess =='')
        {
            data.append('author_name', author_name );
            data.append('author_email', author_email );
            data.append('comment_good', comment_good );
            data.append('comment_bad', comment_bad );
            data.append('comment_text', comment_text );
            data.append('parent_comment', parent_comment );
            data.append('product_id', product_id);
            $.ajax({
                type: "POST",
                url: window.location.href,
                data: data,
                cache:false,
                contentType: false,
                processData: false,
                success: function(data) {
                    if (data == 'success') {
                        alert('Successfully. After checking the site administration, your comment will be displayed!');
                        $('#modal-comment').modal('hide');
                        $('#author_name').val('');
                        $('#author_email').val('');
                        $('#comment_good').val('');
                        $('#comment_bad').val('');
                        $('#comment_text').val('');
                        $('#parent_comment').val('');
                        if ($(".comments-form").length){
                            $(".comments-form").remove();
                        }
                    }
                    else {
                        alert(data);
                        //$('#modal-comment').modal('hide');
                        $(".auth-loading").hide();
                        $("#button-auth").show();
                    }
                }
            });
        }
    });
</script>
<?php endif;?>
<?php require_once 'footer.php';?>