<script>
    $(document).on('click', '.unbindFB', function(evt){
        evt.preventDefault();
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: "unbindFB=true",
            dataType: "json",
            cache: false,
            success: function (data) {
                if(data['response'] == 'true'){
                    location.reload();
                }
            }
        });
    });
</script>