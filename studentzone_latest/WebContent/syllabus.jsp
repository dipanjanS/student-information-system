<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<style>
div.scroll {
	width: 600px;
	height: 300px;
	overflow-y: scroll;
}

.preformatted {
    font-family: monospace;
    white-space: pre-wrap;
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
			<br />
			<s:iterator value="syllabusList">
				<div>
					<h3>
						<s:property value="subjectName" />
						Syllabus
					</h3>

				</div>
				<br />
				<div class="scroll">
					<div class="preformatted">
					<s:property value="subjectSyllabus" />
					</div>
					
				</div>
			</s:iterator>
		</div>
	</div>

	<br />
	<br />
</body>
</html>