<?php //галлерея фото для продукта ?>
<?php //если есть галерея ?>
<?php if(isset($get_one_product['gallery_image']) && $get_one_product['gallery_image'] > ''):?>
<script>
    $(document).ready(function(){
        function htmSlider(){
            /* Зададим следующие параметры */
            /* обертка слайдера */
            var slideWrap = $('.galThumbs');
            /* кнопки вперед/назад и старт/пауза */
            var nextLink = $('.galRight');
            var prevLink = $('.galLeft');

            /* ширина слайда с отступами */
            var slideWidth = $('.slide-item').outerWidth();
            /* смещение слайдера */
            var scrollSlider = slideWrap.position().left - slideWidth;

            /* Клик по ссылке на следующий слайд */
            nextLink.click(function(){
                if(!slideWrap.is(':animated')) {
                    slideWrap
                        .find('.slide-item:first')
                        .appendTo(slideWrap)
                        .parent()
                        .css({'left': 0});
                }
            });

            /* Клик по ссылке на предыдующий слайд */
            prevLink.click(function(){
                if(!slideWrap.is(':animated')) {
                    slideWrap
                        .css({'left': scrollSlider})
                        .find('.slide-item:last')
                        .prependTo(slideWrap)
                        .parent()

                }
            });
        }
        /* иницилизируем функцию слайдера */
        htmSlider();
        $(".galThumb").click(function(){
            var src = $(this).attr('src');
            $('.single-img').attr('src', src);
            console.log(src);
        });

    });
</script>
<?php endif;?>

<script>
    function processRating(val, attrVal){
        $.ajax({
            type:'POST',
            url: window.location.href,
            data: 'postID='+attrVal+'&ratingPoints='+val,
            dataType: 'json',
            success : function(data) {
                if (data.status == 'ok') {
                    alert('You have rated ' + val);
                    $('#avgrat').text(data.average_rating);
                    $('#totalrat').text(data.rating_number);
                }
                else if (data.status == 'isset_rate') {
                    alert('You already voted!');
                }
                else {
                    console.log(data.status);
                    alert('Some problem occured, please try again.');
                }

            }
        });
    }
    $(document).ready(function() {
        $("#rating_star").product_rating_widget({
            starLength: '5',
            initialValue: "<?=$product_rating['average_rating']?>",
            callbackFunctionName: 'processRating',
            imageDirectory: '/images',
            inputAttr: 'postID'
        });
    });
</script>
<?php if(isset($js_time) && $js_time > ''):?>
<script>
    // Set the date we're counting down to
    var countDownDate = new Date("<?=$js_time?>").getTime();

    // Update the count down every 1 second
    var x = setInterval(function() {

        // Get todays date and time
        var now = new Date().getTime();

        // Find the distance between now an the count down date
        var distance = countDownDate - now;

        // Time calculations for days, hours, minutes and seconds
        var days = Math.floor(distance / (1000 * 60 * 60 * 24));
        var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
        var seconds = Math.floor((distance % (1000 * 60)) / 1000);

        // Display the result in the element with id="demo"
        document.getElementById("timerForStock").innerHTML = days + "d " + hours + "h "
            + minutes + "m " + seconds + "s ";

        // If the count down is finished, write some text
        if (distance < 0) {
            clearInterval(x);
            document.getElementById("timerForStock").innerHTML = "EXPIRED";
        }
    }, 1000);

</script>
<?php endif;?>
