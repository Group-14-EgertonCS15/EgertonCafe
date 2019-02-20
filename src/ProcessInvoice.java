import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CartItem;
import models.Food;
import transactions.FoodIO;

@WebServlet("/ProcessInvoice")

public class ProcessInvoice extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		session.setAttribute("cart", new ArrayList<CartItem>());

		try {
			String faculty = request.getParameter("faculty");
			String department = request.getParameter("department");
			String block = request.getParameter("block");
			String room = request.getParameter("room");

			String time = request.getParameter("time");

			int totalPrice = Integer.valueOf(request.getParameter("totalPrice"));
			int userId = Integer.valueOf(request.getParameter("userId"));
			int restaurantId = Integer.valueOf(request.getParameter("restaurantId"));
			int foodId = Integer.valueOf(request.getParameter("foodId"));

			String url = "jdbc:mysql://localhost:3306/cafe";
			String user = "root";
			String password = "root";

			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, user, password);

			String query = "INSERT INTO orders (faculty, depertment, block, room_no, total_price, status, order_time, rest_id, food_id, cust_id) Values (?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement ps = connection.prepareStatement(query);
			ps.setString(1, faculty);
			ps.setString(2, department);
			ps.setString(3, block);
			ps.setString(4, room);
			ps.setInt(5, totalPrice);
			ps.setString(6, "Waiting");
			ps.setString(7, time);
			ps.setInt(8, restaurantId);
			ps.setInt(9, foodId);
			ps.setInt(10, userId);

			// session.setAttribute("cart", cart);
			if (ps.execute()) {
				response.sendRedirect((String) session.getAttribute("url")+"?showCheckOut=processed");

			} else {
				response.sendRedirect((String) session.getAttribute("url")+"?showCheckOut=processed");

			}

		} catch (Exception e) {
			response.sendRedirect((String) session.getAttribute("url")+"?showCheckOut=processed");
		}
	}

}
