<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<div class="navbar">
	<div class="navbar-inner">
		<div class="container">

			<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".nav-collapse"> <span class="icon-bar"></span> <span
				class="icon-bar"></span> <span class="icon-bar"></span>
			</a>

			<!-- Be sure to leave the brand out there if you want it shown -->
			<s:if test="#session['login']==null">
			<a class="brand" href="#"><font style="font-family: Cookie" size="6px">Student Zone</font></a>
			</s:if>
			<s:else>
			<a class="brand" href="home"><font style="font-family: Cookie" size="6px">Student Zone</font></a>
			</s:else>
					<s:if test="#session['login']!=null">
					<form action="search.action" class="navbar-form pull-left">
						<input type="text" name="rollno" placeholder="Search Friends" class="span3">
						<button type="submit" class="btn">Search</button>
					</form>
					</s:if>
					<ul class="nav pull-right">
					<s:if test="#session['login']!=null">	
					<li class="active"><a href="home"><i class="icon-home icon-2x"></i><font size="4px"> Home</font></a></li>
					<li><a href="gradesExecute"><i class="icon-file-alt icon-2x"></i><font size="4px"> Grades</font></a></li>
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown"><i class="icon-book icon-2x"></i><font size="4px"> Subjects</font><b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="subjects"> View Courses</a></li>
						<li><a href="enroll"> Enroll for Courses</a></li>
					</ul></li>
					
					<li><a href="FriendList.action"><i class="icon-group icon-2x"></i><font size="4px"> My Friends</font></a></li>

					<li><s:url id="logout" action="logout.action" /> <s:a
							href="%{logout}"><i class="icon-off icon-2x"></i><font size="4px"> Logout</font></s:a></li>
				</s:if>

				<s:else>
					<li><s:url id="login" action="login.action" /> <s:a
							href="%{login}"><font size="4px"> Login</font></s:a></li>
				</s:else>
			</ul>


			<!-- Everything you want hidden at 940px or less, place within here -->
			<div class="nav-collapse collapse">
				<!-- .nav, .navbar-search, .navbar-form, etc -->
			</div>

		</div>
	</div>
</div>