import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;

import java.sql.*;
import java.io.*;

@WebServlet("/RegisterClass")
public class RegisterClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterClass() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		try {
			// Initialize DB Connection
			String connectionURL = "jdbc:mysql://10.42.0.127/cafe";
			Connection connection = null;
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(connectionURL, "root", "root");

			// Get Request Parameters
			String firstname = request.getParameter("firstname");
			String lastname = request.getParameter("lastname");
			String email = request.getParameter("email");
			String passwd = request.getParameter("password");

			User user = new User(1,firstname, lastname, email, passwd, "");

			boolean isRegistered = false;
			Statement stmt = connection.createStatement();

			// Check if email exists in Customers
			ResultSet results = stmt.executeQuery("select * from customers");
			while (results.next()) {
				isRegistered = true;
				request.setAttribute("loginError", "Email is already registered");
			}

			// Check if email exists in Administrators
			if (!isRegistered) {
				ResultSet results2 = stmt.executeQuery("select * from administrators");
				while (results2.next()) {
					isRegistered = true;
					request.setAttribute("loginError", "Email is already registered");
				}
			}

			// Insert User in db
			if (!isRegistered) {
				String query = "INSERT INTO customers (email,firstname,lastname,password) values('" + user.getEmail()
						+ "','" + user.getFirstname() + "','" + user.getLastname() + "','" + user.getPassword() + "')";
				int success = stmt.executeUpdate(query);
				if (success > 0) {
					session.setAttribute("email", user.getEmail());
					session.setAttribute("username", user.getFirstname() + " " + user.getLastname());

					response.sendRedirect("offers.jsp");
					isRegistered = true;
				}
			}

			if (!isRegistered) {
				// session.invalidate();
				request.setAttribute("loginError", "Wrong Email or Password");
				RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?param=register");
				rd.forward(request, response);
			}

			connection.close();
		} catch (Exception e) {
			session.invalidate();
			request.setAttribute("loginError", "A Connection Error Ocurred. Retry Later.");
			RequestDispatcher rd = request.getRequestDispatcher("/login.jsp?param=register");
			rd.forward(request, response);
		}
	}

}
