package com.studentzone.admin.action;

import com.opensymphony.xwork2.ActionSupport;

public class AddAnnouncement extends ActionSupport{
	public String execute(){
		System.out.println("in add announcement...");
		return SUCCESS;
	}
}
