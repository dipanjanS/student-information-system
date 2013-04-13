package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.jasper.tagplugins.jstl.core.If;

import com.studentzone.util.DB;
import com.studentzone.util.MySqlConnection;

public class SubjectModel {

	/***************************************************************************
	 * This method is used to get the list of subjects per semester
	 * @param whereCondition
	 * @return subjectList - subject-list semester-wise
	 * @throws SQLException
	 ***************************************************************************/
	public static ArrayList<Subject> getSubjectListPerSemester(String whereCondition) throws SQLException {
		ArrayList<Subject> subjectList = new ArrayList<Subject>();

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select * from studentzone_subject " + whereCondition;

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			while (resultSet.next()) {
				Subject subject = new Subject();
				subject.setSubjectId(Integer.parseInt(resultSet.getString("subjectID")));
				subject.setSubjectName(resultSet.getString("subjectName"));
				subject.setSubjectCode(resultSet.getString("subjectCode"));
				subject.setSemester(resultSet.getString("subjectSemester"));
				subjectList.add(subject);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return subjectList;
	}
	
	/*******************************************************************************
	 * This method is used to get the subject-code of a specific subject
	 * @param whereCondition
	 * @return subjCode - subject-code
	 * @throws SQLException
	 *******************************************************************************/
	public static String getSubjectCode(String whereCondition) throws SQLException {
		String subjCode = "";

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select subjectCode from studentzone_subject " + whereCondition;

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			if (resultSet.next()) {
				subjCode = resultSet.getString("subjectCode");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return subjCode;
	}
	
	/**************************************************************************
	 * This method is used to find the faculty of a particular subject
	 * @param whereCondition  where condition for the select query
	 * @return String - the faculty of the subject
	 * @throws SQLException
	 *************************************************************************/
	public static ArrayList<String> findFaculty(String whereCondition) throws SQLException {
		ArrayList<String> facultyList = new ArrayList<String>();

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select facultyName from studentzone_faculty " + whereCondition;

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			while (resultSet.next()) {
				String faculty = "";
				faculty = resultSet.getString("facultyName");
				facultyList.add(faculty);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return facultyList;
	}
	
	/**************************************************************************
	 * This method is used to check if a particular student has enrolled for
	 * a particular subject
	 * @param whereCondition  where condition for the select query
	 * @return char - Y/N
	 * @throws SQLException
	 *************************************************************************/
	public static char checkEnrollment(String whereCondition) throws SQLException {
		char checkEnroll = 0;

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select enrollmentID from studentzone_student_enrollment " + whereCondition;

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			if (resultSet.next()) {
				checkEnroll = 'Y';
			}
			else {
				checkEnroll = 'N';
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return checkEnroll;
	}
	
	public  static ArrayList<Integer> getMappedSubjList(String whereCondition) throws SQLException {
		ArrayList<Integer> mappedSubjList = new ArrayList<Integer>();

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select * from studentzone_subject " + whereCondition;
		
		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			while (resultSet.next()) {
				int subjectid = 0;
				subjectid = Integer.parseInt(resultSet.getString("subjectID"));
				//subject.setSubjectId(Integer.parseInt(resultSet.getString("subjectID")));
				//subject.setSubjectName(resultSet.getString("subjectName"));
				mappedSubjList.add(subjectid);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return mappedSubjList;
	}
}
