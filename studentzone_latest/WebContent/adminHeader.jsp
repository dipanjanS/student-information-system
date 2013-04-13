<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<head>
<script>
</script>

</head>
<body>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">

			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>

			<!-- Be sure to leave the brand out there if you want it shown -->
			<a class="brand" href="adminHomePage">Student Zone</a>
			<ul class="nav">
				<li id="li_home"><a href="adminHomePage">Home</a></li>
				<li id="li_users" class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Manage Users <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="newStudentRegistration">Add Student</a></li>
						<li><a href="deleteStudent">Delete Student</a></li>
					</ul></li>
				<li id="li_grades"><a href="loadGrades">Update Grades</a></li>
				<li id="li_subjects"><a href="insertSubject">Manage Subjects</a></li>
				<li id="li_enroll"><a href="insertEnrollment">Manage Enrollments</a></li>
				<li id="li_syllabus"><a href="addSyllabus">Manage Syllabus</a></li>
				<li id="li_faculty" class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Manage Faculty<b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="facultyForm">Add New Faculty</a></li>
						<li><a href="facultySubj">Assign faculty to subject</a></li>
						<li><a href="callFacultyDelete">Delete Faculty</a></li>
					</ul></li>
				<li id="li_events" class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Events <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="addNews">Manage News</a></li>
						<li><a href="addAnnouncement">Add Announcement</a></li>
						<li><a href="deleteAnnouncement">Delete Announcement</a></li>
					</ul></li>
				<li><a href="adminLogout">Logout</a></li>

			</ul>

		</div>
	</div>
</div>
</body>