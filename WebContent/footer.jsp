<!DOCTYPE html>

<html>


<link href="css/styleFooter.css" rel="stylesheet" type="text/css"
	media="all" />


<!-- Footer -->
<body
	<%try {
				String s = (String) session.getAttribute("showcart");
				if (s != null)
					if (s.equals("true")) {
						out.println(" onload = $('.addToCartBtn').click() ");
						session.setAttribute("showcart", "false");
					}

			} catch (Exception e) {
			}%>>
	<div class="footer">
		<p>
			� Egerton University Web Cafe. All rights reserved | Design by <a
				href="#">Group 14</a>
		</p>
	</div>
</body>
<!-- //Footer -->

<%@ include file="cart.jsp"%>

<%@ include file="scripts.jsp"%>

</html>

