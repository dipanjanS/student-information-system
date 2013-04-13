package com.studentzone.admin.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.Faculty;
import com.studentzone.admin.model.FacultyModel;
import com.studentzone.model.Subject;
import com.studentzone.model.SubjectModel;

public class FacultyAction extends ActionSupport {

	ArrayList<Faculty> facultyList;
	ArrayList<Subject> subjectList;
	ArrayList<Integer> mappedSubjList;
	private String facultyCode;
	private String facultyName;
	private String subjects;
	private String faculties;
	private String content;

	public void setFacultyList(ArrayList<Faculty> facultyList) {
		this.facultyList = facultyList;
	}

	public ArrayList<Subject> getSubjectList() {
		return subjectList;
	}

	public void setSubjectList(ArrayList<Subject> subjectList) {
		this.subjectList = subjectList;
	}

	public ArrayList<Integer> getMappedSubjList() {
		return mappedSubjList;
	}

	public void setMappedSubjList(ArrayList<Integer> mappedSubjList) {
		this.mappedSubjList = mappedSubjList;
	}

	public String getFacultyCode() {
		return facultyCode;
	}

	public void setFacultyCode(String facultyCode) {
		this.facultyCode = facultyCode;
	}

	public String getFacultyName() {
		return facultyName;
	}

	public void setFacultyName(String facultyName) {
		this.facultyName = facultyName;
	}

	public String getFaculties() {
		return faculties;
	}

	public void setFaculties(String faculties) {
		this.faculties = faculties;
	}

	public String getSubjects() {
		return subjects;
	}

	public void setSubjects(String subjects) {
		this.subjects = subjects;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArrayList<Faculty> getFacultyList() {
		return facultyList;
	}

	public String callFacultyForm() {
		return SUCCESS;
	}

	public String execute() {

		//adding into faculty table
		if(!facultyCode.equals("") && !facultyName.equals("")) {
			Faculty faculty = new Faculty();
			faculty.setFacultyCode(facultyCode);
			faculty.setFacultyName(facultyName);

			try {
				FacultyModel.addFaculty(faculty);
				addActionError("Faculty succesfully added..!!!");
			} catch (SQLException e) {
				e.printStackTrace();
				addActionError("Error..Try Again!!!");
			}
		} else {
			addActionError("Kindly enter all entries!!!");
		}
		return SUCCESS;
	}

	public String mapFacultySubj() {
		System.out.println("Error");
		System.out.println("Subjects " + subjects);
		
		facultyList = new ArrayList<Faculty>();
		subjectList = new ArrayList<Subject>();

		try {
			facultyList = FacultyModel.findFacultyList();
			subjectList = SubjectModel.getSubjectListPerSemester("");

			if(content != null) {
				String whereClause = "where subjectID in (select subjectID from" +
						" studentzone_subject_faculty where facultyID = "+content+")";
				mappedSubjList = SubjectModel.getMappedSubjList(whereClause);

				for (int i=0;i < mappedSubjList.size();i++){
					System.out.println(mappedSubjList.get(i));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(subjects == null)
			return ERROR;
		
		System.out.println("Test1");
		StringTokenizer st = new StringTokenizer(subjects, ", ");
		System.out.println("Test2");
		try {
			
			System.out.println("Testing the error " + faculties);
			FacultyModel.deleteFacultySubj(Integer.parseInt(faculties));

			//adding selected subjects for the faculty
			while(st.hasMoreTokens()) {
				Faculty facultyObj = new Faculty();
				facultyObj.setFacultyID(Integer.parseInt(faculties));
				facultyObj.setSubjectID(Integer.parseInt(st.nextToken()));

				FacultyModel.addFacultySubj(facultyObj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

	public String findFacultySubj() {

		facultyList = new ArrayList<Faculty>();
		subjectList = new ArrayList<Subject>();

		try {
			facultyList = FacultyModel.findFacultyList();
			subjectList = SubjectModel.getSubjectListPerSemester("");

			if(content != null) {
				String whereClause = "where subjectID in (select subjectID from" +
						" studentzone_subject_faculty where facultyID = "+content+")";
				mappedSubjList = SubjectModel.getMappedSubjList(whereClause);

				for (int i=0;i < mappedSubjList.size();i++){
					System.out.println(mappedSubjList.get(i));
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String callDelete() {

		try {
			facultyList = FacultyModel.findFacultyList();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return SUCCESS;
	}

	public String deleteFaculty() {

		try {
			facultyList = FacultyModel.findFacultyList();
			if(!faculties.equals("-1")) {
				FacultyModel.deleteFaculty(Integer.parseInt(faculties));
				addActionError("Faculty deleted successfully..!!!");
			}
			else {
				addActionError("Kindly enter all entries!!!");
			}
		} catch (NumberFormatException e) {
			addActionError("Error..Try Again!!!");
			e.printStackTrace();
		} catch (SQLException e) {
			addActionError("Error..Try Again!!!");
			e.printStackTrace();
		}

		return SUCCESS;
	}
}
