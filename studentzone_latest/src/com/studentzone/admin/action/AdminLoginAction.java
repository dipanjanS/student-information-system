package com.studentzone.admin.action;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminLoginAction extends ActionSupport{

	private String username;
	private String password;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String execute() {

		if (this.username.equals("Admin") && this.password.equals("secret")) {
			Map adminSess=ActionContext.getContext().getSession();
			adminSess.put("adminlogin", true);
			return "success";
		} else {
			addActionError("\nSorry, wrong credentials have been provided.\n");
			return "error";
		}
	}
	
	public String loggedIn() {

		return "success";
	}

	 public String logout() {
	        //remove user from session
	    	Map adminSess=ActionContext.getContext().getSession();
	    	adminSess.remove("adminlogin");
	        return SUCCESS;
	    }

}



