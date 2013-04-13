package com.studentzone.util;

public class RuntimeSettings {
	public static final String APPLICATION_NAME = "studentzone";
	public static final String VERSION_ID = " version 0.1"
			+ " dated Jan 21, 2013";
	public static final String SERVER_IP = "localhost";
	public static String databaseName = "studentzone";
	public static String dbUserID = "root";
	public static String dbPassword = "nonroot"; 
	public static String RUN_MODE = "Test"; // "Production"; //
	public static boolean IS_IN_DEBUG_MODE = true; // false; //
	public static int portNo = 3306;// 5432; //
	public static String driverClass = "com.mysql.jdbc.Driver";
}
