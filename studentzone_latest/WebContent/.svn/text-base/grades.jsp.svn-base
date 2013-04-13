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
<script>
	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
</script>

<style>
#subjID {
	width: 300px;
	margin-top: -62px;
	margin-left: 360px;
}

#semID {
	width: 300px;
	margin-top: 47px;
}
</style>
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
			<div class="well">
				<s:form action="grades" method="calcGrade">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<s:doubleselect list="subjPerSem.keySet()"
						doubleList="subjPerSem.get(top)" doubleListKey="subjectName"
						doubleListValue="subjectName" name="semName" doubleName="subjName"
						id="semID" doubleId="subjID" headerKey="0" doubleHeaderKey="0" />
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<s:submit value="Search" name="search" theme="simple"
						cssClass="btn btn-primary" style="margin-top:-74px;" />
				</s:form>
			</div>

			<s:set name="checkContent" value="%{check}" />
			<s:if test="%{#checkContent==0}">
				<table class="table table-bordered table-hover">
					<tr>
						<th style="text-align: center">SUBJECT</th>
						<th style="text-align: center">SUBJECT CODE</th>
						<th style="text-align: center">GRADE</th>
						<th style="text-align: center">RESULT</th>
					</tr>
					<tr>
						<td style="text-align: center"><s:property
								value="%{grade.subjectName}" />
						</td>
						<td style="text-align: center"><a
							href="syllabus?subjectCode=<s:property
									value="%{grade.subjectCode}" />"><s:property
									value="%{grade.subjectCode}" />
						</a>
						</td>
						<td style="text-align: center"><s:property
								value="%{grade.subjectGrade}" />
						</td>
						<td style="text-align: center"><s:property
								value="%{grade.subjectResult}" />
						</td>
					</tr>
				</table>
			</s:if>
			<s:elseif test="%{#checkContent==1}">
				<table class="table table-bordered table-striped table-hover">
					<tr>
						<th style="text-align: center; font-size: 18px">Semester</th>
						<th style="text-align: center; font-size: 18px">SGPA</th>
					</tr>
					<s:iterator value="sgpaList" status="semCount">
						<tr>
							<td style="text-align: center">Semester <s:property
									value="#semCount.count" />
							</td>
							<td style="text-align: center"><s:property />
							</td>
						</tr>
					</s:iterator>
					<tr>
						<td style="text-align: center; font-weight: bold; font-size: 24px">CGPA</td>
						<td style="text-align: center; font-weight: bold; font-size: 24px"><s:property
								value="%{cgpa}" />
					</tr>
				</table>

			</s:elseif>
		</div>
	</div>
</body>
</html>