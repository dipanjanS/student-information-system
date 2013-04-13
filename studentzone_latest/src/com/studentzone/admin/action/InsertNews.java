package com.studentzone.admin.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.NewsInsertion;

/*
 * This class is to 
 * insert the news in studentzone_NEWS table
 */
public class InsertNews extends ActionSupport{

	private String heading;
	private String content;
	private String validity;
	private String errorMsg;

    public String getErrorMsg() {
        return errorMsg;
    }

    public void setErrorMsg(String errorMsg) {
        this.errorMsg = errorMsg;
    }
    
	public String getHeading() {
		return heading;
	}
	public void setHeading(String heading) {
		this.heading = heading;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getValidity() {
		return validity;
	}
	public void setValidity(String validity) {
		this.validity = validity;
	}
	
	public String execute() throws SQLException{
		System.out.println("Title is " + getHeading());
		System.out.println("Content is " + getContent());
		System.out.println("Date is " + getValidity());
		
		/*
		 * this field is taken
		 * just to return success/error
		 * if any error/exception occurs while 
		 * inserting the value then feedback is "failed"
		 * else "done"
		 */
		String feedback = null;
		
		/*
		 * Field Validation
		 */
		if(getHeading().equals("")){
			addActionError("Heading is not entered.");
			return "ERROR";
		}
		if(getContent().equals("")){
			addActionError("Content is not entered.");
			return "ERROR";
		}
		if(getValidity().equals("")){
			addActionError("Date is not entered.");
			return "ERROR";
		}
		
		NewsInsertion ni = new NewsInsertion();
		feedback = ni.insertInto(getHeading() , getContent() , getValidity());
		
		if(feedback == "done")
			return "SUCCESS";
		else
			return "ERROR";
	}
}
