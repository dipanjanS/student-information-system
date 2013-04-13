package com.studentzone.admin.model;

import java.sql.*;

public class Enrollment {

	String enrollmentSemester, enrollmentDeadline;
	int subjectID;
	
	/*
	 * getters and setters
	 */
	public String getEnrollmentSemester() {
		return enrollmentSemester;
	}
	public void setEnrollmentSemester(String enrollmentSemester) {
		this.enrollmentSemester = enrollmentSemester;
	}
	public String getEnrollmentDeadline() {
		return enrollmentDeadline;
	}
	public void setEnrollmentDeadline(String enrollmentDeadline) {
		this.enrollmentDeadline = enrollmentDeadline;
	}
	public int getSubjectID() {
		return subjectID;
	}
	public void setSubjectID(int subjectID) {
		this.subjectID = subjectID;
	}

}
