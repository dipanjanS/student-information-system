package com.studentzone.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.studentzone.util.MySqlConnection;

public class ForgotPassword {

	public static ResultSet find(String whereClause, String tableName) {
		ResultSet result = null;
		MySqlConnection con = new MySqlConnection();
		Connection connection;
		Statement statement;

		try {
			connection = con.getConnection();
			String query = "select * from " + tableName + " where "
					+ whereClause;
			statement = connection.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			System.out.println(query);
			result = statement.executeQuery(query);
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Connection to DB failed");
		}
		return result;
	}

	public static void update(String whereClause, String tableName,
			String password) {
		MySqlConnection con = new MySqlConnection();
		Connection connection;
		Statement statement;

		try {
			connection = con.getConnection();
			String query = "update " + tableName + " set password ='"
					+ password + "' where " + whereClause;
			statement = connection.createStatement(
					ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY);
			statement.executeUpdate(query);
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("Connection to DB failed");
		}
	}

}
