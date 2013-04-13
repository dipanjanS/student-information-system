<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>
<style>
div.scroll {
	width: 600px;
	/* height: 200px; */
	overflow-y: scroll;
}
</style>

<script>
	/* Function to get the semester chosen in drop down list */
	function onSemesterSelect() {
		var element = document.getElementById("semester");

		if (element.selectedIndex == -1) {
			element.value = -1;
		}
		var selectedSem = element.options[element.selectedIndex].text;

		callActionClass(selectedSem);
	}

	function callActionClass(selectedSem) {
		window.location = "enroll?semester=" + selectedSem;
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

		<div class="span7 offset1">
			<!-- drop down list for 'choose semester' -->
			<div class="input-prepend">
				<span class="add-on"> <i class="icon-book"
					style="color: black;"> </i>
				</span>
				<s:select name="Semester" list="semesterList" headerKey="-1"
					id="semester" onChange="onSemesterSelect()"
					headerValue="Choose Semester" theme="simple" cssClass="chzn-select"
					title="Choose Semester" style="width:350px" />
			</div>
			<br /> <br />

			<s:form action="enrollStudent">

				<!-- subjects as per selected semester -->
				<div class="scroll">
					<table class="table table-striped">
						<tr>
							<th>Select</th>
							<th>Subject Code</th>
							<th>Subject Name</th>
						</tr>
						<!-- Showing the subjects student can still enroll into  -->
						<s:iterator value="coursesToEnrollList" status="rowstatus">
							<tr>
								<td><s:checkbox name="checkCourse"
										fieldValue="%{enrollmentID}"
										value="%{enrollmentID in checkCourse}" /></td>
								<td><s:property value="subjectCode" /></td>
								<td><s:property value="subjectName" /></td>
							</tr>
						</s:iterator>

						<!-- Showing the subjects student has already enrolled into -->
						<s:iterator value="coursesEnrolledList" status="rowstatus">
							<tr>
								<!-- check box is automatically disabled and checked -->
								<td><s:checkbox name="checkEnrolledCourse" disabled="true"
										value="true" /></td>
								<td><s:property value="subjectCode" /></td>
								<td><s:property value="subjectName" /></td>
							</tr>
						</s:iterator>
					</table>
				</div>
				<br />
				<br />
				<s:if test="hasActionErrors()">
						<br />
						<s:iterator value="actionErrors">
							<div class="alert alert-warning">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<s:property />
							</div>
						</s:iterator>
					</s:if>
				<!-- 'Submit' button -->
				<s:submit cssClass="btn btn-primary" value="Enroll" align="left" />
			</s:form>
		</div>
	</div>

	<br />
	<br />
</body>
</html>