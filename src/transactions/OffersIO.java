package transactions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Food;
import models.Offer;
import models.Restaurant;

public class OffersIO {

	public static ArrayList<Offer> getOffers() throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get the offers from DB
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM offers");

		// Initialize offers in arrayList
		ArrayList<Offer> offers = new ArrayList<>();
		while (rs.next()) {
			Food food = FoodIO.getFoodById(rs.getInt("food_id"));
			Restaurant restaurant = RestaurantIO.getRestaurantById(rs.getInt("restaurant_id"));

			offers.add(new Offer(rs.getInt("id"), food, rs.getInt("discounted_price"), restaurant,
					rs.getString("start_time"), rs.getString("end_time")));
		}
		// Close DB connection
		connection.close();

		return offers;
	}

	public Offer getOfferById(int id) throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get the offer from DB with specified id
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM offers WHERE id = " + id);

		// Return offer if found
		if (rs.next()) {
			Food food = FoodIO.getFoodById(rs.getInt("food_id"));
			Restaurant restaurant = RestaurantIO.getRestaurantById(rs.getInt("restaurant_id"));

			return new Offer(rs.getInt("id"), food, rs.getInt("discounted_price"), restaurant,
					rs.getString("start_time"), rs.getString("end_time"));
		}

		// Close DB connection
		connection.close();

		return null;
	}

}
