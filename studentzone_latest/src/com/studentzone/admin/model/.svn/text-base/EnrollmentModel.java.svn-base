package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.studentzone.util.MySqlConnection;

public class EnrollmentModel {

	/*
	 * to work with DB
	 */
	static PreparedStatement statement=null;
	static String sqlQuery="";
	
	/*
	 * inserting values into enrollment table
	 */
	public static void insertEnrollmentDetails(Enrollment obj) throws SQLException{
	
		Connection con=MySqlConnection.getInstance().getConnection();

		try{
			sqlQuery = "USE studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();

			sqlQuery = "INSERT INTO studentzone_enrollment(enrollmentSemester, enrollmentDeadLine, subjectID) " +
					"VALUES('"+obj.getEnrollmentSemester()+"','"+obj.getEnrollmentDeadline()+"',"+obj.getSubjectID()+");";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();
		}

		finally{
			statement.close();
			con.close();
		}
	}

}
