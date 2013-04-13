<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head>

<script type="text/javascript">
	function checkFriend() {
		/*
		 * If already a friend then 
		 * do not show "Add as a friend" but "Unfriend"
		 * and if not a friend then " Add as a friend" 
		 */
		document.getElementById("isFriend").disabled = true;
		document.getElementById("isEnemy").disabled = true;
		var cf = document.getElementById("hiddenFriend").value;
		var ce = document.getElementById("hiddenEnemy").value;
		//alert(document.getElementById("userID").value);
		var logId = document.getElementById("userID").value;
		var searchId = document.getElementById("hiddenFrdId").value;

		if (logId == searchId) {
			document.getElementById("Add").style.display = 'none';
			document.getElementById("Delete").style.display = 'none';
			document.getElementById("AddEnemy").style.display = 'none';
			document.getElementById("Unblock").style.display = 'none';
		} else {
			if (cf == 'true') {
				document.getElementById("isFriend").checked = true;
				document.getElementById("Add").style.display = 'none';
				document.getElementById("Delete").style.display = 'block';
				document.getElementById("AddEnemy").style.display = 'none';
				document.getElementById("Unblock").style.display = 'none';
			} else if (cf == "false") {
				document.getElementById("isFriend").checked = false;
				document.getElementById("Add").style.display = 'block';
				document.getElementById("Delete").style.display = 'none';
				document.getElementById("AddEnemy").style.display = 'block';
				document.getElementById("Unblock").style.display = 'none';
			}
			if (ce == "true") {
				document.getElementById("isEnemy").checked = true;
				document.getElementById("Add").style.display = 'none';
				document.getElementById("Delete").style.display = 'none';
				document.getElementById("AddEnemy").style.display = 'none';
				document.getElementById("Unblock").style.display = 'block';
			} else if (ce == "false") {
				document.getElementById("isFriend").checked = false;
				document.getElementById("Add").style.display = 'block';
				document.getElementById("Delete").style.display = 'none';
				document.getElementById("AddEnemy").style.display = 'block';
				document.getElementById("Unblock").style.display = 'none';
			}
		}

	}
</script>
</head>
<body onload="checkFriend()"
	style="background-image: url(ViewResources/img/paperfiber.png);">
	<br />
	<br />
	<div class="row-fluid">
		<div class="span4" align="center">
			<div class="">
				<img src="<s:property value='mf.friendImg'/>" class="img-polaroid"
					style="width: 350px; height: 350px" />
			</div>
		</div>
		<div class="span4">
			<table cellpadding="15">
				<tr>
					<td><input type="hidden" name="hiddenFriend" id="hiddenFriend"
						value="<s:property value='mf.isFriend'/>" />
						Friend&nbsp;&nbsp;&nbsp;<input type="checkbox" label="Friend"
						id="isFriend" style="margin-bottom: 5px;" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="hiddenEnemy" id="hiddenEnemy"
						value="<s:property value='me.isFriend'/>" />
						Enemy&nbsp;&nbsp;&nbsp;<input type="checkbox" label="Enemy"
						id="isEnemy" style="margin-bottom: 5px;" /></td>
				</tr>
				<tr>
					<td><input type="hidden" name="hiddenUId" id="userID"
						value="<s:property value="#session['studentID']" />" /> <input
						type="hidden" name="hiddenFrdId" id="hiddenFrdId"
						value="<s:property value="mf.friendId" />" /></td>
				</tr>
				<tr>
					<td>Name</td>
					<td><b><s:property value="mf.friendName" /></b></td>
				</tr>
				<tr>
					<td>Roll Number</td>
					<td><b><s:property value="mf.friendRollNo" /></b></td>
				</tr>
				<tr>
					<td>DOB</td>
					<td><b><s:property value="mf.friendDOB" /></b></td>
				</tr>
			</table>
			<br /> <br />

		</div>
		<div class="span4">
			<s:form method="post" action="friendAction">
				<table cellpadding="5">
					<tr>
						<td><s:hidden name="friendID" key="friendID"
								value='%{mf.friendId}'></s:hidden></td>
						<td><s:submit name="buttonName" cssClass="btn btn-success"
								value="Add as Friend" id="Add" /> <s:submit name="buttonName"
								cssClass="btn btn-danger" value="Unfriend" id="Delete" /></td>
					</tr>
					<tr>
						<td></td>
						<td><s:submit name="buttonName" cssClass="btn btn-success"
								value="Add as Enemy" id="AddEnemy" /> <s:submit
								name="buttonName" cssClass="btn btn-danger" value="UnBlock"
								id="Unblock" /></td>
					</tr>
					<tr>
						<td>Interests</td>
						<td><textarea rows="4" cols="50" style="resize: none;"
								disabled="disabled">
  			<s:property value="mf.interest" />
							</textarea></td>
					</tr>
				</table>
			</s:form>
		</div>
	</div>
</body>
</html>
