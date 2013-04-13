<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title></title>
</head>
<body>
	<s:form action="updateGrades">
		<table class="table table-bordered">
			<tr>
				<td>Student Roll Number </td>
				<td><s:textfield name="rollNo" /></td>
			</tr>
			<tr>
				<td>Subject Code </td>
				<td><s:textfield name="subjectCode" /></td>
			</tr>
			<tr>
				<td>Grade Obtained </td>
				<td><s:textfield name="grade" /></td>
			</tr>
			<tr>
				<td>Result Obtained </td>
				<td><s:textfield name="result" /></td>
			</tr>
			
			<tr>
				<td>Date of entry </td>
				<td><s:textfield name="gradeDate" /></td>
			</tr>
		</table>
		
		<s:submit value="Update Grade" name="updategrade" theme="simple"
			cssClass="btn btn-primary" />
	</s:form>
	<s:if test="hasActionErrors()">
			<s:iterator value="actionErrors">
				<div class="alert alert-success">
					<br />
					<s:property />
					<br /> <br />
				</div>
			</s:iterator>
	</s:if>
</body>
</html>