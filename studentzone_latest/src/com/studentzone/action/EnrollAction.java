package com.studentzone.action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.ShowSubjectToEnroll;
import com.studentzone.model.ShowSubjectToEnrollModel;

public class EnrollAction extends ActionSupport{

	String[] checkCourse;
	String imageURL, semester="";
	Timestamp lastAccess;

	int studentId;
	ArrayList<String> semesterList = new ArrayList<String>(); 
	ArrayList<ShowSubjectToEnroll> coursesToEnrollList = new ArrayList<ShowSubjectToEnroll>();
	ArrayList<ShowSubjectToEnroll> coursesEnrolledList = new ArrayList<ShowSubjectToEnroll>();

	/*
	 * session variable to capture studentId (initialized in LoginPage)
	 * and subjectId (initialized in subjectsPage) 
	 */
	Map session=ActionContext.getContext().getSession();

	/*
	 * to work with DB
	 */
	PreparedStatement statement=null;
	ResultSet rs=null;

	String sqlQuery="";

	public String execute() throws SQLException{
		/*
		 * getting required data from session
		 */
		setStudentId((int)session.get("studentID"));
		setImageURL((String)session.get("studentImgUrl"));
		//setLastAccess((Timestamp)session.get("lastAccess"));

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
		if (!getSemester().equals("")){

			/* getting subjects not yet enrolled into */
			setCoursesToEnrollList(ShowSubjectToEnrollModel.getSubjectsToEnrollDetails(getSemester(),getStudentId()));

			/* getting subjects already enrolled into */
			setCoursesEnrolledList(ShowSubjectToEnrollModel.getSubjectsEnrolledDetails(getSemester(),getStudentId()));
		}

		return SUCCESS;
	}

	/*
	 * Enrolling a student in the selected courses
	 */
	public String enrollStudent(){
		/*
		 * getting required data from session
		 */
		setStudentId((int)session.get("studentID"));
		setImageURL((String)session.get("studentImgUrl"));
		//setLastAccess((Timestamp)session.get("lastAccess"));

		/*
		 * For all the selected courses, enrolling the 
		 * student one by one (if any selection was made)
		 */
		if(checkCourse != null){
			System.out.println("SONY: COURSE LENGTH IS"+ checkCourse.length);
			for(int i=0;i<checkCourse.length;i++){
				System.out.println(checkCourse[i]+" ");
				try{
					ShowSubjectToEnrollModel.enrollStudent(getStudentId(), Integer.parseInt(checkCourse[i]));
				}
				catch(Exception e){
					addActionError("Some error occurred during enrollment. Please try again.");
					return ERROR;
				}
			}
		}
		/*if no selections were made and ENROLL was clicked*/
		else{
			addActionError("Please make proper selections before enrolling.");
			return ERROR;
		}
		return SUCCESS;
	}


	/*
	 * Getters and Setters
	 */

	public String getImageURL() {
		return imageURL;
	}

	public ArrayList<String> getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(ArrayList<String> semesterList) {
		this.semesterList = semesterList;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
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

	public String getSemester() {
		return semester;
	}

	public void setSemester(String semester) {
		this.semester = semester;
	}

	public ArrayList<ShowSubjectToEnroll> getCoursesToEnrollList() {
		return coursesToEnrollList;
	}

	public void setCoursesToEnrollList(ArrayList<ShowSubjectToEnroll> coursesList) {
		this.coursesToEnrollList = coursesList;
	}

	public String[] getCheckCourse() {
		return checkCourse;
	}

	public void setCheckCourse(String[] checkCourse) {
		this.checkCourse = checkCourse;
	}

	public ArrayList<ShowSubjectToEnroll> getCoursesEnrolledList() {
		return coursesEnrolledList;
	}

	public void setCoursesEnrolledList(
			ArrayList<ShowSubjectToEnroll> coursesEnrolledList) {
		this.coursesEnrolledList = coursesEnrolledList;
	}

}
