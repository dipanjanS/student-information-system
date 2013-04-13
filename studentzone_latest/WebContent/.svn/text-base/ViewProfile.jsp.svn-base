<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="s" uri="/struts-tags"%>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>

<script type="text/javascript">
	function getSelectedInterest() {
		var element = document.getElementById("returnInterest");
		var interest = element.options[element.selectedIndex].text;

		callActionClass(interest);
	}

	function callActionClass(interest) {
		window.location = "viewProfile?interest=" + interest;
	}

	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
</script>

<title>Insert title here</title>
</head>
<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br />
	<br />
	<s:form action="editProfile" method="post">
		<div class="span4" align="center">
			<div class="well">
				Hello <b><s:property value="#session['userName']" /></b>!<br /> <br />
				<a href="viewProfile"><img
					src="<s:property value="#session['studentImgUrl']" />"
					class="img-polaroid" style="width: 200px; height: 200px"></img></a> <br />
				<br /> <b>Last Logged on: </b>
				<s:property value="#session['lastAccess']" />
			</div>
		</div>

		<div class="span8">
			<s:hidden name="studentName" />
			<s:hidden name="studentDOB" />
			<s:hidden name="emailID" />

			<table class="table">
				<tr>
					<td><b>Roll Number:</b></td>
					<td><b><s:property value="studentRollNo" /></b></td>
				</tr>

				<tr>
					<td><b>Name:</b></td>
					<td><b><s:property value="studentName" /></b></td>
				</tr>

				<tr>
					<td><b>Date of Birth:</b></td>
					<td><b><s:property value="studentDOB" /></b></td>
				</tr>
				
				<tr>
					<td><b>Email Address:</b></td>
					<td><b><s:property value="emailID" /></b></td>
				</tr>
				
				<tr>
					<td><b>Interests:</b></td>
					<td><s:select name="returnInterests" list="studentInterest" id="returnInterest"
							headerKey="-1" headerValue="Your Interests" theme="simple"
							cssClass="chzn-select" style="width:350px"
							onChange="getSelectedInterest()" value="%{interest}" /></td>
				</tr>
			</table>
		</div>
		<div class="span2 offset1">
			<br />
			<br />
			<br />
			<br />
			<br />
			<br />
			<s:submit value="Edit Profile" cssClass="btn btn-primary"></s:submit>
		</div>

	</s:form>
</body>
</html>