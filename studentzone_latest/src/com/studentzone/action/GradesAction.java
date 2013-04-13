
package com.studentzone.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.Grade;
import com.studentzone.model.GradeModel;
import com.studentzone.model.Subject;
import com.studentzone.model.SubjectModel;

public class GradesAction extends ActionSupport {

	Map session = ActionContext.getContext().getSession();
	private String semName;
	private String subjName;
	private int studID;	
	private String studImage;
	private String studLastLogin;
	private int check = 1;
	Grade grade;
	ArrayList<String> semesterList;
	ArrayList<Subject> subjectList;
	Map<String, ArrayList<Subject>> subjPerSem;
	ArrayList<String> sgpaList;
	double cgpa = 0.0;

	public String getSemName() {
		return semName;
	}

	public void setSemName(String semName) {
		this.semName = semName;
	}

	public String getSubjName() {
		return subjName;
	}

	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}

	public int getStudID() {
		return studID;
	}

	public void setStudID(int studID) {
		this.studID = studID;
	}

	public String getStudImage() {
		return studImage;
	}

	public void setStudImage(String studImage) {
		this.studImage = studImage;
	}

	public String getStudLastLogin() {
		return studLastLogin;
	}

	public void setStudLastLogin(String studLastLogin) {
		this.studLastLogin = studLastLogin;
	}

	public int getCheck() {
		return check;
	}

	public void setCheck(int check) {
		this.check = check;
	}

	public Grade getGrade() {
		return grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	public ArrayList<String> getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(ArrayList<String> semesterList) {
		this.semesterList = semesterList;
	}

	public ArrayList<Subject> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(ArrayList<Subject> subjectList) {
		this.subjectList = subjectList;
	}

	public Map<String, ArrayList<Subject>> getSubjPerSem() {
		return subjPerSem;
	}

	public void setSubjPerSem(Map<String, ArrayList<Subject>> subjPerSem) {
		this.subjPerSem = subjPerSem;
	}
	
	public ArrayList<String> getSgpaList() {
		return sgpaList;
	}

	public void setSgpaList(ArrayList<String> sgpaList) {
		this.sgpaList = sgpaList;
	}
	
	public double getCgpa() {
		return cgpa;
	}

	public void setCgpa(double cgpa) {
		this.cgpa = cgpa;
	}

	public String execute() {

		if(session.get("studentID") != null) {
			studID = Integer.parseInt(session.get("studentID").toString());
			studLastLogin = session.get("lastAccess").toString();
			studImage = session.get("studentImgUrl").toString();
		}

		semesterList = new ArrayList<String>();
		subjectList = new ArrayList<Subject>();
		subjPerSem =new HashMap<String, ArrayList<Subject>>();

		semesterList.add("Semester 1");
		semesterList.add("Semester 2");
		semesterList.add("Semester 3");
		semesterList.add("Semester 4");
		semesterList.add("Semester");

		String semester = "";
		for (int i = 0; i < semesterList.size(); i++) {
			semester = semesterList.get(i);

			try {
				if(semester.equalsIgnoreCase("Semester")) {
					subjectList = new ArrayList<Subject>();
					Subject subject = new Subject();
					subject.setSubjectName("Subject");
					subjectList.add(subject);
				} else {
					String whereClause = "where subjectSemester = '"+semester+"'"; 
					subjectList = SubjectModel.getSubjectListPerSemester(whereClause);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}

			if(subjectList.size() > 0 && subjectList != null) {
				subjPerSem.put(semester, subjectList);
			}
		}
		
		if (check == 1) {
			calcAggregateGPA();
		}
		return SUCCESS;
	}

	/********************************************************************************************
	 * This method calculates the grades of the student in a particular subject of a particular 
	 * semester.
	 ********************************************************************************************/
	public String calcGrade() {
		execute();
		grade = new Grade();
		String subjCode ="";

		if(semName.equalsIgnoreCase("Semester")) {
			check = 1;
			calcAggregateGPA();
		}
		else {
			check = 0;
			String whereClause = " where studentID ="+ studID +" and subjectID = (select subjectID from studentzone_subject" +
			" where subjectName = '"+subjName+"' and subjectSemester = '"+semName+"');"; 

			try {
				grade = GradeModel.findGrade(whereClause);
				grade.setSubjectName(subjName);

				whereClause = " where subjectName = '"+subjName+"' and subjectSemester = '"+semName+"';";
				subjCode = SubjectModel.getSubjectCode(whereClause);

				grade.setSubjectCode(subjCode);			
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return SUCCESS;
	}

	public String calcAggregateGPA() {

		sgpaList = new ArrayList<String>();
		sgpaList.clear();
		cgpa = 0.0;
		
		for (int i = 0; i < semesterList.size(); i++) {
			if(!semesterList.get(i).equalsIgnoreCase("Semester")) {
				
				String whereClause = " where studentID ="+ studID +" and subjectID in (select subjectID from studentzone_subject" +
				" where subjectSemester = '"+semesterList.get(i)+"');"; 

				try {
					sgpaList.add(GradeModel.findSGPA(whereClause));
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		int count = 0;
		
		for (int i = 0; i < sgpaList.size(); i++) {
			if(!sgpaList.get(i).equalsIgnoreCase("NA")) {
				count++;
				cgpa += Double.parseDouble(sgpaList.get(i));
			}
		}
		cgpa = cgpa / count;
		
		if(Double.isNaN(cgpa)) {
			cgpa = 0.0;
		}
		
		return SUCCESS;
	}
}