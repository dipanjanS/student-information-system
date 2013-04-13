package com.studentzone.admin.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.ManageGrades;
import com.studentzone.admin.model.ManageGradesModel;

public class GradesAction extends ActionSupport {

	private String rollNo;
	private String subjectCode;
	private String grade;
	private String result;
	private String gradeDate;
	
	public String getGradeDate() {
		return gradeDate;
	}

	public void setGradeDate(String gradeDate) {
		this.gradeDate = gradeDate;
	}

	public String getRollNo() {
		return rollNo;
	}

	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String loadPage(){
		return "success";
	}
	
	public String updateGrades() {

		//adding into grade table
		if(!rollNo.equals("") && !subjectCode.equals("") && !grade.equals("") && !result.equals("")) {
			
			ManageGrades mg = new ManageGrades();
			mg.setStudentRollNo(rollNo);
			mg.setSubjectCode(subjectCode);
			mg.setSubjectGrade(grade);
			mg.setSubjectResult(result);
			mg.setGradeDate(gradeDate);
			try {
				ManageGradesModel.insertGradeDetails(mg);
				addActionError("Grade added..!!!");
			} catch (SQLException e) {
				e.printStackTrace();
				addActionError("Error..Try Again!!!");
			}
		} else {
			addActionError("Kindly enter all entries!!!");
		}
		

		return "success";
	}

}
