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
<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br/><br/>
	<div class="span3">
		<a
			href="viewProfile.action?studentID=<s:property value="%{#session.studentID}" />">

			<img src="<s:property value="%{#session.studentImgUrl}" />"
			class="img-polaroid" style="width: 200px; height: 200px" />
		</a>
	</div>
	<s:form action="updateProfile" method="post" cssClass="form-horizontal"
		 enctype="multipart/form-data">
		<s:if test="hasActionErrors()">
			<s:iterator value="actionErrors">

				<div align="center">
					<br />
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">&times;</button>
						<s:property />
					</div>
				</div>

			</s:iterator>
		</s:if>
		<div class="span6">

			<table class="table">

				<tr>
					<td><b>Enter Name:</b></td>
					<td><s:textfield name="studentName" theme="simple"
							cssClass="input-xlarge" /></td>
				</tr>

				<tr>
					<td><b>Enter date of birth:</b></td>
					<td><input type="text" value="<s:property value="%{studentDOB}" />" id="datepicker"
						name="studentDOB" class="input-xlarge" /></td>
				</tr>
				
				<tr>
					<td><b>Enter email ID:</b></td>
					<td><s:textfield name="emailID" theme="simple"
							cssClass="input-xlarge" /></td>
				</tr>

				<tr>
					<td><b>Upload image:</b></td>
					<td><s:file name="userImage"  label="img" theme="simple" /></td>
				</tr>
			</table>
		</div>

		<div class="span6">

			<div STYLE="height: 100px; font-size: 12px; overflow: auto;">

				<s:checkboxlist list="allInterests" name="newInterest"
					value="defaultInterests" theme="simple"/>

			</div>

		</div>
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		
		<div class="span3">
			<s:submit name="commandButton" id="mysubmit" value="Update"
				align="center" cssClass="btn btn-primary" theme="simple" />
		</div>

	</s:form>

</body>
</html>