package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class insertSyllabusModel {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    
    //insert the record
    public String insertSyllabus(int subjectId , String syllabusContent){
    	String flag = "done";
    	try{
        	String sql = "insert into studentzone_syllabus values(null , '" +
        			syllabusContent + "' , " + subjectId + ")";
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
    
    public String updateSyllabus(String syllabusContent , int syllabusId){
    	String flag = "done";
    	try{
        	String sql = "update studentzone_syllabus set subjectSyllabus = '" +
        			syllabusContent + "' where syllabusID = " + syllabusId;
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