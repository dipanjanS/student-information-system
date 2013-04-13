package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.studentzone.util.DB;
import com.studentzone.util.MySqlConnection;

public class InsertAnnouncement {
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static String sqlQuery="";
	static java.sql.Date sqlDate;
	static int res = 0;
	static Connection con;
	static ArrayList<String> allAnnouncements=new ArrayList<String>();
	public static int addAnnouncement(String title,String content,String validity){

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date;
		try {
			date = sdf.parse(validity);

			sqlDate = new Date(date.getTime());

		}
		catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		try{
			con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);
			sqlQuery = "insert into studentzone_announcement(heading, content,validity)values(?,?,?);";
			statement=con.prepareStatement(sqlQuery);
			statement.setString(1, title);
			statement.setString(2, content);
			statement.setDate(3, sqlDate);
			res = statement.executeUpdate(); 
			return 1;

		}
		catch(Exception e){
			e.printStackTrace();
			return 0;
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
	public static ArrayList<String> getAllAnnouncements(){
		allAnnouncements.clear();
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "select heading from studentzone_announcement;";
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				allAnnouncements.add(rs.getString(1));
			}
		}
		catch( Exception e){
			e.printStackTrace();
		}
		return allAnnouncements;
	}
	public static int deleteAnnouncement(String announcementTitle){
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);


			sqlQuery = "delete from studentzone_announcement where heading=?;";
			statement=con.prepareStatement(sqlQuery);
			statement.setString(1, announcementTitle);
			res=statement.executeUpdate();
			return 1;
		}
		catch( Exception e){
			e.printStackTrace();
			return 0;
		}


	}
}
