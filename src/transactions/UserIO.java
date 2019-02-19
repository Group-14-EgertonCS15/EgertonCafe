package transactions;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import models.User;

public class UserIO {

	public static ArrayList<User> getUsers() throws SQLException {
		// Open DB connection
		Connection connection = DbConnection.openConnection();

		// Execute query to get users from DB
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("select * from customers");

		// Initialize Users in arrayList
		ArrayList<User> users = new ArrayList<User>();

		while (rs.next())
			users.add(new User(rs.getInt("id"), rs.getString("firstname"), rs.getString("lastname"),
					rs.getString("email"), rs.getString("password")));

		// Close DB connection
		connection.close();

		return users;
	}

}
