package com.studentzone.action;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import com.studentzone.model.Announcement;
import com.studentzone.model.AnnouncementModel;
import com.studentzone.model.ViewProfileModel;
import com.studentzone.util.*;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ViewProfile extends ActionSupport{

	String studentRollNo;
	String studentName;
	String studentDOB;
	String interest;
	String emailID;

	Map session = ActionContext.getContext().getSession();
	ArrayList<Announcement> ancmnt = new ArrayList<Announcement>();
	ArrayList<String> studentInterest=new ArrayList<String>();
	
	public String getInterest() {
		return interest;
	}
	
	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public void setInterest(String interest) {
		this.interest = interest;
	}

	public ArrayList<String> getStudentInterest() {
		return studentInterest;
	}

	public void setStudentInterest(ArrayList<String> studentInterest) {
		this.studentInterest = studentInterest;
	}

	public String getStudentRollNo() {
		return studentRollNo;
	}

	public void setStudentRollNo(String studentRollNo) {
		this.studentRollNo = studentRollNo;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getStudentDOB() {
		return studentDOB;
	}

	public void setStudentDOB(String studentDOB) {
		this.studentDOB = studentDOB;
	}

	
	public String execute(){
		studentInterest.clear();
		ViewProfileModel obj;
		try {
			obj = ViewProfileModel.getDetails(Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString()));
			setStudentInterest(ViewProfileModel.getInterests(Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString())));
			
			setStudentRollNo(obj.getStudentRollNo());
			setStudentName(obj.getStudentName());
			setStudentDOB(obj.getStudentDOB().toString());
			setEmailID(obj.getEmailID());
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		if(interest != null) {
			AnnouncementModel an = new AnnouncementModel();
			ancmnt = an.getInterestAnnouncementHeading(interest);
			session.remove("announcement");
			session.put("announcement", ancmnt);
		}
		
		return SUCCESS;
	}
}
