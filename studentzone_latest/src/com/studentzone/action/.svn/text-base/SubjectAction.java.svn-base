package com.studentzone.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.Grade;
import com.studentzone.model.GradeModel;
import com.studentzone.model.Subject;
import com.studentzone.model.SubjectModel;

public class SubjectAction extends ActionSupport {

	Map session = ActionContext.getContext().getSession();
	private int studID;
	private String studImage;
	private String studLastLogin;
	private String content = "Show All Courses";
	Subject subjects;
	private String subjectCode;
	private String subjectName;
	ArrayList<String> contentList;
	ArrayList<Subject> subjectList;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Subject getSubjects() {
		return subjects;
	}

	public void setSubjects(Subject subjects) {
		this.subjects = subjects;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public ArrayList<String> getContentList() {
		return contentList;
	}

	public void setContentList(ArrayList<String> contentList) {
		this.contentList = contentList;
	}

	public ArrayList<Subject> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(ArrayList<Subject> subjectList) {
		this.subjectList = subjectList;
	}

	public String execute() {

		if(session.get("studentID") != null) {
			studID = Integer.parseInt(session.get("studentID").toString());
			studLastLogin = session.get("lastAccess").toString();
			studImage = session.get("studentImgUrl").toString();
		}

		subjectList = new ArrayList<Subject>();
		String whereClause = "";
		Grade grade;

		try {
			if(content == null || content.equalsIgnoreCase("Show All Courses")) {
				contentList = new ArrayList<String>();
				contentList.add("Show Enrolled Courses");
				content = "Show All Courses";
				subjectList = SubjectModel.getSubjectListPerSemester("");
			}
			else {
				contentList = new ArrayList<String>();
				contentList.add("Show All Courses");
				content = "Show Enrolled Courses";
				whereClause = " where subjectID in (select subjectID from studentzone_enrollment where enrollmentID" +
				" in (select enrollmentID from studentzone_student_enrollment where studentID = "+ studID +"));";

				subjectList = SubjectModel.getSubjectListPerSemester(whereClause);
			}

			for(int i=0; i<subjectList.size(); i++) {

				whereClause = " where studentID = "+ studID +" and subjectID = (select subjectID from studentzone_subject" +
				" where subjectName = '"+subjectList.get(i).getSubjectName()+"');"; 

				grade = GradeModel.findGrade(whereClause);
				subjectList.get(i).setSubjectGrade(grade.getSubjectGrade());

				whereClause = " where facultyID in (select facultyID from studentzone_subject_faculty" +
				" where subjectID = (select subjectID from studentzone_subject where subjectCode = '"+
				subjectList.get(i).getSubjectCode()+"'));";
				
				ArrayList<String> facultyList = SubjectModel.findFaculty(whereClause);
				
				String faculty = "";
				if(facultyList.size() > 0)
					faculty = facultyList.get(0);
				else
					faculty = "NA";
				
				for(int j = 1; j < facultyList.size(); j++) {
					faculty = faculty + " , " + facultyList.get(j);
				}

				subjectList.get(i).setFacultyName(faculty);

				whereClause = " where studentID = "+studID+" and enrollmentID = (select enrollmentID from studentzone_enrollment" +
				" where subjectID = (select subjectID from studentzone_subject where subjectCode = '"+
				subjectList.get(i).getSubjectCode()+"'));";

				subjectList.get(i).setEnrolled(SubjectModel.checkEnrollment(whereClause));

			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}

	public String findSyllabus() {

		return SUCCESS;
	}
}
