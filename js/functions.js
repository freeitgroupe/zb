function openMenu() {
			$("#menuClosed").click(function() {
				$(".openMenu").hide();
				$(".closeMenu").show();
				$(".categoryList").fadeIn(800);
			});
		}

function closeMenu() {
			$("#menuOpened").click(function() {
				$(".closeMenu").hide();
				$(".openMenu").show();
				$(".categoryList").fadeOut(100);
			});
		}

function hideChild() {
			$(".childOff").click(function() {
				$(".childOff").hide();
				$(".childOn").show();
				$(".childList").hide();
			});
		}
function showChild() {
			$(".childOn").click(function() {
				$(".childOn").hide();
				$(".childOff").show();
				$(".childList").show();
			});
		}

function showCart() {
			$("#shoppingBox").click(function() {
				$(".miniCart").fadeIn(800);
			});
		}

function counterCart() {
			$("#shoppingCounter").click(function() {
				$(".miniCart").fadeIn(800);
			});
		}

function hideCart() {
			$(".closeCart").click(function() {
				$(".miniCart").fadeOut(400);
			});
		}

function showWishList() {
			$(document).on('click', '#shoppingWishList', function(){
				$(".miniWish").fadeIn(800);
			});
		}

function showPopupWindow() {
			$(document).on('click', '.shoppingPopupWindow', function(){
				$(".miniPopap").fadeIn(800);
			});
		}

function hidePopupWindow() {
    $(".closePopup").click(function() {
        $(".miniPopap").fadeOut(800);
    });
}

function hideWishList() {
			$(".closeWish").click(function() {
				$(".miniWish").fadeOut(800);
			});
		}

function reLoad() {
			$("#refreash").click(function() {
				$(".spinner").addClass("animate reLoad");
				
				setTimeout(function(){
					$(".spinner").removeClass("animate reLoad");
			  },1000);
			});
		}

window.onload = function() {
	openMenu();
	closeMenu();
	showChild();
	hideChild();
	showCart();
	hideCart();
	showWishList();
    showPopupWindow();
    hidePopupWindow();
	hideWishList();
	counterCart();
	reLoad();
};