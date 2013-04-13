package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.studentzone.util.*;

public class EditProfileModel {
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static ArrayList<String> allInterests=new ArrayList<String>();
	static ArrayList<String> defaultInterests=new ArrayList<String>();

	public static ArrayList<String> getAllList(int studentID){
		allInterests.clear();
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "select interestname from studentzone_interest;";
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				allInterests.add(rs.getString(1));		
			}
		}
		catch( Exception e){
			e.printStackTrace();
		}
		return allInterests;
	}
	public static ArrayList<String> getDefaultInterests(int studentID){
		defaultInterests.clear();
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery="select studentzone_student_interest.interestName from studentzone_student_interest where studentzone_student_interest.studentid='"+studentID+"';";
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				defaultInterests.add(rs.getString(1));
				
			}
		}
		catch( Exception e){
			e.printStackTrace();
		}

		return defaultInterests;
	}
}
