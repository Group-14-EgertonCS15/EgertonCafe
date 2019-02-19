<!DOCTYPE html>
<%@page import="models.Restaurant"%>
<%@page import="java.util.ArrayList"%>
<html>

<%ArrayList<Restaurant> restaurants = new ArrayList<>();
			try {
				restaurants = (ArrayList<Restaurant>) session.getAttribute("restaurants");
				if (restaurants == null ) {
					
					request.getRequestDispatcher("/FetchRestaurants?url=index.jsp").forward(request, response);
					return;
				}

			} catch (Exception e) {
			}%>

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

	<div
		style="background: url(images/splashscreen.jpg) no-repeat bottom; background-size: cover; -webkit-background-size: cover; -moz-background-size: cover; -o-background-size: cover; -ms-background-size: cover; min-height: 800px;">

		<!-- Header -->
		<nav>
			<div class="header_logo" style="padding-left: 6em; padding-top: 2em">
				<h1>
					<a style="color: #555" href="index.jsp"><span
						style="color: #fff">Egerton</span> Cafe</a>
				</h1>
			</div>

			<div class="header_links"
				style="float: right; padding-right: 2em; padding-top: 1em">
				<ul class="header_reststaurants">
					<%
						for (Restaurant r : restaurants) {

							out.println("  <li><a href=\"RestaurantsClass?id=" + r.getId() + "\"> " + r.getName()
									+ " </a><i>/</i></li> ");
						}
					%>

				</ul>

			</div>

		</nav>
		<!-- //Header -->


		<!-- Content Text -->
		<div class="banner">
			<div class="content_max">

				<div style="padding-top: 14em; padding-left: 4em;" align="left">
					<div align="center" style="float: left;">

						<h3 style="color: #fff">Tasty and Healthy Meals</h3>
						<div class="clearfix"></div>

						<h3 style="color: #fff">
							Delivered Anywhere Within </br>Egerton University
						</h3>
						<div class="clearfix"></div>
						<div>
							<p
								style="color: #333; font-style: bold; line-height: 28px; font-size: 19px; padding: 1em 0em;">
								Select any of our amazing restaurants to </br>view delicious dishes
								available. </br> </br> However, if you are not interested in something </br>specific,
								check out our unbeatable offers in </br>the 'Special Offers' section.
							</p>
						</div>
						<div class="clearfix"></div>

						<div class="header_offers" align="center" style="float: none;">
							<a href="FetchOffers">Special Offers !</a>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- //Content Text -->



</body>
</html>