package com.studentzone.action;

import java.io.File;
import java.util.ArrayList;

import com.studentzone.model.EditProfileModel;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EditProfileAction extends ActionSupport{
	
	String studentName;
	String studentDOB;
	String newInterest;
	String emailID;
	private File userImage;
	
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
	public String getNewInterest() {
		return newInterest;
	}
	public void setNewInterest(String newInterest) {
		this.newInterest = newInterest;
	}
	public File getUserImage() {
		return userImage;
	}
	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}
	ArrayList<String> allInterests;
	ArrayList<String> defaultInterests;
	public ArrayList<String> getAllInterests() {
		return allInterests;
	}
	public void setAllInterests(ArrayList<String> allInterests) {
		this.allInterests = allInterests;
	}
	public ArrayList<String> getDefaultInterests() {
		return defaultInterests;
	}
	public void setDefaultInterests(ArrayList<String> defaultInterests) {
		this.defaultInterests = defaultInterests;
	}
	
	public String getEmailID() {
		return emailID;
	}
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	public String execute(){
		System.out.println("...."+studentName); 
		System.out.println("...."+studentDOB); 
		System.out.println("..."+emailID); 

		allInterests=new ArrayList<String>();
		defaultInterests=new ArrayList<String>();
		allInterests.clear();
		defaultInterests.clear();
		System.out.println("in edit profile...");
		allInterests=EditProfileModel.getAllList(Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString()));
		defaultInterests=EditProfileModel.getDefaultInterests(Integer.parseInt(ActionContext.getContext().getSession().get("studentID").toString()));
		for(int i=0;i<allInterests.size();i++)
			System.out.println("###"+allInterests.get(i));
		for(int i=0;i<defaultInterests.size();i++)
			System.out.println("###"+defaultInterests.get(i));
		return SUCCESS;
	}
}
