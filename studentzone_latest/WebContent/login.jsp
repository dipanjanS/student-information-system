<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>
<link rel="stylesheet"
	href="ViewResources/jQuery/css/smoothness/jquery-ui-1.9.2.custom.css" />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>
<script src="ViewResources/jQuery/js/jquery-ui-1.9.2.custom.js"></script>
<script src="ViewResources/fluxslider/js/flux.js"></script>

<script>
$(function() {
	if (!flux.browser.supportsTransitions)
		alert("Flux Slider requires a browser that supports CSS3 transitions");

	window.f = new flux.slider('#slider', {
		pagination : false,
		controls : true
	});
});
</script>
</head>

<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br />
	<br />
	<div class="row-fluid">
		<div class="span8">
			<div class="well well-large">
				<div id="slider" align="center">
					<img src="ViewResources/sliderimgs/img1.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img2.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img3.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img4.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img5.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img6.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img7.jpg" alt=""/>
					<img src="ViewResources/sliderimgs/img8.jpg" alt=""/> 
				</div>
			</div>
		</div>
		<div class="span4">
			<!-- login form start-->
			<div class="well" align="center">
				<img src="ViewResources/img/logo.jpg" width="420" height="100" class="img-polaroid"/>
				<s:form action="dologin.action" class="form-signin">
					<h3 class="form-signin-heading">Student Login</h3>
					<br />
					<div class="input-prepend">
						<span class="add-on"><i class="icon-user"
							style="color: black;"></i></span> <input type="text" name="username"
							class="input-xlarge" placeholder="User Name">
					</div>
					<br />
					<br />
					<div class="input-prepend">
						<span class="add-on"><i class="icon-unlock"
							style="color: black;"></i></span> <input type="password" name="password"
							class="input-xlarge" placeholder="Password">
					</div>
					<s:if test="hasActionErrors()">
						<br />
						<s:iterator value="actionErrors">
							<div class="alert alert-warning">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<s:property />
							</div>
						</s:iterator>
					</s:if>
					<br />
					<s:submit cssClass="btn btn-primary" value="Sign in" />&nbsp;&nbsp;&nbsp;
				<a href="forgotPassword.action" class="btn btn-default">Forgot Password</a>
				</s:form>
			</div>
			<!-- login form end-->
		</div>
	</div>
</body>
</html>