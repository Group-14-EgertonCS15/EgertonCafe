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

										<%
											String firstItemRestaurantId = "_";
													try {
														if (cartItems != null) {
															firstItemRestaurantId = String.valueOf(cartItems.get(0).getFood().getRestaurantId());
														}
													} catch (Exception e) {
													}
										%>

										<button
											<%if (firstItemRestaurantId.equals("_"))
						out.println("onclick=\"window.location.href=('DisplayCart?foodId=" + f.getId() + "&qty=1')\"");
					else if (firstItemRestaurantId.equals(String.valueOf(restaurant.getId())))
						out.println("onclick=\"window.location.href=('DisplayCart?foodId=" + f.getId() + "&qty=1')\"");
					else
						out.println("onclick=\"  showOption( " + f.getId() + ") \"");%>
											style="background: url(images/cart.png) 44px 24px no-repeat; border: 0; border-radius 10; background-color: #222e; color: #fff; font-size: 14px; text-transform: capitalize; padding: 1.5em; border: 1px solid #84c639; box-shadow: 0 2px 4px rgba(0, 0, 0, .5)">
										<span>Buy .</span>
									</button>


									</ul>
								</div>

							</div>
						</div>
					</div>

				
					<%
						}

						} catch (Exception e) {
						}
					%>



				</div>
			</div>

		
		<div class="clearfix"></div>
	</div>
	<!-- //Content -->


</body>
<%@ include file="footer.jsp"%>
</html>