package com.studentzone.admin.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.struts2.views.xslt.ArrayAdapter;

import com.studentzone.util.DB;
import com.studentzone.util.MySqlConnection;

public class FacultyModel {


	/*******************************************************************
	 * This method add faculty to the database
	 * @param faculty - includes faculty name and faculty code
	 * @throws SQLException
	 *******************************************************************/
	public static void addFaculty(Faculty faculty) throws SQLException {

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		String query = "insert into studentzone_faculty(facultyCode, facultyName)" +
		" values('"+faculty.getFacultyCode()+"', '"+faculty.getFacultyName()+"');" ;

		stmt = connection.prepareStatement(query);
		stmt.execute();
	}


	/******************************************************************
	 * This method finds the list of all faculties present in the
	 * database.
	 * @throws SQLException
	 ******************************************************************/
	public static ArrayList<Faculty> findFacultyList () throws SQLException {
		ArrayList<Faculty> facultyList = new ArrayList<Faculty>();

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select facultyID, facultyName from studentzone_faculty ;";

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			while (resultSet.next()) {
				Faculty faculty = new Faculty();
				faculty.setFacultyID(Integer.parseInt(resultSet.getString("facultyID")));
				faculty.setFacultyName(resultSet.getString("facultyName"));
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

	/*********************************************************************
	 * This method is used to map faculties to various subjects present.
	 * @param faculty
	 * @throws SQLException
	 *********************************************************************/
	public static void addFacultySubj(Faculty faculty) throws SQLException {

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		String query = "insert into studentzone_subject_faculty(subjectID, facultyID)" +
		" values('"+faculty.getSubjectID()+"', '"+faculty.getFacultyID()+"');" ;

		stmt = connection.prepareStatement(query);
		stmt.execute();
	}
	
	/************************************************************************
	 * This method is used to delete entries for a particular faculty
	 * @param faculty
	 * @throws SQLException
	 ************************************************************************/
	public static void deleteFacultySubj(int facultyid) throws SQLException {

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		String query = "delete from studentzone_subject_faculty where facultyID ="+facultyid ;

		stmt = connection.prepareStatement(query);
		stmt.execute();
	}
	
	/*********************************************************************
	 * This method is used to delete a faculty and all his entries from
	 * the database
	 * @param facultyID
	 * @throws SQLException
	 *********************************************************************/
	public static void deleteFaculty(int facultyID) throws SQLException {

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		String query = "delete from studentzone_faculty where facultyID = "+facultyID+";" ;

		stmt = connection.prepareStatement(query);
		stmt.execute();
	}
}
