<script>
    $(document).on('change', '#filter-sum, #filter-title', function(){
        var $event_type = $(this).attr('id');
        var $filter, $direction;
        if($event_type == 'filter-sum'){
            $filter = 'sum_item';
            $direction = $("#filter-sum").val();
        }

        if($event_type == 'filter-title'){
            $filter = 'title_product';
            $direction = $("#filter-title").val();
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