/*
 * Action class for login and logout.
 * Ananda
 */
package com.studentzone.action;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.Announcement;
import com.studentzone.model.AnnouncementModel;
import com.studentzone.model.LoginModel;
import com.studentzone.model.NEWS;
import com.studentzone.model.NEWSModel;
import com.studentzone.util.MyUtilityFunctions;

public class LoginAction extends ActionSupport {
	private String username;
	private String password;

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	private String errorMsg;

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String execute() {
		return SUCCESS;
	}

	public String home() {
		return SUCCESS;
	}

	public String login() {

		LoginModel loginUser = new LoginModel();

		//validating login form
		if(username.equals("") || password.equals("") ) {
			addActionError("Username/Password required");
			return INPUT;
		}
		else {
			//checking whether user exist or not
			if(loginUser.checkUsername(username).equals("")){
				addActionError("Username does not exist.");
				return INPUT;
			}
			//if user exists and account is active then get the password, 
			//generate md5 hash and match with entered password
			else if(loginUser.getPassword(username).equals(MyUtilityFunctions.generateMD5(password))) {
				Map sess=ActionContext.getContext().getSession();
				sess.put("login", true);
				sess.put("userName",username);
				sess.put("studentID",loginUser.getUID(username));
				//System.out.println(profile.getProfilePic(user.getUID(username)));
				sess.put("studentImgUrl", loginUser.getProfilePic(loginUser.getUID(username)));


				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				java.util.Date date = null;
				try {
					date = sdf.parse(loginUser.getLastAccessTime(loginUser.getUID(username)).toString());
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println(date);

				sess.put("lastAccess", date.toString());
				//update the last logged on time
				loginUser.setLastAccessTime(loginUser.getUID(username));

				//get NEWS
				ArrayList<NEWS> news = new ArrayList<NEWS>();
				NEWSModel nw = new NEWSModel();
				news = nw.getValidNEWSHeading();
				// put newsid and heading into session
				sess.put("news", news);
				//get Announcement 
				ArrayList<Announcement> anc = new ArrayList<Announcement>();
				AnnouncementModel an = new AnnouncementModel();
				anc = an.getValidAnnouncementHeading();
				//put announcement id and heading into session
				sess.put("announcement", anc);
				return SUCCESS;
			}
			else {
				addActionError("Invalid username/password.");
				return INPUT;
				//errorMsg="Invalid username/password.";
			}
		}
	}

	public String logout() {
		//remove user from session
		Map sess=ActionContext.getContext().getSession();
		sess.remove("login");
		sess.remove("userName");
		sess.remove("studentID");
		sess.remove("studentImgUrl");
		sess.remove("lastAccess");
		sess.remove("announcement");
		sess.remove("news");
		return SUCCESS;
	}
}