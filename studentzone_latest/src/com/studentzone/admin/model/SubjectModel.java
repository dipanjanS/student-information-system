package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.studentzone.util.MySqlConnection;

public class SubjectModel {

	/*
	 * to work with DB
	 */
	static PreparedStatement statement=null;
	static String sqlQuery="";
	
	/*
	 * inserting values into subject table
	 */
	public static void insertSubjectDetails(Subject obj) throws SQLException{
	
		Connection con=MySqlConnection.getInstance().getConnection();

		try{
			sqlQuery = "USE studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();

			sqlQuery = "INSERT INTO studentzone_subject(subjectName, subjectCode, subjectSemester) " +
					"VALUES('"+obj.getSubjectName()+"','"+obj.getSubjectCode()+"','"+obj.getSubjectSemester()+"');";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();
		}

		finally{
			statement.close();
			con.close();
		}
	}
	
}
