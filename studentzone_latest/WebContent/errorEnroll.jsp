<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>

<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br/><br/>
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

			<!-- showing success msg -->

			<br /> <br />

			<div class="alert alert-block alert-warning">

				<h4 class="alert-heading">Error!</h4>
				<s:if test="hasActionErrors()">
						<br />
						<s:iterator value="actionErrors">
							<div class="alert alert-warning">
		<!-- 						<button type="button" class="close" data-dismiss="alert">&times;</button> -->
								<s:property />
							</div>
						</s:iterator>
					</s:if>
			</div>
		</div>
	</div>
	<br />
	<br />
</body>
</html>