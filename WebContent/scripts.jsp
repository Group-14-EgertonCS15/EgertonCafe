<html>

<!-- jQuery -->
<script src="js/jquery-1.11.1.min.js"></script>


<!-- Smooth Scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>


<!-- Scroll to top -->
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>


<!-- Toggle Login and Signup -->
<script>
	$('.toggle').click(function() {
		// Switches the Text
		var currentText = document.getElementById('auth_toggle').innerHTML;
		if (currentText == "Register") {
			document.getElementById('auth_toggle').innerHTML = 'Login';
		} else {
			document.getElementById('auth_toggle').innerHTML = 'Register';

		}

		// Switches the forms  
		$('.form').animate({
			height : "toggle",
			'padding-top' : 'toggle',
			'padding-bottom' : 'toggle',
			opacity : "toggle"
		}, "slow");
	});
</script>


<!-- Bootstrap -->
<script src="js/bootstrap.min.js"></script>


<!-- Bootstrap Dropdown -->
<script>
	$(document).ready(function() {
		$(".dropdown").hover(function() {
			$('.dropdown-menu', this).stop(true, true).slideDown("fast");
			$(this).toggleClass('open');
		}, function() {
			$('.dropdown-menu', this).stop(true, true).slideUp("fast");
			$(this).toggleClass('open');
		});
	});
</script>


<!-- here stars scrolling icon -->
<script type="text/javascript">
	$(document).ready(function() {

		var defaults = {
			containerID : 'toTop', // fading element id
			containerHoverID : 'toTopHover', // fading element hover id
			scrollSpeed : 1200,
			easingType : 'linear'
		};

		$().UItoTop({
			easingType : 'easeOutQuart'
		});

	});
</script>


<!-- Cart -->
<script>
	var modal = document.getElementById('myModal');
	var btn = document.getElementById('addToCartBtn');
	var span = document.getElementById('close-cart');

	// open
	$('.addToCartBtn').click(function() {
		modal.style.display = "block";
	});

	// close
	$('.cartClose').click(function() {
		modal.style.display = "none";
	});

	// close on window clicked
	window.onclick = function(event) {
		if (event.target == modal)
			modal.style.display = "none";
	}
</script>


<!-- Add to cart -->

<script type="text/javascript">
function showOption(x) {
	if (confirm('Adding elements from a different restaurant will reset the cart. Do you want to continue?')) {			
	    location.href = 'DisplayCart?foodId='+x+'&qty=1&action=clearcart';
	} else {
		// Do nothing!
	}
};	function showOptionInOffers(x, y) {
	if (confirm('Adding elements from a different restaurant will reset the cart. Do you want to continue?')) {			
	    location.href = 'DisplayCart?foodId='+x+'&qty=1&offerPrice='+y+'&action=clearcart';
	} else {
		// Do nothing!
	}
};
</script>

<!-- Process Checkout -->


</html>