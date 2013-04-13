<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<link rel="stylesheet" href="ViewResources/jQuery/css/smoothness/jquery-ui-1.9.2.custom.css" />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>
<script src="ViewResources/jQuery/js/jquery-ui-1.9.2.custom.js"></script>
<script src="ViewResources/js/bootstrap.js"></script>
<link href="ViewResources/css/bootstrap.css" rel="stylesheet">
<link href="ViewResources/css/font-awesome.css" rel="stylesheet">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<script>

function GetCurrentPageName() { 
	var PageURL = document.location.href; 
	var PageName = PageURL.substring(PageURL.lastIndexOf('/') + 1); 

	return PageName ;
}

$(document).ready(function(){	
	var CurrPage = GetCurrentPageName();
	console.log(CurrPage);
	
	switch(CurrPage){
		case 'adminHomePage':
	  		$('#li_home').addClass('active') ;
	  		break;
		case 'newStudentRegistration':
			$('#li_users').addClass('active') ;
	  		break;
		case 'deleteStudent':
			$('#li_users').addClass('active') ;
	  		break;
		case 'loadGrades':
	 		$('#li_grades').addClass('active') ;
	  		break;
		case 'insertSubject':
	 		$('#li_subjects').addClass('active') ;
	  		break;
		case 'insertEnrollment':
	 		$('#li_enroll').addClass('active') ;
	  		break;
		case 'addSyllabus':
	 		$('#li_syllabus').addClass('active') ;
	  		break;
		case 'facultyForm':
	 		$('#li_faculty').addClass('active') ;
	  		break;
		case 'facultySubj':
	 		$('#li_faculty').addClass('active') ;
	  		break;
		case 'callFacultyDelete':
	 		$('#li_faculty').addClass('active') ;
	  		break;
		case 'addNews':
	 		$('#li_events').addClass('active') ;
	  		break;
		case 'addAnnouncement':
	 		$('#li_events').addClass('active') ;
	  		break;
		case 'deleteAnnouncement':
	 		$('#li_events').addClass('active') ;
	  		break;
	  		
	}
});

</script>

</head>
<tiles:insertAttribute name="header" />
<body>
<div class="container-fluid" style="height: 550px">
<br/><br/><br/><br/><br/>
<tiles:insertAttribute name="body" />
</div>
<tiles:insertAttribute name="footer" />
</body>
</html>