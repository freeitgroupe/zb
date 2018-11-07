<script>
    $(document).on('change', '#filter-date, #filter-price', function(){
        var $event_type = $(this).attr('id');
        var $filter, $direction;
        if($event_type == 'filter-date'){
            $filter = 'created_at';
            $direction = $("#filter-date").val();
        }

        if($event_type == 'filter-price'){
            $filter = 'sum';
            $direction = $("#filter-price").val();
        }
        $.ajax({
            type: "POST",
            url: window.location.href,
            data: {filter: $filter, direction: $direction},
            dataType: "json",
            cache: false,
            success: function(data) {
                location.reload();
            }
        });
    });
</script>