<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>
<script type="text/javascript">
	function getSelectedStudent() {
		var element = document.getElementById("studentRoll");
		var content = element.options[element.selectedIndex].text;

		callActionClass(content);
	}

	function callActionClass(content) {
			window.location = "deleteStudentFromDatabase?content=" + content;
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
<body>
	<s:select name="rollNumber" list="allRoll" id="studentRoll"
		headerKey="0" headerValue="Select Roll Number" theme="simple"
		cssClass="chzn-select" style="width:350px"
		onChange="getSelectedStudent()" />
</body>
</html>