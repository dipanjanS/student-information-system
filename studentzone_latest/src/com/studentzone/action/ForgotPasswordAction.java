package com.studentzone.action;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.opensymphony.xwork2.ActionSupport;
import com.studentzone.model.ForgotPassword;
import com.studentzone.util.EmailValidator;
import com.studentzone.util.GeneratePassword;
import com.studentzone.util.MyUtilityFunctions;

@SuppressWarnings("serial")
public class ForgotPasswordAction extends ActionSupport {

	private String emailID = "";

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	static Properties properties = new Properties();
	static {
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "25");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "25");
	}

	public String forgotPassword() {
	return SUCCESS;
	}
	
	public String confirmEmail() {
		
		if (emailID.equals("")) {
			
			addActionError("Please enter your email id.");			
			return ERROR;
		}
		
		
		EmailValidator ev = new EmailValidator();
		if(!(ev.validate(emailID)))
		{
			addActionError("Please enter a valid email id.");			
			return ERROR;
		}
		
		System.out.println("emailID = " + emailID);
		String whereClause = "emailID = '" + emailID + "'";
		String userID = "";
		int studentID = 0;
		// search for given emailID starts
		ResultSet result = ForgotPassword.find(whereClause,
				"studentzone_student");
		
		try {
			result.next();
			userID = result.getString(2);
			studentID = result.getInt(1);
			System.out.println("User ID : " + userID);

		}

		catch (SQLException e) {
			System.out.println("User ID : " + userID);
			addActionError("Email id was not found.");
			return ERROR;
		}

		// search for given emailID ends

		// generate random password starts
		String resetPassword = GeneratePassword.getNewPassword();
		// generate random password ends
		System.out.println("New Password: " + resetPassword);
		// encrypt generated password starts
		String passwordToSave = MyUtilityFunctions.generateMD5(resetPassword);
		// encrypt generated password ends
		System.out.println("Password to save: " + passwordToSave);
		whereClause = "studentID = " + studentID;
		// update new password in DB starts
		ForgotPassword.update(whereClause, "studentzone_student",
				passwordToSave);
		// update new password in DB ends
		// send email starts
		final String from = new String("student.zone403@gmail.com");
		final String pwd = new String("studentzone");
		String subject = new String("Password Reset");
		String body = new String(
				"Your Password has been reset. The new credentials are: UserID = "
						+ userID + " and Password = " + resetPassword);
		try {
			Session sessionemail = Session.getDefaultInstance(properties,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(from, pwd);
						}
					});

			Message message = new MimeMessage(sessionemail);
			message.setFrom(new InternetAddress(from));
			System.out.println("email id:" + emailID);
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(emailID));
			message.setSubject(subject);
			message.setText(body);
			Transport.send(message);
			
		} catch (Exception e) {
			e.printStackTrace();
			addActionError("Error! Please try again.");
			return ERROR;

		}
		
		addActionMessage("Username and password has been sent to your registered email id.");
		// send email ends
		return SUCCESS;
	}
}
