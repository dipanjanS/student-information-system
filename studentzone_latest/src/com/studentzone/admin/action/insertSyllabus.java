package com.studentzone.admin.action;

import java.sql.SQLException;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.GetSyllabusModel;
import com.studentzone.admin.model.insertSyllabusModel;
import com.studentzone.model.Subject;
import com.studentzone.model.SubjectModel;
import com.studentzone.admin.model.Syllabus;

public class insertSyllabus extends ActionSupport {
	private String commandButton;
	private int subjectList;
	private String syllabus;
	private int syllabusId;
	private Syllabus sl;
	ArrayList<Subject> showSubject = new ArrayList<Subject>();
	
	
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

	public String getCommandButton() {
		return commandButton;
	}

	public void setCommandButton(String commandButton) {
		this.commandButton = commandButton;
	}

	public int getSyllabusId() {
		return syllabusId;
	}

	public void setSyllabusId(int syllabusId) {
		this.syllabusId = syllabusId;
	}

	public String getSyllabus() {
		return syllabus;
	}

	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}

	public int getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(int subjectList) {
		this.subjectList = subjectList;
	}

	public String execute() throws SQLException{
		System.out.println("Subject id = " + getSubjectList());
		System.out.println("Syllabus = " + getSyllabus());
		System.out.println("Syllabus id = " + getSyllabusId());
		System.out.println("Button clicked is = " +  getCommandButton());
		showSubject = SubjectModel.getSubjectListPerSemester("");
		insertSyllabusModel ism = new insertSyllabusModel();
		
		String feedback = null;
		if("Insert Syllabus".equals(commandButton))
		{
			/*
			 * If no syllabus id then 
			 * insert the record
			 */
			System.out.println("Insert the record");
			feedback = ism.insertSyllabus(getSubjectList(), getSyllabus());
		}
		else if("Edit Syllabus".equals(commandButton))
		{
			/*
			 * If syllabus id is present then
			 * update the existing record
			 */
			System.out.println("Update the record");
			feedback = ism.updateSyllabus(getSyllabus(), getSyllabusId());
		}
		
		GetSyllabusModel gsm = new GetSyllabusModel();
		String where = "where subjectID = " + getSubjectList();
		sl = gsm.getData(where);
		
		if(feedback == "done")
			return "SUCCESS";
		else
			return "ERROR";
	}
}
