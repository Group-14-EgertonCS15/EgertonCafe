import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Food;
import models.Restaurant;
import transactions.FoodIO;
import transactions.RestaurantIO;

@WebServlet("/RestaurantsClass")
public class RestaurantsClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		HttpSession session = request.getSession();

		try {
			// Get request parameters
			int id = Integer.valueOf(request.getParameter("id"));

			// Get restaurant referenced by the id parameter
			Restaurant restaurant = RestaurantIO.getRestaurantById(id);

			// Get meals offered in specified restaurant
			ArrayList<Food> foods = FoodIO.getFoodsByRestaurant(restaurant);

			if (restaurant != null) {
				session.setAttribute("foods", foods);
				session.setAttribute("restaurant", restaurant);

				if (!foods.isEmpty()) {
					response.sendRedirect("shop.jsp");
				} else {

					request.setAttribute("error", "No Meals Available At This Time");
					RequestDispatcher rd = request.getRequestDispatcher("/shop.jsp");
					rd.forward(request, response);
				}
			}
		} catch (Exception e) {
			// Failed to connect to DB
			request.setAttribute("error", "A Connection Error Ocurred. Retry Later");
			RequestDispatcher rd = request.getRequestDispatcher("/shop.jsp");
			rd.forward(request, response);
		}

	}

}
