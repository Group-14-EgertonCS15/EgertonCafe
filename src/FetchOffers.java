import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.Offer;
import transactions.OffersIO;

@WebServlet("/FetchOffers")
public class FetchOffers extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FetchOffers() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();

		try {
			// Get offers
			ArrayList<Offer> offers = OffersIO.getOffers();

			if (!offers.isEmpty()) {
				session.setAttribute("offers", offers);
				response.sendRedirect("offers.jsp");
			}

			else {
				request.setAttribute("error", "No Offers Available At This Time");
				RequestDispatcher rd = request.getRequestDispatcher("/offers.jsp");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/offers.jsp");
			rd.forward(request, response);
		}

	}

}
