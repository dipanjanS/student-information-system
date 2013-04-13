package com.studentzone.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class LoginModel {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    private ResultSet resultSet = null;
    
    public String checkUsername(String uname) {
		String username = "";
		try {
			String qstring = "SELECT userName FROM studentzone_student WHERE userName = '" + uname + "'";
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
            ptmt = connection.prepareStatement(qstring);
            //System.out.println(qstring);
            resultSet = ptmt.executeQuery();
            
            if(resultSet.next()) {
            	username = resultSet.getString("userName");
            }
            ptmt.close();
            connection.close();
            resultSet.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return username;
	}
    
    public String getPassword(String uname) {
		String password = "";
		try {
			String qstring = "SELECT password FROM studentzone_student WHERE userName = '" + uname + "'";
    		connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
            ptmt = connection.prepareStatement(qstring);
            //System.out.println(qstring);
            resultSet = ptmt.executeQuery();
            
            if(resultSet.next()) {
            	password = resultSet.getString("password");
            }
            ptmt.close();
            connection.close();
            resultSet.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return password;
	}  
  //returns uid if given username found or returns -1
  	public int getUID(String username) {
  		int uid = -1; 
  		try {
  			//query string
  			String qstring = "SELECT studentID FROM studentzone_student WHERE userName = '" + username + "'";
  			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
              ptmt = connection.prepareStatement(qstring);
              
              resultSet = ptmt.executeQuery();
              if(resultSet.next()) {
              	uid = resultSet.getInt("studentID");
              }
              
              resultSet.close();
              ptmt.close();
              connection.close();
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return uid;
  	}
public String getProfilePic(Integer uid) {
		
		String imgurl=""; 
		try {
			String qstring = "SELECT studentImgUrl FROM studentzone_student_profile WHERE studentID = '" + uid + "'";
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
            ptmt = connection.prepareStatement(qstring);
            //System.out.println(qstring);
            resultSet = ptmt.executeQuery();
            
            if(resultSet.next()) {
            	imgurl = resultSet.getString("studentImgUrl");
            	
            }
            ptmt.close();
            connection.close();
            resultSet.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgurl;
	}

public Timestamp getLastAccessTime(int uid) {
	Timestamp ts = null;
	try {
		String qstring = "SELECT lastAccess FROM studentzone_student WHERE studentID = '" + uid + "'";
		connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
        ptmt = connection.prepareStatement(qstring);
        //System.out.println(qstring);
        resultSet = ptmt.executeQuery();
        
        if(resultSet.next()) {
        	ts = resultSet.getTimestamp("lastAccess");
        }
        ptmt.close();
        connection.close();
        resultSet.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	return ts;
}

public void setLastAccessTime(int uid) {
	java.util.Date date= new java.util.Date();
	Timestamp ts = new Timestamp(date.getTime());
	try {
		String qstring = "UPDATE studentzone_student SET lastAccess = '" + ts + "' WHERE studentID = '" + uid + "'";
		connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
        ptmt = connection.prepareStatement(qstring);
        //System.out.println(qstring);
        ptmt.executeUpdate();
        
        ptmt.close();
        connection.close();
        resultSet.close();
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}
}
