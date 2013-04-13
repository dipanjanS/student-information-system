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

	function getFacultyID() {
		var element = document.getElementById("fid");
		var content = element.options[element.selectedIndex].value;
		
		callActionClass(content);
	}

	function callActionClass(content) {
			window.location = "facultySubj?content=" + content;
	}

	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
</script>
</head>
<body>
	<s:form action="subjFaculty" method="mapFacultySubj">
		<s:select name="faculties" id="fid" headerKey="-1"
			headerValue="Faculty" list="facultyList" listKey="facultyID"
			listValue="facultyName" onchange="getFacultyID()" value="%{content}"
			cssClass="chzn-select" style="width:300px" />
		<br /><br/>
		<s:checkboxlist name="subjects" list="subjectList" listKey="subjectId"
			listValue="subjectName" value="mappedSubjList" theme="simple"/>
		<br/>
		<s:submit value="Assign Subjects to Faculty" name="assign"
			theme="simple" cssClass="btn btn-primary" />
	</s:form>
</body>
</html>