package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;


public class FriendListModel {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    private ResultSet resultSet = null;
    
   
    Map session = (Map) ActionContext.getContext().get("session");
    Integer uid = (Integer) session.get("studentID");
   
    /*
     * Get session id 
     * to fetch the data for all the students other than
     * the logged-in student
     */
    public ArrayList<Friend> fetchFriendList(String selectionModifier){
    	ArrayList<Friend> frd = new ArrayList<Friend>();
    	
    	try{
    		System.out.println("UID " + uid);
    		System.out.println("Testing");
    		String sql = "Select s.studentID , sp.studentRollNo , " +
    				"sp.studentName , sp.studentImgUrl from " +
    				"studentzone_student s join studentzone_student_profile sp " +
    				"on s.studentID = sp.studentID where " +
    				"s.studentID != " + uid + " " + selectionModifier;
    		System.out.println("SQL " + sql);
    		/*
    		 * create connection
    		 * and call SQL
    		 */
    		connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
    		 ptmt = connection.prepareStatement(sql);
             resultSet = ptmt.executeQuery();
             
             while(resultSet.next()) {
             	Friend fd = new Friend();
             	fd.stuId = resultSet.getInt("studentID");
             	fd.rollNo = resultSet.getString("studentRollNo");
             	fd.name = resultSet.getString("studentName");
             	fd.imageUrl = resultSet.getString("studentImgUrl");
             	frd.add(fd);
             }
             /*
              * Connection closed
              */
             resultSet.close();
             ptmt.close();
             
             System.out.println("Friends list");
             /*
              * To calculate total 
              * number of records in studentTable
              */
             int count = 0;
             sql = "select count(profileID) as count from studentzone_student_profile where studentID != " + uid;
             ptmt = connection.prepareStatement(sql);
             resultSet = ptmt.executeQuery();
             System.out.println("123");
             if(resultSet.next()) {
            	 System.out.println("234");
            	 count = resultSet.getInt("count");
                 System.out.println("Count " + count);
              }
             
             Friend.setNoOfRecords(count);
             
             /*
              * Connection closed
              */
             resultSet.close();
             ptmt.close();
             connection.close();
             
    	}
    	catch(Exception ex){
    		ex.printStackTrace();
    	}
    	return frd;
    }
    
    /*
     * This function to get the list of 
     * all the friends of logged-in user
     */
    public ArrayList<Friend> fetchMyFriends(String selectionModifier){
    	ArrayList<Friend> frd = new ArrayList<Friend>();
    	
    	try{
    		System.out.println("UID " + uid);
    		System.out.println("Testing");
    		
    		/*
    		 * Join friend table and profile table
    		 */
    		String sql = "Select distinct s.studentID , s.studentRollNo, " +
    		"s.studentName , s.studentImgUrl from studentzone_student_profile as s " +
    		" where s.studentID in " +
    		"(select distinct friendID from studentzone_friendship where studentID=" + uid +
    		 ") " + selectionModifier;
    		System.out.println("SQL " + sql);
    		/*
    		 * create connection
    		 * and call SQL
    		 */
    		connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
    		 ptmt = connection.prepareStatement(sql);
             resultSet = ptmt.executeQuery();
             
             while(resultSet.next()) {
             	Friend fd = new Friend();
             	fd.stuId = resultSet.getInt("studentID");
             	fd.rollNo = resultSet.getString("studentRollNo");
             	fd.name = resultSet.getString("studentName");
             	fd.imageUrl = resultSet.getString("studentImgUrl");
             	frd.add(fd);
             }
             /*
              * Connection closed
              */
             resultSet.close();
             ptmt.close();
             
             System.out.println("Friends list");
             /*
              * To calculate total 
              * number of records in studentTable
              */
             int count = 0;
             sql = "select count(friendID) as count from studentzone_friendship where studentID= " + uid;
             ptmt = connection.prepareStatement(sql);
             resultSet = ptmt.executeQuery();
            
             if(resultSet.next()) {
            	 count = resultSet.getInt("count");
                 System.out.println("Friend Count " + count);
              }
             
             Friend.setMyFriendRecords(count);
             
             /*
              * Connection closed
              */
             resultSet.close();
             ptmt.close();
             connection.close();
             
    	}
    	catch(Exception ex){
    		ex.printStackTrace();
    	}
    	return frd;
    }
    
    
    /*
	 * This function to get the list of 
	 * all the friends of logged-in user
	 */
	public ArrayList<Enemy> fetchMyEnemies(String selectionModifier){
		
		ArrayList<Enemy> enemyList = new ArrayList<Enemy>();

		try{
			/*
			 * Join friend table and profile table
			 */
			String sql = "Select distinct s.studentID , s.studentRollNo, " +
					"s.studentName , s.studentImgUrl from studentzone_student_profile as s " +
					" where s.studentID in " +
					"(select distinct enemyID from studentzone_enemy where studentID=" + uid +
					") " + selectionModifier;
			
			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			resultSet = ptmt.executeQuery();

			while(resultSet.next()) {
				Enemy enemyObj = new Enemy();
				enemyObj.stuId = resultSet.getInt("studentID");
				enemyObj.rollNo = resultSet.getString("studentRollNo");
				enemyObj.name = resultSet.getString("studentName");
				enemyObj.imageUrl = resultSet.getString("studentImgUrl");
				enemyList.add(enemyObj);
			}
			/*
			 * Connection closed
			 */
			resultSet.close();
			ptmt.close();

			/*
			 * To calculate total 
			 * number of records in studentTable
			 */
			int count = 0;
			sql = "select count(enemyID) as count from studentzone_enemy where studentID= " + uid;
			ptmt = connection.prepareStatement(sql);
			resultSet = ptmt.executeQuery();

			if(resultSet.next()) {
				count = resultSet.getInt("count");
			}

			Enemy.setMyEnemyRecords(count);

			/*
			 * Connection closed
			 */
			resultSet.close();
			ptmt.close();
			connection.close();

		}
		catch(Exception ex){
			ex.printStackTrace();
		}
		return enemyList;
	}
}
