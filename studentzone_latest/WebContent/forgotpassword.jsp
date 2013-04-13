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
					<img src="ViewResources/sliderimgs/img1.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img2.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img3.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img4.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img5.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img6.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img7.jpg" alt="" /> <img
						src="ViewResources/sliderimgs/img8.jpg" alt="" />
				</div>
			</div>
		</div>
		<div class="span4">
			<div class="well">
				<form class="form-signin" action="confirmEmail">
					<h4 class="form-signin-heading">
						<b>Forgot Password</b>
					</h4>
					<br /> 
					
					<div class="input-prepend">
						<span class="add-on"><i class="icon-envelope-alt"
							style="color: black;"></i></span> <input type="text" class="input-xlarge"
						placeholder="Enter your E-mail address" name="emailID">
					</div>	
					<br />
					<br />


					<s:if test="hasActionErrors()">

						<s:iterator value="actionErrors">
							<div class="alert alert-warning">
								<button type="button" class="close" data-dismiss="alert">&times;</button>
								<s:property />
							</div>
						</s:iterator>
					</s:if>
					<s:if test="hasActionMessages()">
						<div class="alert alert-success">
							<button type="button" class="close" data-dismiss="alert">&times;</button>
							<h6>
								<s:actionmessage />
							</h6>
						</div>
					</s:if>

					<button class="btn btn-primary" type="submit">
						<i class="icon-ok icon-white"></i> Confirm
					</button>
				</form>
			</div>
		</div>
	</div>