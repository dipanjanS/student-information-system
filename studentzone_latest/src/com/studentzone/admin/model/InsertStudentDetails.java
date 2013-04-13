package com.studentzone.admin.model;
import com.studentzone.util.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.Connection;



public class InsertStudentDetails{
	
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	private static int fetchStudentID;
	static java.sql.Date sqlDate;
	static int res = 0;
	
	
	public static void insertData(String userName,String password) throws SQLException{
		System.out.println("in details inserted..."+userName);
		Connection con=MySqlConnection.getInstance().getConnection();

		try{

			DB.useDataBase(con);
			sqlQuery = "insert into studentzone_student(userName, password)values(?,?);";
			statement=con.prepareStatement(sqlQuery);
			statement.setString(1, userName);
			statement.setString(2, password);
			res = statement.executeUpdate(); 

		}
		catch(Exception e){
			e.printStackTrace();
		}
		finally{
			try {
				con.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public static int getStudentID(String userName) throws SQLException{
		Connection con=MySqlConnection.getInstance().getConnection();
		try{
			DB.useDataBase(con);
			sqlQuery = "select studentID from studentzone_student where userName='"+userName+"';";
			System.out.println("####"+sqlQuery);
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				fetchStudentID=rs.getInt(1);
			}
			System.out.println("student..."+fetchStudentID);
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return fetchStudentID;
	}
	public static void insertInProfile(String rollNo,String name,String dob,String userImageFileName,int studentID) throws SQLException{
		Connection con=MySqlConnection.getInstance().getConnection();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date;
		try {
			date = sdf.parse(dob);

			sqlDate = new Date(date.getTime());

		}
		catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{
			DB.useDataBase(con);
			sqlQuery = "insert into studentzone_student_profile(studentRollNo,studentName,studentDOB,studentImgUrl,studentID)values(?,?,?,?,?);";
			statement=con.prepareStatement(sqlQuery);
			statement.setString(1, rollNo);
			statement.setString(2, name);
			statement.setDate(3, sqlDate);
			statement.setString(4, userImageFileName);
			statement.setInt(5, studentID);
			res = statement.executeUpdate(); 
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
}

