package com.studentzone.admin.action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.*;

public class SubjectAction extends ActionSupport{

	String subjectName, subjectCode, Semester;
	/*
	 * to work with DB
	 */
	PreparedStatement statement=null;

	ResultSet rs=null;

	ArrayList<String> semesterList = new ArrayList<String>();

	String sqlQuery="";

	public String execute() throws SQLException{

		/*
		 * Adding static data in semesterList array list
		 */
		semesterList.add("Semester 1");
		semesterList.add("Semester 2");
		semesterList.add("Semester 3");
		semesterList.add("Semester 4");

		/*
		 * if we are on this page after selecting
		 * from the semester drop down list 
		 */
		System.out.println("In Subject Action, getSem: "+getSemester());
		if (getSemester() != null && !getSemester().equals("")){

			/*
			 * preparing new student object
			 */
			Subject subObj = new Subject();
			subObj.setSubjectName(getSubjectName());
			subObj.setSubjectCode(getSubjectCode());
			subObj.setSubjectSemester(getSemester());

			/*
			 * passing new object to insert method of model class
			 */
			SubjectModel.insertSubjectDetails(subObj);
		}		
		return SUCCESS;

	}

	/*
	 * Getters and Setters
	 */
	public String getSemester() {
		return Semester;
	}

	public void setSemester(String semester) {
		Semester = semester;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public ArrayList<String> getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(ArrayList<String> semesterList) {
		this.semesterList = semesterList;
	}
}
