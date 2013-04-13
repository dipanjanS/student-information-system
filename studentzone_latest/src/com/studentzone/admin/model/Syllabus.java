package com.studentzone.admin.model;


public class Syllabus{

	private String subjectName;
	private String subjectSyllabus;
	private int syllabusID;
	
	
	public int getSyllabusID() {
		return syllabusID;
	}

	public void setSyllabusID(int syllabusID) {
		this.syllabusID = syllabusID;
	}

	public String getSubjectName() {
		return subjectName;
	}

	public void setSubjectName(String subjectName) {
		this.subjectName = subjectName;
	}

	public String getSubjectSyllabus() {
		return subjectSyllabus;
	}

	public void setSubjectSyllabus(String subjectSyllabus) {
		this.subjectSyllabus = subjectSyllabus;
	}

}
