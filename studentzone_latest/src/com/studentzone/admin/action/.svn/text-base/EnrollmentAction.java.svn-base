package com.studentzone.admin.action;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.*;

public class EnrollmentAction extends ActionSupport{

	String Semester, hour, minute;
	int subjectID;
	String deadlineDate;

	ArrayList<String> semesterList = new ArrayList<String>();
	ArrayList<String> hourList = new ArrayList<String>();
	ArrayList<String> minuteList = new ArrayList<String>();

	public String execute() throws SQLException{

		/*
		 * Adding static data in semesterList array list
		 */
		semesterList.add("Semester 1");
		semesterList.add("Semester 2");
		semesterList.add("Semester 3");
		semesterList.add("Semester 4");

		/*
		 * adding static data to hour and minute
		 */
		hourList.add("00");
		hourList.add("01");
		hourList.add("02");
		hourList.add("03");
		hourList.add("04");
		hourList.add("05");
		hourList.add("06");
		hourList.add("07");
		hourList.add("08");
		hourList.add("09");
		for(int i=10;i<24;i++){
			String s = Integer.toString(i);
			hourList.add(s);
		}

		minuteList.add("00");
		minuteList.add("15");
		minuteList.add("30");
		minuteList.add("45");

		/*
		 * if we are on this page after selecting
		 * from the semester drop down list 
		 */
		if (getSemester() != null && !getSemester().equals("")){

			/* validations: if user has not selected any of the feilds */
			if(getSemester() == null || getSubjectID()==0 || getDeadlineDate() == null || getDeadlineDate().equals("") || 
					getHour().equals("HH") || getMinute().equals("mm") || getHour()==null || getMinute()== null)
				return ERROR;
			else
			{
				/*
				 * preparing the deadlineDate by concatenating the time
				 */
				setDeadlineDate(getDeadlineDate()+ " "+ getHour()+ ":" + getMinute()+ ":00");

				/*
				 *  preparing new enrollment object
				 */

				Enrollment enrollObj = new Enrollment();
				enrollObj.setEnrollmentSemester(getSemester());
				enrollObj.setSubjectID(getSubjectID());
				enrollObj.setEnrollmentDeadline(getDeadlineDate());


				/*
				 *  passing new object to insert method of model class
				 */
				EnrollmentModel.insertEnrollmentDetails(enrollObj);
			}
		}		
		return SUCCESS;
	}

	/*
	 * Getters and Setters
	 */

	public ArrayList<String> getHourList() {
		return hourList;
	}

	public void setHourList(ArrayList<String> hourList) {
		this.hourList = hourList;
	}

	public ArrayList<String> getMinuteList() {
		return minuteList;
	}

	public void setMinuteList(ArrayList<String> minuteList) {
		this.minuteList = minuteList;
	}

	public String getDeadlineDate() {
		return deadlineDate;
	}

	public void setDeadlineDate(String deadlineDate) {
		this.deadlineDate = deadlineDate;
	}
	public String getSemester() {
		return Semester;
	}

	public void setSemester(String semester) {
		Semester = semester;
	}

	public int getSubjectID() {
		return subjectID;
	}

	public void setSubjectID(int subjectID) {
		this.subjectID = subjectID;
	}
	public ArrayList<String> getSemesterList() {
		return semesterList;
	}

	public void setSemesterList(ArrayList<String> semesterList) {
		this.semesterList = semesterList;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	public String getMinute() {
		return minute;
	}

	public void setMinute(String minutes) {
		this.minute = minutes;
	}

}