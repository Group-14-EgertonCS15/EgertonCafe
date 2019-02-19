<!DOCTYPE html>
<html>
<%
	session.setAttribute("url", "login.jsp");

session.setAttribute("restaurant", null);

	User u = (User) session.getAttribute("user");
	if (u != null) {
		response.sendRedirect("offers.jsp");
		return;
	}
%>
<%@ include file="header.jsp"%>

<body
	<%try {
				if (request.getParameter("param").equalsIgnoreCase("register"))
					out.println(" onload = \"$('.toggle').click() \" ");
			} catch (Exception e) {
			}%>>

	<!-- Content -->
	<div class="banner">
		<div class="content_max">
			<h3>Sign In & Sign Up</h3>
			</br>

			<!-- Show Authentication Errors -->
			<%
				if (request.getAttribute("error") != null) {
					out.println(" <h4 align=\"center\" style=\"color:#FA1818;\"> </br>");
					out.println(request.getAttribute("loginError"));
					out.println("</h4>");
				}
				
			%>

			<div class="w3_login_module">

				<div class="module form-module">

					<div class="toggle">
						<i id="auth_toggle">Register</i>
					</div>
					<div class="form">
						<h2>Login to your account</h2>
						<form action="LoginClass" method="post">
							<input type="text" name="email" placeholder="Email" required=" ">
							<input type="password" name="password" placeholder="Password"
								required=" "> <input type="submit" value="Login">
						</form>
					</div>
					<div class="form">
						<h2>Create an account</h2>
						<form action="RegisterClass" method="post">
							<input type="text" name="firstname" placeholder="First Name"
								required=" "> <input type="text" name="lastname"
								placeholder="Last Name" required=" "> <input
								type="email" name="email" placeholder="Email Address"
								required=" "> <input type="password" name="password1"
								placeholder="Password" required=" "> <input
								type="password" name="password2" placeholder="Confirm Password"
								required=" "> <input type="submit" value="Register">
						</form>
					</div>
					<div class="cta">
						<a href="#">Forgot your password?</a>
					</div>
				</div>
			</div>
		</div>


		<div class="clearfix"></div>
	</div>
	<!-- //Content -->

	<!-- Footer and Scripts -->
	<%@ include file="footer.jsp"%>

</body>
</html>

