package com.studentzone.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.FriendModel;
import com.studentzone.model.MyFriendModel;

public class FriendAction extends ActionSupport{

	int friendID;
	private String buttonName;
	public void setButtonName(String buttonName) {
		this.buttonName = buttonName;
	}
	public int getFriendID() {
		return friendID;
	}

	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}

	/*
	 * Insert the record in table studentzone_friendship
	 * if "Add as a friend"
	 * if already a friend and wants to unfriend it
	 * then  delete the record from the table 
	 * for that studentid and friendid
	 */
	public String execute() throws SQLException{
		System.out.println("Friends Id is " + getFriendID());
		String feedback = null;
		FriendModel mfm = new FriendModel();

		//Add as a friend
		if ("Add as Friend".equals(buttonName)) {
			System.out.println("Add");
			feedback =  mfm.insertInto(getFriendID());
		}

		//Unfriend
		if ("Unfriend".equals(buttonName)) {
			System.out.println("delete");
			feedback =  mfm.deleteFrom(getFriendID());
		}

		//Add As Enemy
		if (buttonName.equals("Add as Enemy")) {
			System.out.println("Add as enemy");
			feedback =  mfm.insertIntoEnemy(getFriendID());
		}

		//UnBlock
		if (buttonName.equals("UnBlock")) {
			System.out.println("UnBlock");
			feedback =  mfm.unBlockUser(getFriendID());
		}

		System.out.println(feedback);
		if(feedback.equals("done"))
			return "SUCCESS";
		else
			return "ERROR";
	}
}
