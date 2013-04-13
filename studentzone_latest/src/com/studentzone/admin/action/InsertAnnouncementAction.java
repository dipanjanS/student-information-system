package com.studentzone.admin.action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.admin.model.InsertAnnouncement;

public class InsertAnnouncementAction extends ActionSupport{
	String title;
	String content;
	String dob;
	ArrayList<String> allAnnouncements=new ArrayList<String>();
	String announcementTitle;


	public String getAnnouncementTitle() {
		return announcementTitle;
	}

	public void setAnnouncementTitle(String announcementTitle) {
		this.announcementTitle = announcementTitle;
	}

	public ArrayList<String> getAllAnnouncements() {
		return allAnnouncements;
	}

	public void setAllAnnouncements(ArrayList<String> allAnnouncements) {
		this.allAnnouncements = allAnnouncements;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String execute(){
		System.out.println("in insert announcement..."+title);
		int flag=InsertAnnouncement.addAnnouncement(title,content,dob);
		if(flag==1)
			return SUCCESS;
		else 
			return ERROR;
	}
	public String deleteAnnouncementAction(){
		allAnnouncements=InsertAnnouncement.getAllAnnouncements();
		return SUCCESS;
	}
	public String deleteAnnouncementFromDatabase(){
		int flag=InsertAnnouncement.deleteAnnouncement(announcementTitle);
		if(flag==1)
			return SUCCESS;
		else 
			return ERROR;
	}
}

