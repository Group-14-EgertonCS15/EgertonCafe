<!DOCTYPE html>
<%@page import="models.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.Restaurant"%>
<html>

<%
	String url = (String) session.getAttribute("url");

	Restaurant restaurant = (Restaurant) session.getAttribute("restaurant");
	if (restaurant == null && url.contains("RestaurantsClass?id=")) {
		response.sendRedirect("offers.jsp");
		return;
	}

	ArrayList<Restaurant> restaurants = (ArrayList<Restaurant>) session.getAttribute("restaurants");
	if (restaurants == null || restaurants.isEmpty()) {
		response.sendRedirect("FetchRestaurants?url=" + url);
		return;
	}

	User user = (User) session.getAttribute("user");
%>

<head>
<title>Egerton Cafe</title>

<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/mystyle.css" rel="stylesheet" type="text/css"
	media="all" />
<link href="css/styleHeader.css" rel="stylesheet" type="text/css"
	media="all" />



<link
	href='//fonts.googleapis.com/css?family=Ubuntu:400,300,300italic,400italic,500,500italic,700,700italic'
	rel='stylesheet' type='text/css'>
<link
	href='//fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
	rel='stylesheet' type='text/css'>

</head>

<body>

	<!-- Fixed header -->
	<div class="header_fixed">

		<!-- Offers -->
		<div class="header_offers">
			<a href="FetchOffers">Special Offers !</a>
		</div>

		<!-- Search -->
		<div class="header_search">
			<form action="#" method="post">
				<input type="text" name="Product" value="Search a product..."
					onfocus="this.value = '';"
					onblur="if (this.value == '') {this.value = 'Search a product...';}"
					required=""> <input type="submit" value=" ">
			</form>
		</div>



		<!-- Account -->
		<div class="header_account">
			<ul>
				<li class="dropdown myaccount_collapsed"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"> <%
 	if (user != null) {
 		out.println(user.getFirstname() + " " + user.getLastname() + "  ");
 	} else {
 		out.println("My Account  ");

 	}
 %> <span class="caret"> </span></a>
					<div class="mega-dropdown-menu">
						<div class="myaccount_options">
							<ul class="dropdown-menu drp-mnu">

								<%
									if (user != null) {
										out.println(" <li><a href=\"login.jsp\">Notifications</a></li> ");
										out.println(" <li><a href=\"login.jsp\">My Profile</a></li> ");
										out.println(" <li><a href=\"LogoutClass\">Log Out</a></li> ");
									} else {
										out.println(" <li><a href=\"login.jsp\">Log In</a></li> ");
										out.println(" <li><a href=\"login.jsp?param=register\">Sign Up</a></li> ");

									}
								%>

							</ul>
						</div>
					</div></li>
			</ul>
		</div>

		<!-- Cart -->
		<div class="header_cart">
			<button id="myBtn" class="addToCartBtn"
				style="color: #fff; background-color: #0000; font-size: 14px; outline: none; text-transform: capitalize; padding: .5em .5em .5em .5em; border: 1px solid #84c639; margin: .35em 0;">
				<span style="margin-right: .5em">View your cart</span> <img
					align="middle" src="images/cart.png"></img>
			</button>
		</div>

		<div class="clearfix"></div>
	</div>
	<!-- //Fixed header -->

	<!-- Header -->
	<div class="header_scrollable">
		<div class="container">
			<!-- Logo -->
			<div class="header_logo">
				<h1>
					<a href="index.jsp"><span>Egerton</span> Cafe</a>
				</h1>
			</div>
			<div class="header_links">
				<ul class="header_reststaurants">
					<%
						for (Restaurant r : restaurants) {

							out.println("  <li><a href=\"RestaurantsClass?id=" + r.getId() + "\" ");
							if (restaurant != null)
								if (r.getId() == restaurant.getId()) {
									out.println("  class=\"current\" ");
								}

							out.println(" > " + r.getName() + " </a><i>/</i></li> ");
						}
					%>

				</ul>

			</div>

			<div class="clearfix"></div>
		</div>
	</div>
	<!-- //Header -->


</body>


</html>