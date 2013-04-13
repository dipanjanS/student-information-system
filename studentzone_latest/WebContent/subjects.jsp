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
	function getSelectedText() {
		var element = document.getElementById("findSubject");
		var content = element.options[element.selectedIndex].text;

		callActionClass(content);
	}

	function callActionClass(content) {
			window.location = "subjects?content=" + content;
	}

	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
</script>
</head>
<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br />
	<br />
	<div class="row-fluid">
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
			<s:select theme="simple" id="findSubject" name="subject"
				headerKey="-1" onChange="getSelectedText()" headerValue="%{content}"
				value="%{content}" list="contentList" cssClass="chzn-select"
				style="width:300px" />
			<br /> <br />
			<table class="table table-bordered table-striped table-hover">
				<tr>
					<th style="text-align: center">SUBJECT CODE</th>
					<th style="text-align: center">SUBJECT</th>
					<th style="text-align: center">FACULTY NAME</th>
					<th style="text-align: center">SEMESTER</th>
					<th style="text-align: center">ENROLLED</th>
					<th style="text-align: center">GRADE</th>
				</tr>
				<s:iterator value="subjectList">
					<tr>
						<td style="text-align: center"><a
							href="syllabus?subjectCode=<s:property
									value="%{subjectCode}" />"><s:property
									value="%{subjectCode}" /> </a></td>
						<td style="text-align: center"><s:property
								value="%{subjectName}" /></td>
						<td style="text-align: center"><s:property
								value="%{facultyName}" /></td>
						<td style="text-align: center"><s:property
								value="%{semester}" /></td>
						<td style="text-align: center"><s:property
								value="%{enrolled}" /></td>
						<td style="text-align: center"><s:property
								value="%{subjectGrade}" /></td>
					</tr>
				</s:iterator>
			</table>

		</div>
	</div>
</body>
</html>