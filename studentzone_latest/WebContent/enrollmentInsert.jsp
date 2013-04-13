<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>
<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd",
		    changeMonth: true,
			changeYear: true
			
		});
	});
	
	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
</script>
</head>
<body>
	<s:form action="insertEnrollment" method="post">
		<table class="table table-bordered table-hover">

			<tr>
				<td>Select Enrollment Semester</td>
				<td>
					<div class="input-prepend">
						<span class="add-on"> <i class="icon-book"
							style="color: black;"> </i>
						</span>
						<s:select name="Semester" list="semesterList" headerKey="-1"
							headerValue="Choose Semester" theme="simple"
							cssClass="chzn-select" title="Choose Semester"
							style="width:260px" />
					</div>
				</td>

			</tr>

			<tr>
				<td>Enter Subject ID</td>
				<td><s:textfield name="subjectID" theme="simple"
						placeholder="Please enter Subject ID" cssClass="input-xlarge" /></td>
			</tr>

			<tr>
				<td style='vertical-align: middle;'>Deadline Date:</td>
				<td style='vertical-align: middle;'>

					<div class="input-append date">
						<input class="span2" size="16" type="text" name="deadlineDate" id="datepicker"
							readonly> <span class="add-on"><i
							class="icon-calendar"></i></span>
					</div>
				</td>
			</tr>

			<tr>
				<td>Select Deadline Time</td>
				<td>
					<div class="input-prepend">
						<span class="add-on"> <i class="icon-time"
							style="color: black;"> </i>
						</span>

						<s:select name="hour" list="hourList" headerKey="-1"
							headerValue="HH" theme="simple" cssClass="chzn-select"
							style="width:60px" />

						<s:select name="minute" list="minuteList" headerKey="-1"
							headerValue="mm" theme="simple" cssClass="chzn-select"
							style="width:60px" />
					</div>
				</td>

			</tr>

		</table>
		<s:submit name="commandButton" id="mysubmit" value="Insert Details"
			cssClass="btn btn-primary" theme="simple" />

	</s:form>

</body>
</html>