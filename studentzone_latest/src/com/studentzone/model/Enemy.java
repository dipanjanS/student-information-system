package com.studentzone.model;

public class Enemy {

	int stuId;
	String name;
	String imageUrl;
	String rollNo;
	public static int noOfRecords;
	public static int myEnemyRecords;
	
	public static int getMyEnemyRecords() {
		return myEnemyRecords;
	}
	public static void setMyEnemyRecords(int myEnemyRecords) {
		Enemy.myEnemyRecords = myEnemyRecords;
	}
	public static int getNoOfRecords() {
		return noOfRecords;
	}
	public static void setNoOfRecords(int noOfRecords) {
		Friend.noOfRecords = noOfRecords;
	}
	public int getStuId() {
		return stuId;
	}
	public void setStuId(int stuId) {
		this.stuId = stuId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImageUrl() {
		return imageUrl;
	}
	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
}
