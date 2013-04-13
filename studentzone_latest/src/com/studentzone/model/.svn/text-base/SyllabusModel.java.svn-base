package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import com.studentzone.util.MySqlConnection;

public class SyllabusModel {

	/*
	 * to work with DB
	 */
	static PreparedStatement statement=null;
	static ResultSet rs=null;
	static String sqlQuery="";

	public static ArrayList<Syllabus> getSyllabusDetails(String subjectCode) throws SQLException{
		ArrayList<Syllabus> syllabusList= new ArrayList<Syllabus>();
		Connection con=MySqlConnection.getInstance().getConnection();
		try{

			sqlQuery = "USE studentzone;";
			statement=con.prepareStatement(sqlQuery);
			statement.execute();

			/*
			 * getting subjectName and syllabus for subject id in session
			 */
			sqlQuery = "SELECT subjectName, subjectSyllabus FROM studentzone_subject SU, studentzone_syllabus SY " +
					"WHERE SU.subjectID=SY.subjectID AND SU.subjectID= (select subjectID from studentzone_subject where" +
					" subjectCode = '"+subjectCode+"');";
			
			statement=con.prepareStatement(sqlQuery);
			rs=statement.executeQuery();

			while(rs.next()){
				Syllabus syllabusObj = new Syllabus();
				syllabusObj.setSubjectName(rs.getString(1));
				syllabusObj.setSubjectSyllabus(rs.getString(2));	
				syllabusList.add(syllabusObj);
			}
		}
		
		catch (Exception e) {
			syllabusList.clear();
			e.printStackTrace();
		}
		
		finally{
			rs.close();
			statement.close();
			con.close();
		}
		
		return syllabusList;
	}	
}