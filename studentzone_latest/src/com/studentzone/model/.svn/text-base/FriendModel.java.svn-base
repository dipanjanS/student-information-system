package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class FriendModel {
	private Connection connection = null;
	private PreparedStatement ptmt = null;
	private ResultSet resultSet = null;
	/*
	 * Get session id 
	 * to insert/delete the record for student ID
	 */
	Map session = (Map) ActionContext.getContext().get("session");
	Integer uid = (Integer) session.get("studentID");

	//Add into the table(add as a friend)
	public String insertInto(int friendId) throws SQLException
	{
		String flag = "done";
		try{
			String sql = "insert into studentzone_friendship(friendshipID , " +
					"studentID , friendID) values (null ," +
					uid + " , " + friendId + ");";
			System.out.println("SQL " + sql);
			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			ptmt.executeUpdate();

			/*
			 * Connection closed
			 */

			ptmt.close();
			sql = "insert into studentzone_friendship(friendshipID , " +
					"studentID , friendID) values (null ," + friendId + "," +
					uid + ");";
			System.out.println("SQL " + sql);
			ptmt = connection.prepareStatement(sql);
			ptmt.executeUpdate();

			/*
			 * Connection closed
			 */

			ptmt.close();
			connection.close();


			return flag;
		}catch(Exception ex){
			flag = "failed";
			ex.printStackTrace();
			return flag;
		}
	}

	//Delete from the table (unfriend)
	public String deleteFrom(int friendId){
		String flag = "done";
		try{
			String sql = "delete from studentzone_friendship where " +
					"studentID = " + uid + " and friendID = " + friendId + ";";
			System.out.println("SQL " + sql);
			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			ptmt.executeUpdate();

			/*
			 * Connection closed
			 */

			ptmt.close();
			sql = "delete from studentzone_friendship where " +
					"studentID = " + friendId + " and friendID = " + uid + ";";
			System.out.println("SQL " + sql);
			ptmt = connection.prepareStatement(sql);
			ptmt.executeUpdate();

			/*
			 * Connection closed
			 */

			ptmt.close();
			connection.close();


			return flag;
		}
		catch(Exception ex){
			flag = "failed";
			ex.printStackTrace();
			return flag;
		}
	}

	//Add into the table(add as a friend)
	public String insertIntoEnemy(int friendId) throws SQLException
	{
		String flag = "done";
		try{
			String sql = "insert into studentzone_enemy(studentID , enemyID) values ("+uid + " , " + friendId + ");";

			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			ptmt.executeUpdate();

			/*
			 * Connection closed
			 */

			ptmt.close();
			connection.close();


			return flag;
		}catch(Exception ex){
			flag = "failed";
			ex.printStackTrace();
			return flag;
		}
	}

	//Delete from the table (unblock)
	public String unBlockUser(int friendId){
		String flag = "done";
		try{
			String sql = "delete from studentzone_enemy where " +
					"studentID = " + uid + " and enemyID = " + friendId + ";";

			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			ptmt.executeUpdate();

			/*
			 * Connection closed
			 */

			ptmt.close();
			connection.close();


			return flag;
		}
		catch(Exception ex){
			flag = "failed";
			ex.printStackTrace();
			return flag;
		}
	}
}
