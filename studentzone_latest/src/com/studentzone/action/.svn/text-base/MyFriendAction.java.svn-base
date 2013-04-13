package com.studentzone.action;

import java.sql.SQLException;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.MyFriend;
import com.studentzone.model.MyFriendModel;

/*
 * this class get the data for the student id 
 * And then fetches the details
 * of that student using MyFriendModel class
 */
public class MyFriendAction extends ActionSupport  {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	int friendID ;
	private MyFriend mf = new MyFriend();
	private MyFriend me = new MyFriend();

	public MyFriend getMe() {
		return me;
	}

	public void setMe(MyFriend me) {
		this.me = me;
	}
	
	public MyFriend getMf() {
		return mf;
	}

	public void setMf(MyFriend mf) {
		this.mf = mf;
	}

	public int getFriendID() {
		return friendID;
	}

	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}

	//Get the details of the friend using model clss MyFriendModel
	public String execute(){
		System.out.println("Friends Id is " + getFriendID());
		
		MyFriendModel mfm = new MyFriendModel();
		
		mf = mfm.fetchData(getFriendID());
		me = mfm.fetchEnemyData(getFriendID());
		
		if(mf.getIsFriend().equals("true")) {
			me.setIsFriend("none");
		}
		if(me.getIsFriend().equals("true")) {
			mf.setIsFriend("none");
		}
		
		System.out.println("**************************"+me.getIsFriend()+"********************");
		
		System.out.println("Interest is " + mf.getInterest());
		if(!(mf.getFriendName().equals(null))){
			
			return "SUCCESS";	
		}
		else
			return "ERROR";
		
	}
}
