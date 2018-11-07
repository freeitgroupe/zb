
<!-- scripts -->
<script>
        $('#logout').click(function(){
            var event_user = $(this).data('event-user');
            alert(event_user);
            $.ajax({
                type: "POST",
                url: window.location.href,
                dataType: "html",
                data: "event_user="+ event_user,
                cache: false,
                success: function(data) {

                    if (data == 'logout')
                    {
                        location.reload();
                    }

                    if (data == 'false')
                    {
                        alert("false");
                    }

                }
            });
            event.preventDefault();
        });
</script>
<!-- end scripts -->
</body>
</html>