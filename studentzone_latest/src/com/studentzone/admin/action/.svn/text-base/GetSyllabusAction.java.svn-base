package com.studentzone.admin.action;

import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.GetSyllabusModel;
import com.studentzone.model.Subject;
import com.studentzone.model.SubjectModel;
import com.studentzone.admin.model.Syllabus;

public class GetSyllabusAction extends ActionSupport{
	private int subjectList;
	private Syllabus sl;
	ArrayList<Subject> showSubject = new ArrayList<Subject>();
	
	
	public ArrayList<Subject> getShowSubject() {
		return showSubject;
	}

	public void setShowSubject(ArrayList<Subject> showSubject) {
		this.showSubject = showSubject;
	}

	public Syllabus getSl() {
		return sl;
	}

	public void setSl(Syllabus sl) {
		this.sl = sl;
	}

	public int getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(int subjectList) {
		this.subjectList = subjectList;
	}
	
	/*
	 * Get Syllabus for the subject
	 * choosen by the user
	 */
	public String execute() throws SQLException{
		System.out.println("Get Syllabus");
		System.out.println("Subject Id is = " + getSubjectList());
		showSubject = SubjectModel.getSubjectListPerSemester("");
		GetSyllabusModel gsm = new GetSyllabusModel();
		String where = "where subjectID = " + getSubjectList();
		sl = gsm.getData(where);
		
		System.out.println("Syllabus is " + sl.getSubjectSyllabus());
		return "SUCCESS";
	}

}
