<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />

<script>
	$(function() {
		$("#datepicker").datepicker({
			dateFormat : "yy-mm-dd"
		});
	});

	function clearFields() {
		//alert("coming");
		var title = document.getElementById("heading").value;
		//alert(title);
		if (title != "")
			;
		{
			document.getElementById("heading").value = "";
			document.getElementById("content").value = "";
		}
	}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body onload="clearFields()">

	<s:form action="insertNews" method="post" enctype="multipart/form-data">
		<table class="table table-bordered table-hover">
			<tr>
				<td>Title</td>
				<td><s:textfield name="heading" theme="simple"
						placeholder="Title" cssClass="input-xlarge" id="heading" /></td>
			</tr>
			<tr>
				<td>Content</td>
				<td><s:textarea name="content" theme="simple"
						placeholder="Content" cssClass="input-xlarge" cols="40" rows="7"
						cssStyle="resize : none;" id="content" /></td>
			</tr>
			<tr>
				<td>Validity</td>
				<td><input type="text" theme="simple" id="datepicker"
					name="validity" class="input-xlarge" /></td>
			</tr>
		</table>
		<s:submit name="commandButton" id="mysubmit" value="Insert News"
			cssClass="btn btn-primary" theme="simple" />

	</s:form>
</body>
</html>