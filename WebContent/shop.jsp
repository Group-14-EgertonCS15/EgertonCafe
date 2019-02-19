<!DOCTYPE html>
<html>

<%
	Restaurant currentRestaurant = (Restaurant) session.getAttribute("restaurant");
	String currentRestaurantId = "";
	if (currentRestaurant != null) {
		currentRestaurantId = currentRestaurant.getId() + "";
	}

	session.setAttribute("url", "RestaurantsClass?id=" + currentRestaurantId);
%>
<%@ include file="header.jsp"%>

<body>

	<!-- Content -->
	<div class="banner">
		<div class="content_left">

			<nav style="width: 100%;">
				<ul style="padding: 1em;">
					<a href="#">Beverages</a>
					<ul style="padding-left: 2em;">Hot Drinks
					</ul>
					<ul style="padding-left: 2em;">Sodas
					</ul>
					<ul style="padding-left: 2em;">Fruit Juices
					</ul>
				</ul>
				<ul style="padding: 1em;">
					<a href="#">Breakfast Pack</a>
				</ul>
				<ul style="padding: 1em;">
					<a href="#">Main Dishes</a>
				</ul>
				<ul style="padding: 1em;">
					<a href="#">Stews</a>
				</ul>
				<ul style="padding: 1em;">
					<a href="#">Vegetables</a>
				</ul>
				<ul style="padding: 1em;">
					<a href="#">Fresh Fruits</a>
				</ul>
				<ul style="padding: 1em;">
					<a href="#">Snacks</a>
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>
				<ul style="padding: 1em;">
				</ul>



			</nav>
		</div>
		<div class="content_right">
			<div class=content_max>
				<h3>
					Meals Available at
					<%=restaurant.getName()%>
				</h3>
				</br>

				<div class="w3_login_module">


					<%
						// Show errors if any
						if (request.getAttribute("error") != null) {
							out.println(" <h4 align=\"center\" style=\"color:#FA1818;\"> ");
							out.println(request.getAttribute("error"));
							out.println("</h4>");
						}

						try {
							ArrayList<Food> foods = (ArrayList<Food>) session.getAttribute("foods");

							for (Food f : foods) {
					%>


					<div class="col-md-3 w3ls_w3l_banner_left"
						style="padding-bottom: 2em;">
						<div>
							<div
								class="agile_top_brand_left_grid w3l_agile_top_brand_left_grid">

								<div class="box20">
									<img src="<%=f.getImageUrl()%>" alt="" class="img-fluid" />
									<div class="box-content">
										<h3 class="title" style="float: left;">
											<%=f.getName()%>
										</h3>
										<div class="clearfix"></div>
										<span style="font-size: 20px"> <%="Ksh. " + f.getPrice() + ".00"%>
										</span>
									</div>
									<ul class="icon">

										<input type="button" value="Buy     ."
											onclick="addToCart(<%=f.getId()%>)"
											style="background: url(images/cart.png) 44px 16px no-repeat; border: 0; border-radius 10; background-color: #222e; color: #fff; font-size: 14px; text-transform: capitalize; padding: 1em; border: 1px solid #84c639; box-shadow: 0 2px 4px rgba(0, 0, 0, .5)">


									</ul>
								</div>

							</div>
						</div>
					</div>
					
					<script type="text/javascript">

function addToCart( restID ) {
<%
	//if( restID == cart){}
	%>
	parent.open('DisplayCart?foodId='+restID+'&qty=1');

	
	if (confirm('Are you sure you want to save this thing into the database?')) {
		parent.open('DisplayCart?foodId=<%=f.getId()%>&qty=1');

	    // Save it!
	} else {
	    // Do nothing!
	}
	
	
}

</script>

					<%
						}

						} catch (Exception e) {
						}
					%>



				</div>
			</div>

		</div>
		<div class="clearfix"></div>
	</div>
	<!-- //Content -->


</body>
<%@ include file="footer.jsp"%>
</html>