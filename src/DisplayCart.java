import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.CartItem;
import models.Food;
import transactions.FoodIO;

@WebServlet("/DisplayCart")

public class DisplayCart extends HttpServlet {

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

		// Get parameters from request
		int qty = Integer.parseInt(request.getParameter("qty"));
		int foodId = Integer.parseInt(request.getParameter("foodId"));
		String action = request.getParameter("action");

		String removeButtonValue = request.getParameter("remove");
		String updateButtonValue = request.getParameter("update");
		String addButtonValue = request.getParameter("add");

		// Callback URL
		String url = (String) session.getAttribute("url");

		// Initialize Cart in session
		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");
		if (cart == null) {
			cart = new ArrayList<CartItem>();
			session.setAttribute("cart", cart);
		}

		// Reset quantity to 1 for invalid entries
		if (qty < 0)
			qty = 1;

		try {
			// Get food item from foodId
			Food food = FoodIO.getFoodById(foodId);

			// session.setAttribute("food", food);

			if (food != null) {
				// Create a cart item
				CartItem cartItem = new CartItem(food, qty, qty * food.getPrice());

				// Remove Item From Cart
				if  (removeButtonValue != null) {
					removeFromCart(cartItem, cart);

				}

				// Update Item In Cart
				else if (updateButtonValue != null) {
					if (qty > 0)
						UpdateInCart(cartItem, cart);
					else
						removeFromCart(cartItem, cart);
				}

				// Add or Update Item To Cart
				else {
					addToCart(cartItem, cart);
				}

				session.setAttribute("cart", cart);
				session.setAttribute("showcart", "true");
				response.sendRedirect(url);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	private void addToCart(CartItem item, ArrayList<CartItem> cart) {
		for (CartItem i : cart)
			if (i.getFood().getId() == item.getFood().getId()) {
				i.setQuantity(i.getQuantity() + 1);
				i.setTotalPrice(i.getQuantity() * i.getFood().getPrice());

				return;
			}

		cart.add(item);

	}

	private void UpdateInCart(CartItem item, ArrayList<CartItem> cart) {
		for (CartItem i : cart)
			if (i.getFood().getId() == item.getFood().getId()) {
				i.setQuantity(item.getQuantity());
				i.setTotalPrice(i.getQuantity() * i.getFood().getPrice());
			}

	}

	public void removeFromCart(CartItem cartItem, ArrayList<CartItem> cart) {

		for (int i = 0; i < cart.size(); i++)
			if (cart.get(i).getFood().getId() == (cartItem.getFood().getId()))
				cart.remove(i);
	}

}
