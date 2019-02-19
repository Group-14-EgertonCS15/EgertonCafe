package transactions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import models.Food;
import models.Restaurant;

public class FoodIO {

	public static ArrayList<Food> getFoods() throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get foods from DB
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM foods");

		// Initialize foods in arrayList
		ArrayList<Food> foods = new ArrayList<>();
		while (rs.next())
			foods.add(new Food(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("img_url"),
					rs.getInt("restaurant_id")));

		// Close DB connection
		connection.close();

		return foods;
	}

	public static Food getFoodById(int id) throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get the food from DB with specified id
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM foods WHERE id = " + id);

		// Return food if found
		if (rs.next())
			return new Food(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("img_url"),
					rs.getInt("restaurant_id"));

		// Close DB connection
		connection.close();

		return null;
	}

	public static ArrayList<Food> getFoodsByRestaurant(Restaurant r) throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get foods from DB
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM foods WHERE restaurant_id = " + r.getId());

		// Initialize foods in arrayList
		ArrayList<Food> foods = new ArrayList<>();
		while (rs.next())
			foods.add(new Food(rs.getInt("id"), rs.getString("name"), rs.getInt("price"), rs.getString("img_url"),
					rs.getInt("restaurant_id")));

		// Close DB connection
		connection.close();

		return foods;
	}

}
