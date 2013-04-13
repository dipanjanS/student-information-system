<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="ViewResources/chosenselect/chosen.css" />
<script src="ViewResources/chosenselect/chosen.jquery.js"></script>
<script type="text/javascript">
	function getSelectedAnnouncement() {
		var element = document.getElementById("announcement");
		var announcementTitle = element.options[element.selectedIndex].text;

		callActionClass(announcementTitle);
	}

	function callActionClass(announcementTitle) {
			window.location = "deleteAnnouncementFromDatabase?announcementTitle=" + announcementTitle;
	}
	
	$(function() {
		$('.chzn-select').chosen();
		$('.chzn-select-deselect').chosen({
			allow_single_deselect : true
		});
	});
	</script>
<title>Insert title here</title>
</head>
<body>
	<s:select name="announcement" list="allAnnouncements" id="announcement"
		headerKey="0" headerValue="Select Announcement to be  deleted" theme="simple"
		cssClass="chzn-select" style="width:350px"
		onChange="getSelectedAnnouncement()" />
</body>
</html>