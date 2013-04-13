<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<script>
	
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd",
		    changeMonth: true,
			changeYear: true
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<s:form action="detailsInserted" method="post" enctype="multipart/form-data">
		<table class="table table-bordered table-hover">
			<tr>
				<td>Enter User name</td>
				<td><s:textfield name="userName" theme="simple"
						placeholder="Please enter username" cssClass="input-xlarge" /></td>
			</tr>
			<tr>
				<td>Enter Password</td>
				<td><s:password name="password" theme="simple"
						placeholder="Please enter password" cssClass="input-xlarge" /></td>
			</tr>
			<tr>
				<td>Enter Roll Number</td>
				<td><s:textfield name="rollNo" theme="simple"
						placeholder="Please enter Roll Number" cssClass="input-xlarge" /></td>
			</tr>
			<tr>
				<td>Enter Name</td>
				<td><s:textfield name="name" theme="simple"
						placeholder="Please enter name" cssClass="input-xlarge" /></td>
			</tr>
			
			<tr>
				<td>Enter date of birth</td>
				<td><input type="text" theme="simple" id="datepicker" name="dob" class="input-xlarge" />

				</td>
			</tr>
			 
			 <tr>
				<td>Upload image</td>
				<td><s:file name="userImage" theme="simple"/>

				</td>
			</tr>
		</table>
		<s:submit name="commandButton" id="mysubmit" value="Insert Details"
						cssClass="btn btn-primary" theme="simple"/>

	</s:form>
</body>
</html>