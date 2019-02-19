package transactions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import models.Restaurant;

public class RestaurantIO {

	public static ArrayList<Restaurant> getRestaurants() throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get restaurants from DB
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM restaurants");

		// Initialize restaurants in arrayList
		ArrayList<Restaurant> restaurants = new ArrayList<>();
		while (rs.next())
			restaurants.add(new Restaurant(rs.getInt("id"), rs.getString("name")));

		// Close DB connection
		connection.close();

		return restaurants;
	}

	public static Restaurant getRestaurantById(int id) throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get the restaurant from DB with id specified
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM restaurants WHERE id = " + id);

		// Return restaurant if found
		if (rs.next())
			return new Restaurant(rs.getInt("id"), rs.getString("name"));

		// Close DB connection
		connection.close();

		return null;
	}

}
