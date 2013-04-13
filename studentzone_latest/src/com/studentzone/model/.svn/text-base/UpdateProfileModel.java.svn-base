package com.studentzone.model;

import com.studentzone.util.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class UpdateProfileModel {
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static int result = 0;
	static int res = 0;
	static String sqlQuery="";
	static java.sql.Date sqlDate;
	static ArrayList<String> emails;
	static int existingEmail;

	static ArrayList<Integer> interestIds=new ArrayList<Integer>();
	public static void updateProfile(String studentName,String studentDOB,String userImageFileName){

		
		/*******
		 * int diffInDays = (int)( (newerDate.getTime() - olderDate.getTime()) 
                 / (1000 * 60 * 60 * 24) )
		 * *********/
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date;
		try {
			date = sdf.parse(studentDOB);

			sqlDate = new Date(date.getTime());
		}
		catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			sqlQuery = "update studentzone_student_profile set studentName = ?, studentDOB = ?, studentImgUrl = ? where studentID = ?;";
			statement=con.prepareStatement(sqlQuery);
			statement.setString(1, studentName);
			statement.setDate(2, sqlDate);
			statement.setString(3, userImageFileName);
			statement.setInt(4, Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString()));

			result=statement.executeUpdate();

		}
		catch (Exception e) {

			e.printStackTrace();
		}

	}

	public static int updateEmail(String email){
		existingEmail=0;
		emails=new ArrayList<String>();
		Map session = (Map) ActionContext.getContext().get("session");
		Integer studentID = (Integer) session.get("studentID");
		try{
			Connection con=MySqlConnection.getInstance().getConnection();
			DB.useDataBase(con);

			/*sqlQuery = "select  emailID from studentzone_student where studentID not in (?);";
			PreparedStatement ps=con.prepareStatement(sqlQuery);
			ps.setInt(1, studentID);
			rs=ps.executeQuery();
			while(rs.next()){
				emails.add(rs.getString(1));
				System.out.println(rs.getString(1));
			}
			System.out.println("###########"+emails.size());
			//statement.setString(1, interestName);
			//res = statement.executeUpdate(); 
			int returnValue=0;
			int length = emails.size();
			for(int i=0;i<length;i++){
				System.out.println(emails.get(i));
				//System.out.println("araalist of emails..."+emails.get(i));
				if(emails.get(i).equalsIgnoreCase(email)){
					returnValue=0;
				}
				else{ 
					returnValue=1;
				}
			}
			if(returnValue==0)
				return 0;
			else {*/
				sqlQuery = "update studentzone_student set emailID = ? where studentID = ?;";
				statement=con.prepareStatement(sqlQuery);
				statement.setString(1, email);
				statement.setInt(2, studentID);
				result=statement.executeUpdate();
				return 1;
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}



	public static void updateInterests(String newInterest){
		System.out.println("initial !!!"+newInterest);
		if(newInterest!=null){
			newInterest=newInterest.replaceAll(", ", "','");
			newInterest=newInterest+"\'";
			newInterest="\'"+newInterest;
			System.out.println("new string !!!!"+newInterest);
		}
		Connection con=null;
		try{
			if(newInterest==""){
				con=MySqlConnection.getInstance().getConnection();
				DB.useDataBase(con);

				sqlQuery = "select interestID from studentzone_interest where interestName in ("+newInterest+")";

			}
			else{
				con=MySqlConnection.getInstance().getConnection();
				DB.useDataBase(con);

				sqlQuery = "delete from studentzone_student_interest where studentID =?;";
				statement=con.prepareStatement(sqlQuery);
				statement.setInt(1,Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString()));
				result=statement.executeUpdate();
				System.out.println("RES:>>>>"+result);

				sqlQuery = "select interestID from studentzone_interest where interestName in ("+newInterest+")";
				statement=con.prepareStatement(sqlQuery);
				rs=statement.executeQuery();
				interestIds=new ArrayList<Integer>();
				while(rs.next()){
					interestIds.add(rs.getInt(1));
					System.out.println("Added: "+rs.getInt(1));
				}

				for(int i=0;i<interestIds.size();i++){
					sqlQuery = "insert into studentzone_student_interest(studentID, interestID, interestName) values (?,?,?);";
					statement=con.prepareStatement(sqlQuery);
					statement.setInt(1,Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString()) );
					int id = interestIds.get(i);
					statement.setInt(2, id);

					String newQuery = "select interestName from studentzone_interest where interestID =?;";
					PreparedStatement ps=con.prepareStatement(newQuery);
					ps.setInt(1, id);
					rs=ps.executeQuery();
					String interestName="";
					while(rs.next()){
						interestName = rs.getString(1);
					}

					statement.setString(3, interestName);
					res = statement.executeUpdate(); 
					System.out.println("Updated:"+res);
				}
			}
		}
		catch (Exception e) {

			e.printStackTrace();
		}
		for(int i=0;i<interestIds.size();i++)
			System.out.println("@@@@"+interestIds.get(i));
	}
}
