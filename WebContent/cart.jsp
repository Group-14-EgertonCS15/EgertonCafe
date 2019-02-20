<!DOCTYPE html>
<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="models.*"%>

<html>

<link href="css/styleCart.css" rel="stylesheet" type="text/css"
	media="all" />

<%
	ArrayList<Address> addresses = new ArrayList<Address>();
	addresses.add(new Address("Science", "Computer Science", "Block", "Room 1"));
%>




<div id="myModal" class="cart" align="center" style="left: 25%;">
	<span id="cartClose" class="cartClose">&times;</span>

	<div class=" modal-contents">

		<table cellpadding="5" border="0">
			<tr>
				<th align="left" width="15%"></th>
				<th align="left" width="30%"></th>
				<th align="left" width="25%"></th>
				<th align="center" width="10%"></th>
				<th align="right" width="20%"></th>
			</tr>

			<%
				try {
					if (request.getParameter("showCheckOut").equals("processed"))
						out.println(" <span> Your Order Has Been Processed. </br>Wait For Delivery </span> ");
					else
						out.println(" <span> Your Cart Is Empty </br></br></span> ");
					

				}
				catch (Exception e){}

 if (cartItems == null || cartItems.isEmpty()) {
					out.println(" <span> Your Cart Is Empty </span> ");
				} else {

					for (CartItem item : cartItems) {
			%>



			<tr valign="baseline" style="min-height: 12px">
				<td><img src="<%=item.getFood().getImageUrl()%>" width="50%"></td>
				<td><%=item.getFood().getName()%></td>
				<td><input minlenfth="1" required
					style="border-radius: 2; max-width 12px; border: 0; border: 2px solid #84C639;"
					type="number" name="qty" value="<%=item.getQuantity()%>"
					onchange="window.location.href=('DisplayCart?foodId=<%=item.getFood().getId()%>&qty='+this.value+'&update=true')"
					onpaste()="this.onchange();"></td>
				<td><input type="button" value="&times;"
					onclick="window.location.href=('DisplayCart?foodId=<%=item.getFood().getId()%>&qty=0&remove=true')"
					style="border-radius: 2; background-color: #f00; border: 0; width: 24px; height: 24px;">
				</td>
				<td><%="Ksh " + item.getTotalPrice() + ".00"%></td>
			</tr>


			<tr>
				<td colspan="5"><hr></td>
			</tr>
			<%
				}
				}
			%>
		</table>


	</div>

	<div>
		<%
			int subtotal = 0;
			try {
				for (CartItem item : cartItems) {
					subtotal = item.getTotalPrice() + subtotal;
				}
			} catch (Exception e) {
			}

			Boolean isCheckOutClicked = false;
			if (subtotal > 0) {
		%>
		<div class="modal-contents" id="checkoutModal" style="display: none;">

			<p>
				<b>Invoice Generated At: </b><span> <%=new Date()%></span>
			</p>
			</br>
			<p>
				<b>Total Amount To Pay: </b><span> Ksh <%=subtotal%>.00
				</span>
			</p>
			<tr>
				<td colspan="1"><hr></td>
			</tr>
			<p>
				<b>Select Address To Deliver</b>
			</p>
			</br>
			<tr>
				<form action="ProcessInvoice" method='post'>
					<input type="hidden" name="time" value="<%=new Date()%>" /> <input
						type="hidden" name="totalPrice" value="<%=subtotal%>" /> <input
						type="hidden" name="userId" value="1" /> <input type="hidden"
						name="restaurantId" value="1" /> <input type="hidden"
						name="foodId" value="1" /> <select name="faculty">
						<option value="1">Science</option>
						<option value="2">FEDCOS</option>
						<option value="3">Agriculture</option>
					</select> <select name="department">
						<option value="1">Computer Science</option>
					</select> <select name="block">
						<option value="1">Block A</option>
						<option value="2">Block B</option>
						<option value="3">Block C</option>
					</select> <select name="room">
						<option value="1">Room 1</option>
						<option value="2">Room 2</option>
						<option value="3">Room 3</option>
					</select>
			</tr>
			</br> </br> <input type='submit' name='submit' value="Place Order" />
			</form>

		</div>
		<div id="cartFooter" style="display: none">
			<span>Subtotal: Ksh <%=subtotal%>.00
			</span>
			<button
				onclick=" window.location.href=('<%=url%>?showCheckOut=yes'); "
				value="Check Out">Check Out</button>

		</div>
		<%
			try {
					if (request.getParameter("showCheckOut").equals("yes")) {

						if (user != null) {
							out.println(
									"<script>document.getElementById('checkoutModal').style.display = 'block';</script>");
							
							out.println(
									"<script>document.getElementById('cartFooter').style.display = 'none';</script>");

							
						
						} else {
							out.println(
									"<script>document.getElementById('cartFooter').style.display = 'block';</script>");

							out.println(
									"<script>document.getElementById('checkoutModal').style.display = 'none';</script>");

							out.println(
									"<script type=\"text/javascript\"> alert(\"You need to log in to proceed with check out.\"); </script>");
						}

					} else if (request.getParameter("showCheckOut").equals("processed")) {

					} else {
						out.println("<script>document.getElementById('cartFooter').style.display = 'block';</script>");

					}
				} catch (Exception e) {
					//	response.sendRedirect(url);
					out.println("<script>document.getElementById('cartFooter').style.display = 'block';</script>");

				}

			}
		%>
	</div>
</div>



<%@ include file="scripts.jsp"%>

</html>

