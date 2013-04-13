<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>

<head>

<link rel="stylesheet" type="text/css"
	href="ViewResources/html5sticky/assets/css/html5sticky.css" />
<link href='http://fonts.googleapis.com/css?family=Architects+Daughter'
	rel='stylesheet' />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>

<script src="ViewResources/html5sticky/assets/js/respond.min.js"></script>
<script
	src="ViewResources/html5sticky/assets/js/modernizr.custom.23610.js"></script>
<script src="ViewResources/html5sticky/assets/js/html5sticky.js"></script>
<script src="ViewResources/html5sticky/assets/js/prettyDate.js"></script>

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
		<div class="span8" align="center">
			<div class="well">
				<div class="row-fluid">
					<div class="text pull-left">
						<font style="font-family: Architects Daughter;font-size: 26px;"><b>Share your thoughts!</b></font>
					</div>
					<div class="pull-right">
						<a href="#" id="addnote" class="tooltips yellow-tooltip"><img
							src="ViewResources/html5sticky/assets/img/add.png"
							alt="Add a new sticky note"><span>Add a new sticky
								note</span></a>&nbsp;&nbsp; <a href="#" id="removenotes"
							class="tooltips yellow-tooltip"><img
							src="ViewResources/html5sticky/assets/img/remove.png"
							alt="Remove all sticky notes"><span>Remove all
								sticky notes</span></a>&nbsp;&nbsp; <a href="#" id="shrink"
							class="tooltips yellow-tooltip"><img
							src="ViewResources/html5sticky/assets/img/decrease.png"
							alt="Shrink"><span>Shrink sticky notes</span></a>&nbsp;&nbsp; <a
							href="#" id="expand" class="tooltips yellow-tooltip"><img
							src="ViewResources/html5sticky/assets/img/increase.png"
							alt="Expand"><span>Expand sticky notes</span></a>
					</div>
				</div>
				<!-- #head -->

				<div id="main"></div>

				<div class="clear">&nbsp;</div>
				<div class="clear">&nbsp;</div>
			</div>
		</div>
	</div>

</body>
</html>