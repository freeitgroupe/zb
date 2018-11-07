<?php defined("CATALOG") or die("Access denied");?>
<script>
    $('.cart_quantity_input').keyup(function () {
        this.value = this.value.match(/[0-9]{1,2}$/,'');
    });
</script>

<script>
    $(document).ready(function() {
        $('.delete-product').click(function () {
            var delete_product = $(this).closest('tr');
            console.log(delete_product);
            var ob = {'id': $(this).data('product')};
            var ob_1 = {'action': $(this).data('action')};
            $.ajax({
                type: "POST",
                url: "/cart",
                dataType: "json",
                data: {param:  JSON.stringify(ob), param_action: JSON.stringify(ob_1)},
                cache: false,
                success: function (data) {
                    alert('Данный товар удален из корзины');
                    console.log(data);
                    if(data == 'true'){
                        delete_product.remove();
                        loadcart();
                    }
                    //reLoadOrder();
                }
            });
        });
    });
</script>

<script>
    $('.cart_quantity_input').change(function() {
        //setTimeout(function() {alert($(this).val()) }, 1000);
        var plusProductId = $(this).data('product');
        var ob = {'id': plusProductId};
        var ob_1 = {'action': $(this).data('action')};
        var ob_2 = {'quantity': $(this).val()};
        $.ajax({
            type: "POST",
            url: "/cart",
            dataType: "json",
            data: {param:  JSON.stringify(ob), param_action: JSON.stringify(ob_1), param_quantity: JSON.stringify(ob_2)},
            cache: false,
            success: function (data) {
                if(data > 0){
                    // переменная с ценной продукта
                    var priceProduct = $("#productPrice_" + plusProductId).data('price_product');
                    var result_summ = parseFloat(data) * parseFloat(priceProduct);
                    $("#totalSum_" + plusProductId).html(' '+(accounting.formatNumber(result_summ, 2, " ", ".")) + "<?= $currency?>");
                    $("#totalCount_" + plusProductId).html(data);

                    loadcart();
                }
            }
        });

    });
</script>

<script>
    $(".add-info").click(function(event){
        //alert("Hello again!");
        $myDiv = $('#phone-info div.list-phone:eq(0)').clone(true, true);
        // $($myDiv).filter("input").val('').clone(true);
        // console.log($($myDiv).filter("input"));
        $('#phone-info').append($('#phone-info div.list-phone:eq(0)').clone(true, true));
        return false;
    });
</script>