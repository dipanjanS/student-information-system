package com.studentzone.admin.action;

import com.opensymphony.xwork2.ActionSupport;

public class NewStudentRegistration extends ActionSupport{
	public String execute(){
		System.out.println("in new student registration");
		return SUCCESS;
	}

}
