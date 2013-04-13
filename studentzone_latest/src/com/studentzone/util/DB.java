package com.studentzone.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.Statement;


public class DB {
	// private static DataSource data;
	private static DataSource data;// , data1 = null;
	static int timeCounter = 0;
	static boolean isActiveConnectionsWatcherStarted = false;
	protected static Connection conn;
	protected DatabaseMetaData dmd;
	protected ResultSetMetaData rsmd = null;
	protected ResultSet rs;
	protected Statement stmt;
	protected static boolean isSeekingConnectionFirstTime = true;
	protected static boolean isEnteredBMTCFirstTime = true;
	protected static boolean isEnteredCelcabsFirstTime = true;
	protected static int activeConnections;
	static String SPACES = "                           " + "                 ";
	private static DB db = new DB();

	private DB() {
	}

	public static DB getInstance() {
		return db;
	}

	public static void main(String[] args) {
		db.createDatabase("studentzone");
	}

	/**
	 * create a database; drops it first if it exists
	 * 
	 * @param databaseName
	 */
	public void createDatabase(String databaseName) {
		try {
			Statement stmt;

			// Register the JDBC driver for MySQL.
			Class.forName("com.mysql.jdbc.Driver");

			// Define URL of database server for
			// database named mysql on the localhost
			// with the default port number 3306.
			String url = "jdbc:mysql://localhost:3306/mysql";

			// Get a connection to the database for a
			// user named root with a blank password.
			// This user is the default administrator
			// having full privileges to do anything.
			Connection con = DriverManager.getConnection(url,
					RuntimeSettings.dbUserID, 
					RuntimeSettings.dbPassword);

			// Display URL and connection information
			System.out.println("URL: " + url);
			System.out.println("Connection: " + con);

			// Get a Statement object
			stmt = con.createStatement();

			// Create the new database after 1st dropping it if it exists
			stmt.executeUpdate("CREATE DATABASE IF NOT EXISTS " + databaseName);

			stmt.executeUpdate("CREATE DATABASE " + databaseName);
			stmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}// end catch
	}
	
	public static PreparedStatement useDataBase(Connection con){
		PreparedStatement statement;
		try {
			statement=con.prepareStatement("use studentzone;");
			statement.execute();
			return statement;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
