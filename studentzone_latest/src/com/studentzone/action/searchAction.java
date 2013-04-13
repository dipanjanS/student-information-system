package com.studentzone.action;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.SearchModel;

public class searchAction extends ActionSupport {
	
	private String rollno;
	private Integer studentID;
	private String errorMsg;
	
	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public Integer getStudentID() {
		return studentID;
	}

	public void setStudentID(Integer studentID) {
		this.studentID = studentID;
	}

	public String getRollno() {
		return rollno;
	}

	public void setRollno(String rollno) {
		this.rollno = rollno;
	}

	/* Search by ID function will search student by give id
	 * 
	 */
	public String searchByRollNo() {
		
		//validating seach form
    	if(rollno.equals("")) {
			addActionError("Roll No is required to search for Student");
			return INPUT;
    	}
    	
		SearchModel sm = new SearchModel();
		studentID = sm.searchByRollNo(rollno);
		
		if (studentID == -1){
			
			addActionError("Sorry!! Student Not Found, Please try again");
			return INPUT;
			
		}
		else {
        return SUCCESS;
		}
    }

}
