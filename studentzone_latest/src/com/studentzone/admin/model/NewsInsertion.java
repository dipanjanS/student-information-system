package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;

public class NewsInsertion {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    

  //Add into the table(add as a friend)
    public String insertInto(String title , String content , String validity) throws SQLException
    {
    	String flag = "done";
    	try{
    	String sql = "insert into studentzone_news(NEWSID , content , heading , " +
    			"validity , NEWSCreatedOn , NEWSCreatedBy , " +
    			"NEWSModifiedOn , NEWSModifiedBy ) values (null , '" +
    			content + "' , '" + title + "' , '" + validity +
    			"' , null , 1 , null , null)";
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
         connection.close();
         
         
    	return flag;
    	}catch(Exception ex){
    		flag = "failed";
    		ex.printStackTrace();
    		return flag;
    	}
    }
}
