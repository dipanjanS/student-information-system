package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.studentzone.util.MySqlConnection;

public class ShowSubjectToEnrollModel {

	/*
	 * to work with DB
	 */
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static String sqlQuery="";

	/*
	 * to get subject details for Enroll page
	 */
	public static ArrayList<ShowSubjectToEnroll> getSubjectsToEnrollDetails(String semester, int studentID) throws SQLException {

		ArrayList<ShowSubjectToEnroll> subjectList = new ArrayList<ShowSubjectToEnroll>();

		Connection con=MySqlConnection.getInstance().getConnection();

		try{

			sqlQuery = "USE studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();

			/*
			 * fetching the subjects for enrolling
			 * selecting only those subjects for which
			 * 1)
			 * (todaydate < enrollmentdeadline date) OR
			 * (todaydate = enrollmentdeadline date AND todaytime < enrollmentdeadline time)
			 * 
			 * 2) student has not already enrolled 
			 */
			sqlQuery = "SELECT subjectName, subjectCode, enrollmentID, S.subjectID FROM studentzone_subject S, " +
					"studentzone_enrollment E WHERE E.subjectID=S.subjectID AND " +
					"E.enrollmentSemester=S.subjectSemester AND" +
					" S.subjectSemester='"+ semester +"' AND (date_format(E.enrollmentDeadLine,'%d-%m-%Y')>" +
					"date_format(sysdate(),'%d-%m-%Y') OR (date_format(E.enrollmentDeadLine, '%d-%m-%Y')" +
					"=date_format(sysdate(),'%d-%m-%Y') AND time_format(E.enrollmentDeadLine, '%H-%i-%s')>" +
					"time_format(sysdate(),'%H-%i-%s'))) AND E.enrollmentID NOT IN (SELECT enrollmentID FROM " +
					"studentzone_student_enrollment WHERE studentID="+ studentID +");;";

			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				ShowSubjectToEnroll subjectObj = new ShowSubjectToEnroll();
				subjectObj.setSubjectName(rs.getString(1));
				subjectObj.setSubjectCode(rs.getString(2));
				subjectObj.setEnrollmentID(rs.getInt(3));
				subjectObj.setSubjectId(rs.getInt(4));
				subjectList.add(subjectObj);
			}
		}
		catch (Exception e) {
			subjectList.clear();
			e.printStackTrace();
		}

		finally{
			rs.close();
			statement.close();
			con.close();
		}			

		return subjectList;
	}


	/*
	 * Get subjects already enrolled
	 */
	public static ArrayList<ShowSubjectToEnroll> getSubjectsEnrolledDetails(String semester, int studentID) throws SQLException {

		ArrayList<ShowSubjectToEnroll> subjectList = new ArrayList<ShowSubjectToEnroll>();

		Connection con=MySqlConnection.getInstance().getConnection();

		try{

			sqlQuery = "USE studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();

			/*
			 * fetching the subjects for enrolling
			 * selecting only those subjects for which
			 * 1)
			 * (todaydate < enrollmentdeadline date) OR
			 * (todaydate = enrollmentdeadline date AND todaytime < enrollemntdeadline time)
			 * 
			 * 2) student has already enrolled 
			 */
			sqlQuery = "SELECT subjectName, subjectCode, enrollmentID, S.subjectID FROM studentzone_subject S, " +
					"studentzone_enrollment E WHERE E.subjectID=S.subjectID AND " +
					"E.enrollmentSemester=S.subjectSemester AND" +
					" S.subjectSemester='"+ semester +"' AND E.enrollmentID IN (SELECT enrollmentID FROM " +
					"studentzone_student_enrollment WHERE studentID="+ studentID +");;";

			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				ShowSubjectToEnroll subjectObj = new ShowSubjectToEnroll();
				subjectObj.setSubjectName(rs.getString(1));
				subjectObj.setSubjectCode(rs.getString(2));
				subjectObj.setEnrollmentID(rs.getInt(3));
				subjectObj.setSubjectId(rs.getInt(4));
				subjectList.add(subjectObj);
			}
		}
		catch (Exception e) {
			subjectList.clear();
			e.printStackTrace();
		}

		finally{
			rs.close();
			statement.close();
			con.close();
		}			

		return subjectList;
	}


	/*
	 * to enroll student for selected courses
	 */
	public static void enrollStudent(int studentID, int enrollmentID) throws SQLException{
		Connection con=MySqlConnection.getInstance().getConnection();

		try{

			sqlQuery = "USE studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();

			/*
			 * inserting into student_enrollment table
			 */	
			sqlQuery = "INSERT INTO studentzone_student_enrollment(studentID, enrollmentID) " +
					"VALUES("+studentID+","+enrollmentID+");";

			statement=con.prepareStatement(sqlQuery);
			statement.executeUpdate();

			try{
				int subID=0;
				/*
				 * fetching subjectID for enrollment
				 */
				sqlQuery = "SELECT subjectID FROM studentzone_enrollment WHERE enrollmentID="+ enrollmentID +";";
				statement=con.prepareStatement(sqlQuery);
				rs=statement.executeQuery();

				while(rs.next()){
					subID = rs.getInt(1);
				}

				/*
				 * inserting into student_subject table
				 */
				sqlQuery = "INSERT INTO studentzone_student_subject(studentID, subjectID) " +
						"VALUES("+studentID+","+subID+");";

				statement=con.prepareStatement(sqlQuery);
				statement.executeUpdate();

			}
			finally{
				/* empty */
			}
		}

		finally{
			rs.close();
			statement.close();
			con.close();
		}
	}
}