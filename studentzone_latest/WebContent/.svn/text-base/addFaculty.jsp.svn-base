<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
</head>
<body>
	<s:form action="faculty" method="execute">
		<table class="table table-bordered">
			<tr>
				<td>Faculty Code</td>
				<td><s:textfield name="facultyCode" cssClass="input-xlarge" /></td>
			</tr>
			<tr>
				<td>Faculty Name</td>
				<td><s:textfield name="facultyName" cssClass="input-xlarge" /></td>
			</tr>
		</table>
		<s:submit value="Add Faculty" name="addFaculty" theme="simple"
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