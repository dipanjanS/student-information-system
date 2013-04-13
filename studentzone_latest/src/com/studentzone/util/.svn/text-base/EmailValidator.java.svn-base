package com.studentzone.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
 
public class EmailValidator {
 
	private Pattern pattern;
	private Matcher matcher;
	Pattern patternphone;
	private Matcher matcherphone;
	
	Pattern patternnumber;
	private Matcher matchernumber;
 
	private static final String EMAIL_PATTERN = 
		"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
		+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
 
	public EmailValidator() {
		pattern = Pattern.compile(EMAIL_PATTERN);
		patternphone = Pattern.compile("\\d{10}");
		patternnumber = Pattern.compile("^[0-9]\\d*(\\.\\d+)?$");
	}
 
	/**
	 * Validate hex with regular expression
	 * 
	 * @param hex
	 *            hex for validation
	 * @return true valid hex, false invalid hex
	 */
	public boolean validate(final String hex) {
 
		matcher = pattern.matcher(hex);
		return matcher.matches();
 
	}
	
	
	public boolean validatephone(final String hex) {
		 
		matcherphone = patternphone.matcher(hex);
		return matcherphone.matches();
 
	}
	
	public boolean validatenumber(final String hex) {
		 
		matchernumber = patternnumber.matcher(hex);
		return matchernumber.matches();
 
	}
	
}