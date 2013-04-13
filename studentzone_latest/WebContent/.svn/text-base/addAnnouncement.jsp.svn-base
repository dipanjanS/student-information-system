<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<s:form action="insertAnnouncement" method="post">
		<table class="table table-bordered table-hover">
			<tr>
				<td>Title</td>
				<td><s:textfield name="title" theme="simple"
						placeholder="Please enter title" cssClass="input-xlarge" /></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><s:textarea name="content" theme="simple"
						placeholder="Please enter content" cssClass="input-xlarge" /></td>
			</tr>
			
			
			<tr>
				<td>Validity</td>
				<td><input type="text" theme="simple" id="datepicker" name="dob" class="input-xlarge" />

				</td>
			</tr>
			 
		</table>
		<s:submit name="commandButton" id="mysubmit" value="Add new Announcement"
						cssClass="btn btn-primary" theme="simple"/>

	</s:form>
</body>
</html>