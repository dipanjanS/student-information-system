package com.studentzone.admin.action;

import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.GetSyllabusModel;
import com.studentzone.model.Subject;
import com.studentzone.model.SubjectModel;
import com.studentzone.admin.model.Syllabus;

/*
 *To fetch the subject list
 * to enter the syllabus 
 */
public class GetSubForSyl extends ActionSupport {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ArrayList<Subject> showSubject = new ArrayList<Subject>();
	private Syllabus sl;
	
	public Syllabus getSl() {
		return sl;
	}


	public void setSl(Syllabus sl) {
		this.sl = sl;
	}


	public ArrayList<Subject> getShowSubject() {
		return showSubject;
	}


	public void setShowSubject(ArrayList<Subject> showSubject) {
		this.showSubject = showSubject;
	}
	/*
	 * SubjectModel is used in addSyllabus
	 * and subjectDisplay
	 */
	public String execute() throws SQLException{
		GetSyllabusModel gsm = new GetSyllabusModel();
		String where = "where subjectID = 1";
		sl = gsm.getData(where);
		
		showSubject = SubjectModel.getSubjectListPerSemester("");
		System.out.println(showSubject.size());
		
		return "SUCCESS";
	}

}
