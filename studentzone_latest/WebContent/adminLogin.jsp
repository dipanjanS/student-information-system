<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Administrator Login Page</title>
<link href="ViewResources/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link rel="stylesheet"
	href="ViewResources/jQuery/css/smoothness/jquery-ui-1.9.2.custom.css" />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>
<script src="ViewResources/jQuery/js/jquery-ui-1.9.2.custom.js"></script>
<script src="ViewResources/js/bootstrap.js"></script>
<link href="ViewResources/css/bootstrap.css" rel="stylesheet">
<link href="ViewResources/css/font-awesome.css" rel="stylesheet">
</head>


<body>
	<div class="container-fluid">
		<div class="row-fluid">
			<div class="span6 offset3">
				<br />
				<div class="well pagination-centered">
					<h1 style="font-family: 'Keania One', cursive">Welcome,
						Administrator</h1>
					<br /> <br /> <br /> <br /> <br />
					<div class="badge badge-info">
						<s:form action="adminLogin" method="post">
							<br />
							<div class="input-prepend">
								<span class="add-on"><i class="icon-user"
									style="color: black;"></i></span>
								<s:textfield name="username" id="myinput1" theme="simple"
									placeholder="Please enter username" />
							</div>
							<br />
							<div class="input-prepend">
								<span class="add-on"><i class="icon-key"
									style="color: black;"></i></span>
								<s:password name="password" id="myinput2" theme="simple"
									placeholder="Please enter password" />
							</div>
							<br />
							<s:submit name="commandButton" id="mysubmit" value="LOGIN"
								cssClass="btn btn-inverse" theme="simple" />
							<br />
						</s:form>
					</div>
					<br /> <br />
					<s:if test="hasActionErrors()">
						<s:iterator value="actionErrors">
							<span class="label label-important"> <br /> <s:property />
								<br />
							<br />
							</span>
						</s:iterator>
					</s:if>
				</div>
			</div>

		</div>


	</div>
</body>

</html>