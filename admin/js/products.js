$(document).ready(function() {

	/* Add custom field event */
	$("#add-custom-field-btn").click(function() {
		var fieldName = $("#add-custom-field-name").val(),
			fieldValue = $("#add-custom-field-value").val();

		if( fieldName != "" && fieldValue != "" ) {
			$(".custom-fields-box").append('<div class="custom-fields-item container-fluid"><div class="row"><div class="col-md-4"><input type="text" name="custom-field-name" placeholder="Name" value="' + fieldName + '" /></div><div class="col-md-8"><textarea name="custom-field-value" id="custom-field-value">' + fieldValue + '</textarea></div><div class="col-md-12"><button id="delete-custom-field-btn">Delete</button><button id="update-custom-field-btn">Update</button></div></div></div>');
		}
	});

	/* Create marcks event */
	$('input[name="marks-input"]').bind('change', function() {
		var string = $("#marks-input").val();
		$('input[name="marks-input"]').val('');
		var marksArray = string.split(",");
		for(var i = 0; i < marksArray.length; i++){
			$("#marks-box").append( '<span class="mark">' + marksArray[i] + '<span class="delete-mark">&#x2718;</span></span>');
		}
	});

	/* Show/hide menu */
	$("#hide-menu-btn").click(function() {
		$(".adminNavigation").toggle("slow");
	});

	$(window).on("resize", function() {
		if( $(window).width() > 1230 ) {
			$(".adminNavigation").css("display", "block");
		} else {
			$(".adminNavigation").css("display", "none");
		}
	});

});