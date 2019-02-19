<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="models.*"%>

<html>

<%-- 
<script type="text/javascript">

function addToCart( restID ) {
	parent.open('DisplayCart?foodId=' + restID + '&qty=1');


	<%
	if ( cartItems.isEmpty() || cartItems == null)
	{%>		
		parent.open('DisplayCart?foodId=' + restID + '&qty=1');
		
		<%}
	else {
	
	%>
	if( restID+"" ==  <%=cartItems.get(0).getFood().getRestaurantId()%>
	) {
			parent.open('DisplayCart?foodId=' + restID + '&qty=1');

		} 
	
	 else {
			if (confirm('Adding an item from a different restaurant will reset the cart.\nDo you want to continue adding it?')) {
<%cartItems = new ArrayList<CartItem>();
			session.setAttribute("cart", cartItems);%>
	parent.open('DisplayCart?foodId=' + restID + '&qty=1');

				// Save it!
			} else {
				// Do nothing!
			}
		}
	<%}%>
	
	

	}
</script> --%>



<link href="css/styleCart.css" rel="stylesheet" type="text/css"
	media="all" />

<div id="myModal" class="cart" align="center" style="left: 25%;">
	<span id="cartClose" class="cartClose">&times;</span>

	<div class=" modal-contents">
		<!-- 		<form action="DisplayCart" method="post">
 -->
		<table cellpadding="5" border="0">
			<tr>
				<th align="left" width="15%"></th>
				<th align="left" width="30%"></th>
				<th align="left" width="25%"></th>
				<th align="center" width="10%"></th>
				<th align="right" width="20%"></th>
			</tr>

			<%
				ArrayList<CartItem> cartItems = (ArrayList<CartItem>) session.getAttribute("cart");
				if (cartItems == null || cartItems.isEmpty()) {
					out.println(" <span> Your Cart Is Empty </span> ");
				} else
					for (CartItem item : cartItems) {
			%>

			<tr valign="baseline" style="min-height: 12px">
				<td><img src="<%=item.getFood().getImageUrl()%>" width="50%"></td>
				<td><%=item.getFood().getName()%></td>
				<td><input minlenfth="1" required
					style="border-radius: 2; max-width 12px; border: 0; border: 2px solid #84C639;"
					type="number" name="qty" value="<%=item.getQuantity()%>"
					onchange="parent.open('DisplayCart?foodId=<%=item.getFood().getId()%>&qty='+this.value+'&update=true')"
					onpaste()="this.onchange();"></td>
				<td><input type="button" value="&times;"
					onclick="parent.open('DisplayCart?foodId=<%=item.getFood().getId()%>&qty=0&remove=true')"
					style="border-radius: 2; background-color: #f00; border: 0; width: 24px; height: 24px;">
				</td>
				<td><%="Ksh " + item.getTotalPrice() + ".00"%></td>
			</tr>


			<tr>
				<td colspan="5"><hr></td>
			</tr>
			<%
				}
			%>
		</table>
		<!-- 		</form>
 -->

	</div>

	<div>
		<%
			int subtotal = 0;
			for (CartItem item : cartItems) {
				subtotal = item.getTotalPrice() + subtotal;
			}

			out.println("<span>Subtotal: Ksh " + subtotal + ".00 </span>");
			if (subtotal > 0)
				out.println("<button>Check Out</button>");
		%>
	</div>
</div>





<%@ include file="scripts.jsp"%>

</html>

