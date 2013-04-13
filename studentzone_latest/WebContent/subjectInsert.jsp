<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
	<s:form action="insertSubject" method="post">
		<table class="table table-bordered table-hover">
			<tr>
				<td>Enter Subject Name</td>
				<td><s:textfield name="subjectName" theme="simple"
						placeholder="Please enter Subject Name" cssClass="input-xlarge" /></td>
			</tr>

			<tr>
				<td>Enter Subject Code</td>
				<td><s:textfield name="subjectCode" theme="simple"
						placeholder="Please enter Subject Code" cssClass="input-xlarge" /></td>
			</tr>
			<tr>
				<td>Select Subject Semester</td>
				<td>
					<div class="input-prepend">
						<span class="add-on"> <i class="icon-book"
							style="color: black;"> </i>
						</span>
						<s:select name="Semester" list="semesterList" headerKey="-1"
							id="semester" headerValue="Choose Semester" theme="simple"
							cssClass="chzn-select" title="Choose Semester"
							style="width:260px" />
					</div>
				</td>

			</tr>

		</table>
		<s:submit name="commandButton" id="mysubmit" value="Insert Details"
			cssClass="btn btn-primary" theme="simple" />

	</s:form>
</body>
</html>