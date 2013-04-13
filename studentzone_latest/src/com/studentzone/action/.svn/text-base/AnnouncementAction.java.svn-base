package com.studentzone.action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.Announcement;
import com.studentzone.model.AnnouncementModel;

public class AnnouncementAction extends ActionSupport{

	private Integer announcementID;
	ArrayList<Announcement> fullannouncement = new ArrayList<Announcement>();
	
	public Integer getAnnouncementID() {
		return announcementID;
	}

	public void setAnnouncementID(Integer announcementID) {
		this.announcementID = announcementID;
	}

	public ArrayList<Announcement> getFullannouncement() {
		return fullannouncement;
	}

	public void setFullannouncement(ArrayList<Announcement> fullannouncement) {
		this.fullannouncement = fullannouncement;
	}

	public String getFullAnnouncement() {
		AnnouncementModel fullanc = new AnnouncementModel();
		fullannouncement = fullanc.getFullAnnouncement(announcementID);
		return SUCCESS;
	}
}
