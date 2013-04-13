package com.studentzone.action;

import java.util.Map;

import com.studentzone.model.*;
import com.studentzone.util.*;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SyllabusAction extends ActionSupport{

	ArrayList<Syllabus> syllabusList = new ArrayList<Syllabus>(); 

	String imageURL;
	Timestamp lastAccess;
	int studentId;
	private String subjectCode;

	/*
	 * session variable to capture studentId (initialized in LoginPage)
	 * and subjectId (initialized in subjectsPage) 
	 */
	Map session = ActionContext.getContext().getSession();

	/*
	 * Getters and Setters
	 */
	
	public ArrayList<Syllabus> getSyllabusList() {
		return syllabusList;
	}

	public void setSyllabusList(ArrayList<Syllabus> syllabusList) {
		this.syllabusList = syllabusList;
	}

	public Timestamp getLastAccess() {
		return lastAccess;
	}

	public void setLastAccess(Timestamp lastAccess) {
		this.lastAccess = lastAccess;
	}

	public int getStudentId() {
		return studentId;
	}

	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}
	
	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String execute() throws SQLException{

		/*
		 * getting required data from session
		 */
		setStudentId(Integer.parseInt(session.get("studentID").toString()));
		setImageURL((String)session.get("studentImgUrl"));
		//setLastAccess((Timestamp)session.get("lastAccess"));
	
		/*
		 * Call to model class method
		 */
		
		setSyllabusList(SyllabusModel.getSyllabusDetails(subjectCode));
			
		return SUCCESS;
	}
}
