package com.studentzone.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.studentzone.util.*;

public class ViewProfileModel {
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	private String studentRollNo;
	private String studentName;
	private Date studentDOB;
	private String emailID;

	private static ArrayList<String>studentInterests=new ArrayList<String>();
	static ViewProfileModel details;
	public String getStudentRollNo() {
		return studentRollNo;
	}
	public void setStudentRollNo(String studentRollNo) {
		this.studentRollNo = studentRollNo;
	}
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public Date getStudentDOB() {
		return studentDOB;
	}
	public void setStudentDOB(Date studentDOB) {
		this.studentDOB = studentDOB;
	}

	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public static ViewProfileModel getDetails(int studentID) throws SQLException{
		details=new ViewProfileModel();

		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "select studentzone_student_profile.studentrollno,studentzone_student_profile.studentname," +
					"studentzone_student_profile.studentdob,studentzone_student.emailID from " +
					"studentzone_student_profile,studentzone_student where " +
					"studentzone_student.studentid=studentzone_student_profile.studentid and " +
					"studentzone_student_profile.studentid='"+studentID+"';";
			
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				details.setStudentRollNo(rs.getString(1));
				details.setStudentName(rs.getString(2));
				details.setStudentDOB(rs.getDate(3));
				details.setEmailID(rs.getString(4));
			}
		}
		catch( Exception e){
			e.printStackTrace();
		}
		System.out.println("in view model...."+details.getEmailID());
		return details;
	}
	public static ArrayList<String> getInterests(int studentID){
		studentInterests.clear();

		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "select  studentzone_student_interest.interestName from studentzone_student_interest,studentzone_interest where studentzone_student_interest.interestID=studentzone_interest.interestID and studentzone_student_interest.studentid='"+studentID+"';";
			//System.out.println("....."+sqlQuery);
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				studentInterests.add(rs.getString(1));
			}
		}
		catch( Exception e){
			e.printStackTrace();
		}

		return studentInterests;
	}
}
