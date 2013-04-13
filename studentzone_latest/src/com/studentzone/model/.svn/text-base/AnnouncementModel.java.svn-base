package com.studentzone.model;
import com.studentzone.util.RuntimeSettings;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class AnnouncementModel {
	private Connection connection = null;
	private PreparedStatement ptmt = null;
	private ResultSet resultSet = null;

	/*
	 * function to fectch the announcement heading which are not expired to put into session
	 */
	public ArrayList<Announcement> getValidAnnouncementHeading() {
		ArrayList<Announcement> anc = new ArrayList<Announcement>();
		//get the current date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		//print date on console
		System.out.println("date is " + dateFormat.format(date));
		try {
			String qstring = "SELECT * FROM studentzone_announcement WHERE " +
					"validity >= '" + dateFormat.format(date) + "'";

			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(qstring);
			//print querystring on console
			System.out.println(qstring);
			resultSet = ptmt.executeQuery();

			while(resultSet.next()) {
				Announcement an = new Announcement();
				an.setAnnouncementID(resultSet.getInt("announcementID"));
				an.setHeading(resultSet.getString("heading"));
				anc.add(an);
			}
			ptmt.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return anc;
	}

	public ArrayList<Announcement> getInterestAnnouncementHeading(String interest) {
		ArrayList<Announcement> anc = new ArrayList<Announcement>();
		//get the current date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		//print date on console
		System.out.println("date is " + dateFormat.format(date));
		try {
			String qstring = "SELECT * FROM studentzone_announcement WHERE " +
					"validity >= '" + dateFormat.format(date) + "' and interestID = (select interestID from studentzone_interest where interestName = '"+interest+"')";

			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(qstring);
			//print querystring on console
			System.out.println(qstring);
			resultSet = ptmt.executeQuery();

			while(resultSet.next()) {
				Announcement an = new Announcement();
				an.setAnnouncementID(resultSet.getInt("announcementID"));
				an.setHeading(resultSet.getString("heading"));
				anc.add(an);
			}
			ptmt.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return anc;
	}

	public ArrayList<Announcement> getFullAnnouncement(Integer announcementID) {
		ArrayList<Announcement> anc = new ArrayList<Announcement>();
		//get the current date
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		//print date on console
		System.out.println("date is " + dateFormat.format(date));
		try {
			String qstring = "SELECT * FROM studentzone_announcement WHERE " +
					"announcementID = '" + announcementID +
					"' AND validity >= '" + dateFormat.format(date) + "'";

			connection = com.studentzone.util.MySqlConnection.getInstance().getConnection();
			ptmt = connection.prepareStatement(qstring);
			//print querystring on console
			System.out.println(qstring);
			resultSet = ptmt.executeQuery();

			while(resultSet.next()) {
				Announcement an = new Announcement();
				an.setAnnouncementID(resultSet.getInt("announcementID"));
				an.setHeading(resultSet.getString("heading"));
				an.setContent(resultSet.getString("content"));
				an.setAnnouncementCreatedOn(resultSet.getTimestamp("announcementCreatedOn"));
				anc.add(an);
			}
			ptmt.close();
			connection.close();
			resultSet.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return anc;

	}
}
