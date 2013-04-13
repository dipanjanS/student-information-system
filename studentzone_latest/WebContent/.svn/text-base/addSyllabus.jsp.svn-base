<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>
<script>

function getSyllabus()
{	
	/* To get the syllabus for the subject
	 * on userchange 
	*/
	
	
	var subId = document.getElementById("subjectId");
	var subVal = subId.options[subId.selectedIndex].value;
	//alert(subVal);	
	changeAction();
	window.location = "getSyllabus?subjectList=" + subVal;
}

function changeAction()
{
	/*
	* Change the button name for the syllabus
	* If syllabus is already there then 
	* button should be "edit syllabus"
	* else it should be "Insert Syllabus"
	*/
	var sylId = document.getElementById("syllabusId");
	var sylName = sylId.value;
	if(sylName != 0)
		document.getElementById("mysubmit").value = "Edit Syllabus";
}

$(function() {
	$('.chzn-select').chosen();
	$('.chzn-select-deselect').chosen({
		allow_single_deselect : true
	});
});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body onload="changeAction()">
	<div>
		<s:form action="insertSyllabus" method="post"
			enctype="multipart/form-data">
			<table class="table table-bordered table-hover">
				<tr>
					<td>Select Subject</td>
					<td><s:select list="showSubject" listKey="subjectId"
							listValue="subjectName" name="subjectList"
							onchange="getSyllabus()" id="subjectId" cssClass="chzn-select" style="width: 280px"></s:select></td>
				</tr>
				<tr>
					<td>Syllabus</td>
					<td><s:textarea name="syllabus" theme="simple"
							placeholder="Syllabus" cssClass="input-xlarge" cols="40" rows="7"
							 value="%{sl.subjectSyllabus}" /> <s:hidden
							name="syllabusId" value="%{sl.syllabusID}" id="syllabusId"></s:hidden>
					</td>
				</tr>
			</table>
			<s:submit name="commandButton" id="mysubmit" value="Insert Syllabus"
				cssClass="btn btn-primary" theme="simple" />

		</s:form>
	</div>
</body>
</html>