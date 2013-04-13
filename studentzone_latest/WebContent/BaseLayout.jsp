<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><tiles:insertAttribute name="title" ignore="true" /></title>

<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Cookie" />
<link rel="stylesheet"
	href="ViewResources/jQuery/css/smoothness/jquery-ui-1.9.2.custom.css" />
<script src="ViewResources/jQuery/js/jquery-1.8.3.js"></script>
<script src="ViewResources/jQuery/js/jquery-ui-1.9.2.custom.js"></script>
<script src="ViewResources/js/bootstrap.js"></script>
<link href="ViewResources/css/bootstrapcosmo.css" rel="stylesheet">
<link href="ViewResources/css/font-awesome.css" rel="stylesheet">

<style>
@font-face {
  font-family: 'Cookie';
  font-style: normal;
  font-weight: 400;
  src: local('Cookie-Regular'), url(ViewResources/font/Tvkve1y-JrkMx2S9u2OW1g.woff) format('woff');
}
</style>
<style>
#ticker01 {
	height: 40px;
	overflow: hidden;
}
#ticker01 li {
	height: 40px;
}
#ticker02 {
	height: 40px;
	overflow: hidden;
}
#ticker02 li {
	height: 40px;
}
</style>

</head>
<tiles:insertAttribute name="header" />
<body>
<div class="container-fluid" style="height:500px;">
<tiles:insertAttribute name="body" />
</div>
<tiles:insertAttribute name="footer" />
<script>
function tick(){
	$('#ticker01 li:first').animate({'opacity':0}, 200, function () { $(this).appendTo($('#ticker01')).css('opacity', 1); });
}
setInterval(function(){ tick () }, 4000)
function tick2(){
	$('#ticker02 li:first').animate({'opacity':0}, 200, function () { $(this).appendTo($('#ticker02')).css('opacity', 1); });
}
setInterval(function(){ tick2 () }, 4000)
</script>
</body>
</html>