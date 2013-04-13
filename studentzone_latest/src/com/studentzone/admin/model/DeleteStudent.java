package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.studentzone.util.DB;
import com.studentzone.util.MySqlConnection;

public class DeleteStudent {
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static int res=0;
	static String sqlQuery="";
	static int studentID;
	static ArrayList<String> allRoll=new ArrayList();
	public static ArrayList<String> getAllRollNumbers(){
		allRoll.clear();

		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "select studentrollno from studentzone_student_profile;";
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				allRoll.add(rs.getString(1));
			}
		}
		catch( Exception e){
			e.printStackTrace();
		}

		return allRoll;
	}
	public static int deleteStudent(String rollNo){
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "select studentID from studentzone_student_profile where studentrollno=?;";
			statement=con.prepareStatement(sqlQuery);
			statement.setString(1, rollNo);
			rs=statement.executeQuery();

			while(rs.next()){
				studentID=rs.getInt(1);
			}
			System.out.println("id.."+studentID);
			sqlQuery = "delete from studentzone_student where studentID=?;";
			statement=con.prepareStatement(sqlQuery);
			statement.setInt(1, studentID);
			res=statement.executeUpdate();
			return 1;
		}
		catch( Exception e){
			e.printStackTrace();
			return 0;
		}

	}
}
