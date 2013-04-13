package com.studentzone.model;
import com.studentzone.util.RuntimeSettings;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class NEWSModel {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    private ResultSet resultSet = null;
    
    /*
     * function to fectch the announcement heading which are not expired to put into session
     */
    public ArrayList<NEWS> getValidNEWSHeading() {
		ArrayList<NEWS> news = new ArrayList<NEWS>();
		//get the current date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		//print date on console
		System.out.println("date is " + dateFormat.format(date));
		try {
			String qstring = "SELECT * FROM studentzone_news WHERE " +
					"validity >= '" + dateFormat.format(date) + "'";
			
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
            ptmt = connection.prepareStatement(qstring);
            //print querystring on console
            System.out.println(qstring);
            resultSet = ptmt.executeQuery();
            
            while(resultSet.next()) {
            	NEWS nw = new NEWS();
            	nw.setNEWSID(resultSet.getInt("NEWSID"));
            	nw.setHeading(resultSet.getString("heading"));
         	    news.add(nw);
            }
            ptmt.close();
            connection.close();
            resultSet.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return news;
	}

	public ArrayList<NEWS> getFullNEWS(Integer nEWSID) {
		
		ArrayList<NEWS> news = new ArrayList<NEWS>();
		//get the current date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		//print date on console
		System.out.println("date is " + dateFormat.format(date));
		try {
			String qstring = "SELECT * FROM studentzone_news WHERE NEWSID = '"+ nEWSID +
					"' AND validity >= '" + dateFormat.format(date) + "'";
			
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
            ptmt = connection.prepareStatement(qstring);
            //print querystring on console
            System.out.println(qstring);
            resultSet = ptmt.executeQuery();
            
            while(resultSet.next()) {
            	NEWS nw = new NEWS();
            	nw.setNEWSID(resultSet.getInt("NEWSID"));
            	nw.setHeading(resultSet.getString("heading"));
            	nw.setContent(resultSet.getString("content"));
            	nw.setNEWSCreationOn(resultSet.getTimestamp("NEWSCreatedOn"));
         	    news.add(nw);
            }
            ptmt.close();
            connection.close();
            resultSet.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return news;
	}
}
