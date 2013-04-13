package com.studentzone.action;

import java.io.File;
import com.studentzone.model.LoginModel;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.studentzone.model.UpdateProfileModel;
import com.studentzone.util.MyUtilityFunctions;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class UpdateProfileAction extends ActionSupport  implements
ServletRequestAware{
	String studentName;
	String studentDOB;
	String newInterest;
	String emailID;
	private File userImage;
	private String userImageContentType;
	private String userImageFileName;
	String filePath;
	private String photoURL;
	int checkEmail;

	private HttpServletRequest servletRequest;

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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}

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

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public String execute(){
		checkEmail=0;
		System.out.println("update profile....");
		if(userImageFileName==null){
			userImageFileName=ActionContext.getContext().getSession().get("studentImgUrl").toString();
			UpdateProfileModel.updateProfile(studentName,studentDOB,userImageFileName);
			UpdateProfileModel.updateInterests(newInterest);
			checkEmail=UpdateProfileModel.updateEmail(emailID);
			return SUCCESS;
		}
		else{

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
			UpdateProfileModel.updateProfile(studentName,studentDOB,photoURL);
			UpdateProfileModel.updateInterests(newInterest);
			checkEmail=UpdateProfileModel.updateEmail(emailID);

			//refetch the imageURL
			Map sess=ActionContext.getContext().getSession();
			//remove the old one
			sess.remove("studentImgUrl");
			//put the new one
			LoginModel loginUser = new LoginModel();
			sess.put("studentImgUrl", loginUser.getProfilePic(loginUser.getUID((String) sess.get("userName"))));
			return SUCCESS;
		}

	}
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;

	}
}
