package com.studentzone.admin.action;

import java.io.File;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.studentzone.admin.model.InsertStudentDetails;
import com.studentzone.util.MyUtilityFunctions;

import com.opensymphony.xwork2.ActionSupport;


public class DetailsInserted extends ActionSupport implements
ServletRequestAware {
	private String photoURL;
	private File userImage;
	private String userImageContentType;
	private String userImageFileName;
	private String userName;
	private String password;
	private String rollNo;
	private String name;
	private String dob;
	String filePath;
	
	private HttpServletRequest servletRequest;
	
	public String execute() {
		try {
			//get the path where photos will get uploaded
			filePath = servletRequest.getSession().getServletContext()
					.getRealPath("/uploads/profilepictures");
			System.out.println("Server path:" + filePath);
			
			//Create photo name from random generator
			String photoName = MyUtilityFunctions.createUUID() + "-" + userImageFileName;			
			
			//create photoURL
			photoURL = "uploads/profilepictures/" + photoName;
			
			//create new file with new path and name
			File fileToCreate = new File(filePath, photoName);
			
			//copy file to given location
			FileUtils.copyFile(this.userImage, fileToCreate);
		} catch (Exception e) {
			e.printStackTrace();
			addActionError(e.getMessage());

			return INPUT;
		}
		Integer studentID;
		try {
			InsertStudentDetails.insertData(userName,MyUtilityFunctions.generateMD5(password));
			studentID=InsertStudentDetails.getStudentID(userName);
			InsertStudentDetails.insertInProfile(rollNo,name,dob,photoURL,studentID);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
	
	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getRollNo() {
		return rollNo;
	}


	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getDob() {
		return dob;
	}


	public void setDob(String dob) {
		this.dob = dob;
	}


	public File getUserImage() {
		return userImage;
	}

	public void setUserImage(File userImage) {
		this.userImage = userImage;
	}

	public String getUserImageContentType() {
		return userImageContentType;
	}

	public void setUserImageContentType(String userImageContentType) {
		this.userImageContentType = userImageContentType;
	}

	public String getUserImageFileName() {
		return userImageFileName;
	}

	public void setUserImageFileName(String userImageFileName) {
		this.userImageFileName = userImageFileName;
	}

	@Override
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}
}
