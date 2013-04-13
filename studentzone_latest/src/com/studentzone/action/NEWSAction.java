package com.studentzone.action;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.NEWS;
import com.studentzone.model.NEWSModel;

public class NEWSAction extends ActionSupport{
	
	private Integer NEWSID;
	
	public Integer getNEWSID() {
		return NEWSID;
	}

	public void setNEWSID(Integer nEWSID) {
		NEWSID = nEWSID;
	}

	ArrayList<NEWS> fullnews = new ArrayList<NEWS>();
	
	public ArrayList<NEWS> getFullnews() {
		return fullnews;
	}

	public void setFullnews(ArrayList<NEWS> fullnews) {
		this.fullnews = fullnews;
	}

	public String getFullNEWS() {
		NEWSModel fullnw = new NEWSModel();
		fullnews = fullnw.getFullNEWS(NEWSID);
		return SUCCESS;
	}

}
