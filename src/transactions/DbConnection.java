package transactions;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {

	public static Connection openConnection() {

		// db parameters
		String url = "jdbc:mysql://localhost:3306/cafe";
		String user = "root";
		String password = "root";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, user, password);

			return connection;
		} catch (Exception e) {
		}
		return null;

	}

}
