package com.studentzone.admin.action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.DeleteStudent;

public class DeleteStudentAction extends ActionSupport{
	String content;
	ArrayList<String> allRoll=new ArrayList();

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public ArrayList<String> getAllRoll() {
		return allRoll;
	}

	public void setAllRoll(ArrayList<String> allRoll) {
		this.allRoll = allRoll;
	}

	public String execute(){
		allRoll.clear();
		System.out.println("in delete action...");
		allRoll=DeleteStudent.getAllRollNumbers();
		for(int i=0;i<allRoll.size();i++){
			System.out.println("....."+allRoll.get(i));
		}
		return SUCCESS;
	}
	public String deleteStudent(){
		System.out.println("in delete from database..."+content);
		int flag=DeleteStudent.deleteStudent(content);
		if(flag==1)
			return SUCCESS;
		else return ERROR;
	}
}
