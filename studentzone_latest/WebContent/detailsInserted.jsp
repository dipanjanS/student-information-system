<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@ taglib prefix="s" uri="/struts-tags"%>
<head>
<script type="text/javascript">
jQuery(document).ready(function($) {
    $('#myModal').modal({
    	'show':true,
    	'backdrop'  : 'static'
    
    });
    
});

  </script>


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Success</title>
</head>
<body>
	<div class="container-fluid" id="panel"
		style="background-image: url(siteimages/bodypattern.png); width: 1300px; height: 600px">
		<br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
		<br /> <br /> <br /> <br /> <br /> <br /> <br />
		<div align="center">
			<font style="font-size: 35px; color: red;">Successful Registration</font>
		</div>

		<form name="myForm">
			<div id="myModal" class="modal hide fade" class="span9">
				<div class="modal-header">

					<h3 id="myModalLabel">
						User <s:property value="userName" /> registered.
					</h3>
				</div>

				<div style="padding-left: 20px; padding-right: 10px">
					<br />
					<b>Student details are successfully inserted !
					</b> <br />
					<br />

				</div>

				<div class="modal-footer">
					<div align="center">
						
						<div class="span2">
						<a href="adminHomePage" class="btn btn-primary">Return to Home</a>
						</div>
					</div>
				</div>
			</div>

		</form>
	</div>

</body>
</html>