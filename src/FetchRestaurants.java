import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Restaurant;
import transactions.RestaurantIO;

@WebServlet("/FetchRestaurants")
public class FetchRestaurants extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FetchRestaurants() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		// Origin to call after processing
		String url = request.getParameter("url");

		try {
			// Get restaurants from DB
			ArrayList<Restaurant> restaurants = RestaurantIO.getRestaurants();

			session.setAttribute("restaurants", restaurants);
			response.sendRedirect(url);

		} catch (Exception e) {
			// Failed to connect to DB
		}

	}

}
