package com.studentzone.action;

import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import com.studentzone.model.Enemy;
import com.studentzone.model.Friend;
import com.studentzone.model.FriendListModel;
/*
 * Display all the students for the logged-in user
 */
public class FriendList extends ActionSupport {

	private static final long serialVersionUID = 1L;

	ArrayList<Friend> frList = new ArrayList<Friend>();
	ArrayList<Friend> myFrdList = new ArrayList<Friend>();
	ArrayList<Enemy> myEnemyList = new ArrayList<Enemy>();
	private int noOfPages;
	private String page;
	private int currentPage;
	private String pageMy;
	private int friendPages;
	private int friendCurrent;
	private int enemyPages;
	private int enemyCurrent;
	private String enemyPageMy;
	
	public String getEnemyPageMy() {
		return enemyPageMy;
	}

	public void setEnemyPageMy(String enemyPageMy) {
		this.enemyPageMy = enemyPageMy;
	}

	public int getEnemyCurrent() {
		return enemyCurrent;
	}

	public void setEnemyCurrent(int enemyCurrent) {
		this.enemyCurrent = enemyCurrent;
	}

	public int getEnemyPages() {
		return enemyPages;
	}

	public void setEnemyPages(int enemyPages) {
		this.enemyPages = enemyPages;
	}

	public int getFriendPages() {
		return friendPages;
	}

	public void setFriendPages(int friendPages) {
		this.friendPages = friendPages;
	}

	public int getFriendCurrent() {
		return friendCurrent;
	}

	public void setFriendCurrent(int friendCurrent) {
		this.friendCurrent = friendCurrent;
	}

	public ArrayList<Friend> getMyFrdList() {
		return myFrdList;
	}

	public void setMyFrdList(ArrayList<Friend> myFrdList) {
		this.myFrdList = myFrdList;
	}
	
	public ArrayList<Enemy> getMyEnemyList() {
		return myEnemyList;
	}
	
	public void setMyEnemyList(ArrayList<Enemy> myEnemyList) {
		this.myEnemyList = myEnemyList;
	}

	public String getPageMy() {
		return pageMy;
	}

	public void setPageMy(String pageMy) {
		this.pageMy = pageMy;
	}

	public int getNoOfPages() {
		return noOfPages;
	}

	public void setNoOfPages(int noOfPages) {
		this.noOfPages = noOfPages;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public ArrayList<Friend> getFrList() {
		return frList;
	}

	public void setFrList(ArrayList<Friend> frList) {
		this.frList = frList;
	}

	/*
	 * Get the array list from model class ( FriendListModel)
	 * and display on the jsp page
	 */
	public String execute(){
		Map session = ActionContext.getContext().getSession();
		
		System.out.println("temp pages = " + page);
		System.out.println("Friend pages = " + pageMy);
		FriendListModel flm = new FriendListModel();
		/*
		 * To get the data for
		 * all the students other than the logged-in user
		 */
		
		int temppage = 1;
		int recordsPerPage = 3;
		if(this.page != null)
			 temppage = Integer.parseInt(this.page);
		
		System.out.println("Pages = " + temppage);
		frList = flm.fetchFriendList("order by sp.studentRollNo limit " + (temppage-1)*recordsPerPage + "," + recordsPerPage);
	    int noOfRecords = Friend.getNoOfRecords();
	    System.out.println("Records " + noOfRecords);
	    this.noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
	    this.currentPage = temppage;
	    System.out.println("temp page " + this.noOfPages);
	    System.out.println("Current page " + this.currentPage);
	    session.put("nop", this.noOfPages);
	    session.put("cp", this.currentPage);
	    
		//frList = flm.fetchFriendList();
		System.out.println("Array list size " + frList.size());
		
		
		/*
		 * To get the list 
		 * of all the freiends of logged-in user
		 */
		int myPage = 1;
		int myEnemyPage = 1;
		int myFriendRec = 3;
		if(this.pageMy != null)
			 myPage = Integer.parseInt(this.pageMy);
		if(this.enemyPageMy != null)
			myEnemyPage = Integer.parseInt(this.enemyPageMy);
		
		myFrdList = flm.fetchMyFriends("order by s.studentRollNo limit " + (myPage-1)*myFriendRec + "," + myFriendRec);
		myEnemyList = flm.fetchMyEnemies("order by s.studentRollNo limit " + (myEnemyPage-1)*myFriendRec + "," + myFriendRec);
		
	    int friendRec = Friend.myFriendRecords;
	    int enemyRec = Enemy.myEnemyRecords;
	    
	    this.friendPages = (int) Math.ceil(friendRec * 1.0 / myFriendRec);
	    this.enemyPages = (int) Math.ceil(enemyRec * 1.0 / myFriendRec);
	    
	    this.friendCurrent = myPage;
	    this.enemyCurrent = myEnemyPage;
	    
	    session.put("frNop", this.friendPages);
	    session.put("frCp", this.friendCurrent);
	    session.put("enNop", this.enemyPages);
	    session.put("enCp", this.enemyCurrent);
	    
		//frList = flm.fetchFriendList();
		System.out.println("-----------------");
		
		
		return "SUCCESS";
	}
}
