package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

import com.studentzone.util.MySqlConnection;

public class ManageGradesModel {

	/*
	 * to work with DB
	 */
	static PreparedStatement statement=null;
	static String sqlQuery="";
	static ResultSet rs=null;
	static java.sql.Date sqlDate;
	/*
	 * inserting values into grade table
	 */
	public static void insertGradeDetails(ManageGrades obj) throws SQLException{

		Connection con=MySqlConnection.getInstance().getConnection();

		try{
			sqlQuery = "use studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();
			String roll = obj.getStudentRollNo();
			String subCode = obj.getSubjectCode();
			String grade = obj.getSubjectGrade();
			String result = obj.getSubjectResult(); 
			String gdate = obj.getGradeDate();



			int studentID=0;
			sqlQuery = "select studentID from studentzone_student_profile where studentRollNo=?;";
			statement = con.prepareStatement(sqlQuery);
			statement.setString(1,roll);
			rs=statement.executeQuery();

			while(rs.next()){
				studentID = rs.getInt(1);
			}

			int subjectID=0;
			sqlQuery = "select subjectID from studentzone_subject where subjectCode=?;";
			statement = con.prepareStatement(sqlQuery);
			statement.setString(1,subCode);
			rs=statement.executeQuery();
			while(rs.next()){
				subjectID = rs.getInt(1);
			}

			
			if(!(gdate.equalsIgnoreCase(""))){
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date date;
				try {
					date = sdf.parse(gdate);
					sqlDate = new Date(date.getTime());
				}catch(Exception e){
					e.printStackTrace();
				}
				
				sqlQuery = "insert into studentzone_grade(subjectGrade, subjectResult, studentID, subjectID, gradeDate) " +
					"values(?,?,?,?,?);";
				statement=con.prepareStatement(sqlQuery);
				statement.setString(1, grade);
				statement.setString(2, result);
				statement.setInt(3, studentID);
				statement.setInt(4, subjectID);
				statement.setDate(5, sqlDate);
				statement.executeUpdate();
			}
			else{
				sqlQuery = "insert into studentzone_grade(subjectGrade, subjectResult, studentID, subjectID) " +
						"values(?,?,?,?);";
					statement=con.prepareStatement(sqlQuery);
					statement.setString(1, grade);
					statement.setString(2, result);
					statement.setInt(3, studentID);
					statement.setInt(4, subjectID);
					statement.executeUpdate();
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			statement.close();
			con.close();
		}
	}

}
