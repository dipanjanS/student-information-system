package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.studentzone.util.DB;
import com.studentzone.util.MySqlConnection;

public class MyFriendModel {
	private Connection connection = null;
	private PreparedStatement ptmt = null;
	private ResultSet resultSet = null;

	/*
	 * Get session id 
	 * to fetch the data for the friend of the logged-in user
	 * Need two inputs = (1) session userid (2) clicked id
	 */

	Map session = (Map) ActionContext.getContext().get("session");
	Integer uid = (Integer) session.get("studentID");



/*	public boolean checkFriend(int id) throws SQLException{

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select * from studentzone_friendship where studentID ="+uid+" and friendID ="+id+";";

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			if (resultSet.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return false;
	}

	public boolean checkEnemy(int id) throws SQLException{

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select * from studentzone_enemy where studentID ="+uid+" and enemyID ="+id+";";

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			if (resultSet.next()) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return false;
	}*/

	public MyFriend fetchData(int id){
		try{
			System.out.println("UID " + uid);
			System.out.println("Testing");
			String sql = "select sp.studentRollNo , sp.studentName ,  sp.studentDOB , " + 
					" sp.studentImgUrl ,  (select group_concat(interestName) from " + 
					"studentzone_student_interest where studentID = " + id +
					") as interest , sp.studentID ,case when (select 'Y' from studentzone_friendship " +
					"where studentId = " + uid + " and friendId = " + id + ") is not NULL " +
					"then 'true' else 'false' end as isFriend " +
					" from studentzone_student_profile sp where sp.studentID = " + id;

			System.out.println(sql);	

			System.out.println("SQL " + sql);
			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			resultSet = ptmt.executeQuery();
			MyFriend mf = new MyFriend();
			while(resultSet.next()) {

				mf.setFriendName(resultSet.getString("studentName"));
				mf.setIsFriend(resultSet.getString("isFriend"));
				mf.setFriendDOB(resultSet.getString("studentDOB"));
				mf.setFriendImg(resultSet.getString("studentImgUrl"));
				mf.setFriendId(resultSet.getInt("studentID"));
				mf.setFriendRollNo(resultSet.getString("studentRollNo"));
				mf.setInterest(resultSet.getString("interest"));
				System.out.println("Interest is " + mf.getInterest());
			}

			/*
			 * Connection closed
			 */
			resultSet.close();
			ptmt.close();
			connection.close();
			return mf;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}

	}

	public MyFriend fetchEnemyData(int id){
		try{
			System.out.println("UID " + uid);
			System.out.println("Testing");
			String sql = "select sp.studentRollNo , sp.studentName ,  sp.studentDOB , " + 
					" sp.studentImgUrl ,  (select group_concat(interestName) from " + 
					"studentzone_student_interest where studentID = " + id +
					") as interest , sp.studentID ,case when (select 'Y' from studentzone_enemy " +
					"where studentId = " + uid + " and enemyID = " + id + ") is not NULL " +
					"then 'true' else 'false' end as isEnemy " +
					" from studentzone_student_profile sp where sp.studentID = " + id;

			System.out.println(sql);	

			System.out.println("SQL " + sql);
			/*
			 * create connection
			 * and call SQL
			 */
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(sql);
			resultSet = ptmt.executeQuery();
			MyFriend me = new MyFriend();
			while(resultSet.next()) {
				me.setIsFriend(resultSet.getString("isEnemy"));
			}

			/*
			 * Connection closed
			 */
			resultSet.close();
			ptmt.close();
			connection.close();
			return me;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return null;
		}
	}
}
