<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>

<head>
</head>

<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br />
	<br />
	<div class="row-fluid">
		<div class="span4" align="center">
			<div class="well">
				Hello <b><s:property value="#session['userName']" /></b>!<br /> <br />
				<img src="<s:property value="#session['studentImgUrl']" />"
					class="img-polaroid" /> <br /> <br /> <b>Last Logged on: </b>
				<s:property value="#session['lastAccess']" />
			</div>
		</div>
		<div class="span8">
			<s:iterator value="fullnews">
				<h5>
					<s:property value="heading" />
				</h5>
				<p>
					<s:property value="content" />
				</p>
			</s:iterator>
		</div>
	</div>

</body>
</html>