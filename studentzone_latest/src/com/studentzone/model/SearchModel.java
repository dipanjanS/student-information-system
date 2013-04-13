package com.studentzone.model;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SearchModel {
	private Connection connection = null;
    private PreparedStatement ptmt = null;
    private ResultSet resultSet = null;
    
    public Integer searchByRollNo(String rollno) {
		Integer studentID = -1;
		try {
			String qstring = "SELECT studentID FROM studentzone_student_profile WHERE studentRollNo = '" + rollno + "'";
			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
            ptmt = connection.prepareStatement(qstring);
            //System.out.println(qstring);
            resultSet = ptmt.executeQuery();
            
            if(resultSet.next()) {
            	studentID = resultSet.getInt("studentID");
            }
            ptmt.close();
            connection.close();
            resultSet.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return studentID;
	}
}