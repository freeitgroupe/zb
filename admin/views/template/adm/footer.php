</div>
<div class="modal" id="test-modal" style="display: none">
    <form id="form_action_page">
    <a href="#" class="close">&times;</a>
    <h4 class="col-md-12 modal-title title-for-popup"></h4>
    <div class="col-sm-4 col-sm-offset-4 btn-block-form text-center" role="group" aria-label="...">
        <div class="btn-block-form text-center" role="group" aria-label="...">
            <input type="submit" class="btn btn-success" align="center" name="page_delete_submit" id="action-btn" value="Confirm">
            <input type="text" hidden id="processed-page" name="pages-delete" value="">
            <input type="text" hidden id="processed-file-del" name="file-delete" value="">
        </div>
    </div>
    </form>

    <div class="col-md-12 success-edit" style="display: none">
        <div class="modal-header center" style="text-align: center">
            <img src="/images/cart_deal.png" alt="">
        </div>
    </div>
    <div class="col-md-12 success-err text-center" style="display: none">
        <h4 class="modal-title-err-mess text-center"></h4>
        <div class="modal-header center" style="text-align: center">
            <img src="/images/icn_wrng.png" alt="">
        </div>
    </div>
</div>
<script>
    <?php //выход пользователя?>
    $('#logout').click(function(ev){
        ev.preventDefault();
        var event_user = $(this).data('event-user');
        $.ajax({
            type: "POST",
            url: window.location.href,
            dataType: "html",
            data: "event_user="+ event_user,
            cache: false,
            success: function(data) {
                if(data == 'logout'){location.reload();}
                if(data == 'false'){alert("Try once more");}
            }
        });
    });
</script>
<script>
    <?php //Для постраничной навигации ?>
    $(document).on('change', '#pagination', function(){
        var page = $('#pagination').val();
        window.location = page;
    });

    <?php //Для постраничной навигации ?>
    $(document).on('change', '.nav-header-menu', function(){
        var page = $('.nav-header-menu').val();
        window.location = page;
    });

    function showCart() {
        $(document).on('click', '.btn-delete-pages', function(){
            $(".ModalWindow").fadeIn(800);
        });
    }
    showCart();
</script>
<script type="text/javascript">
    jQuery(function($){
        // bind event handlers to modal triggers
        $('body').on('click', '.trigger', function(e){
            e.preventDefault();
            $('#test-modal').modal().open();
        });

        $('body').on('click', '.trigger-order', function(e){
            e.preventDefault();
            $('#modal-edit-order').modal().open();
        });

        // attach modal close handler
        $('.modal .close').on('click', function(e){
            e.preventDefault();
            $.modal().close();
        });

        // below isn't important (demo-specific things)
        $('.modal .more-toggle').on('click', function(e){
            e.stopPropagation();
            $('.modal .more').toggle();
        });
    });
</script>
<?php if(isset($_SESSION['message']['error'])){unset($_SESSION['message']['error']);}?>
<?php if(isset($_SESSION['message']['success'])){ unset($_SESSION['message']['success']);}?>
<?php if(isset($_SESSION['new_pages'])){ unset($_SESSION['new_pages']);}?>
<?php if(isset($_SESSION['data'])){unset($_SESSION['data']);}?>
<?php
$filename = $_SERVER["DOCUMENT_ROOT"] . '/admin/js/template/' . $view . '.php';
if (file_exists($filename) > 0){  require_once "$filename"; die(); }
?>
</body>
</html>