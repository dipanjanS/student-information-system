package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/*
 * To get the syllabus for 
 * the subject
 */
public class GetSyllabusModel {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    private ResultSet resultSet = null;
    
    public Syllabus getData(String where){
    	try{
    	Syllabus syl = new Syllabus();
    	
    	String sql = "SELECT * FROM studentzone_syllabus " + where;
    	System.out.println("SQL " + sql);
		/*
		 * create connection
		 * and call SQL
		 */
		connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
		 ptmt = connection.prepareStatement(sql);
         resultSet = ptmt.executeQuery();
       
         while(resultSet.next()) {
        	 syl.setSyllabusID(resultSet.getInt("syllabusID"));
        	 syl.setSubjectSyllabus(resultSet.getString("subjectSyllabus"));
         }
         
         /*
          * Connection closed
          */
         resultSet.close();
         ptmt.close();
         connection.close();
         return syl;
	}
	catch(Exception ex){
		ex.printStackTrace();
		return null;
	}
	}
}
