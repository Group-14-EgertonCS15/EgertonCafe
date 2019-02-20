import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import transactions.UserIO;

@WebServlet("/LoginClass")
public class LoginClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginClass() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			// To monitor authentication status
			boolean isLoggedIn = false;

			// Get request parameters
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			// Get * users from DB
			ArrayList<User> users = UserIO.getUsers();

			// Check user matching parameters
			for (User u : users) {
				if (u.getEmail().equalsIgnoreCase(email)) {
					if (u.getPassword().equals(password)) {

						// Logged in successfully
						session.setAttribute("user", u);
						isLoggedIn = true;

						if (u.getType().equals("customer")) {
							response.sendRedirect("offers.jsp");
						} else {
							response.sendRedirect("admin/restaraunts.html");
						}

					}
				}

			}

			// Login failed
			if (!isLoggedIn) {
				request.setAttribute("error", "Wrong Email or Password");
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			// Failed to connect to DB
			request.setAttribute("error", "A Connection Error Ocurred. Retry Later");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
			rd.forward(request, response);
		}
	}

}
