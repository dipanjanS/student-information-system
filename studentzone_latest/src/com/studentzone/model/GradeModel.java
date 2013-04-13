package com.studentzone.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.studentzone.util.DB;
import com.studentzone.util.MySqlConnection;

public class GradeModel {

	/*************************************************************************
	 * This method is used to find grade of a particular student in a
	 * particular subject.
	 * @param whereCondition
	 * @return grade
	 * @throws SQLException
	 *************************************************************************/
	public static Grade findGrade(String whereCondition) throws SQLException {
		Grade grade = new Grade();

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select subjectGrade, subjectResult from studentzone_grade" + whereCondition;

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			if (resultSet.next()) {
				grade.setSubjectGrade(resultSet.getString("subjectGrade"));
				grade.setSubjectResult(resultSet.getString("subjectResult"));
			}
			else {
				grade.setSubjectGrade("NA");
				grade.setSubjectResult("NA");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		return grade;
	}

	public static String findSGPA(String whereCondition) throws SQLException {
		String sgpa = "";

		ArrayList<String> sgpaList = new ArrayList<String>();
		sgpaList.clear();

		Connection connection = MySqlConnection.getInstance().getConnection();
		PreparedStatement stmt = DB.useDataBase(connection);

		ResultSet resultSet = null;
		String query = "select subjectGrade from studentzone_grade" + whereCondition;

		stmt = connection.prepareStatement(query);
		resultSet = stmt.executeQuery();

		try {
			while (resultSet.next()) {

				if(resultSet.getString("subjectGrade").equalsIgnoreCase("A")) {
					sgpaList.add("4.0");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("A-")) {
					sgpaList.add("3.7");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("B+")) {
					sgpaList.add("3.4");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("B")) {
					sgpaList.add("3.0");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("B-")) {
					sgpaList.add("2.7");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("C+")) {
					sgpaList.add("2.4");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("C")) {
					sgpaList.add("2.0");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("C-")) {
					sgpaList.add("1.5");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("D")) {
					sgpaList.add("1.0");
				}
				else if(resultSet.getString("subjectGrade").equalsIgnoreCase("F")) {
					sgpaList.add("0.0");
				}
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			stmt.close();
			resultSet.close();
			connection.close();
		}

		Double sgpaVal = 0.0;
		
		if(sgpaList != null && sgpaList.size() > 0) {
			for (int i = 0; i < sgpaList.size(); i++) {
				sgpaVal += Double.parseDouble(sgpaList.get(i));
			}
			sgpaVal = sgpaVal/sgpaList.size();
			sgpa = sgpaVal.toString();
		} else {
			sgpa = "NA";
		}

		return sgpa;
	}
}
