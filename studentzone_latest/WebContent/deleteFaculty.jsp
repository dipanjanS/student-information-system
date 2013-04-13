<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>

<script type="text/javascript">
	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
</script>
</head>
<body>
	<s:form action="delFaculty" method="deleteFaculty">
		<s:select name="faculties" headerKey="-1" headerValue="Faculty"
			list="facultyList" listKey="facultyID" listValue="facultyName"
			cssClass="chzn-select" style="width:350px"/>
		&nbsp;&nbsp;&nbsp;
		<s:submit value="Delete Faculty" theme="simple"
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