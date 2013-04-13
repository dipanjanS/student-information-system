<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div class="row-fluid">

	<s:if test="#session['login']!=null">
		<div class="span1"></div>
		<!-- NEWS starts here-->
		<div class="span5 well">
			<center>
				<span><b>NEWS</b></span>
			</center>
			<ul id="ticker01">
				<s:iterator value="%{#session.news}">
					<li><a href="NEWS.action?NEWSID=<s:property value="NEWSID"/>">
							<s:property value='heading' />
					</a></li>
				</s:iterator>
			</ul>
		</div>
		<!-- NEWS ends here -->

		<!-- Announcements starts here  -->
		<div class="span5 well" >
			<center>
				<span><b>Announcements</b></span>
			</center>
			<ul id="ticker02">
				<s:iterator value="%{#session.announcement}">
					<li><a
						href="Announcement.action?announcementID=<s:property value="announcementID"/>">
							<s:property value='heading' />
					</a></li>
				</s:iterator>
			</ul>
		</div>
		<!-- Announcements ends here -->
	</s:if>
	<div class="span1"></div>
</div>
<center>
	<div id="footer">
		<div class="container">
			<p>Copyright &copy; studentzone</p>
			<p class="muted credit">
				CSS by <a href="http://twitter.github.com/bootstrap">Twitter
					Bootstrap</a> and icons by <a href="http://fortawesome.github.com/Font-Awesome/">Font Awesome</a>.
			</p>
		</div>
	</div>
</center>