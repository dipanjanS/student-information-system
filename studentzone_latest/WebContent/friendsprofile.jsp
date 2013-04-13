<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="s" uri="/struts-tags"%>

<html>
<head></head>

<body style="background-image: url(ViewResources/img/paperfiber.png);">
	<br />
	<br />
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
		<div class="span7">
			<div style="width: 515px;">
				<div style="height: 200px;" class="well">
					All People
					<table cellpadding="5">
						<tr>
							<s:iterator value="frList" status="frList">
								<td>
									<div>
										<table>
											<tr>
												<td><a
													href="MyFriend.action?friendID=<s:property value="stuId"/>">
														<img alt='<s:property value="name"/>'
														src='<s:property value="imageUrl"/>' width="100"
														height="100" />
												</a></td>
											</tr>
											<tr>
												<td><a
													href="MyFriend.action?friendID=<s:property value="stuId"/>"><s:property
															value="name" /></a></td>
											</tr>
											<tr>
												<td><a
													href="MyFriend.action?friendID=<s:property value="stuId"/>"><s:property
															value="rollNo" /></a></td>
											</tr>
										</table>
									</div>
								</td>
							</s:iterator>
						</tr>
					</table>
				</div>


				<%
					int templimit = Integer.parseInt(session.getAttribute("nop")
							.toString());
				%>
				<!-- "noOfPages from action here -->
				<%
					int currentPage = Integer.parseInt(session.getAttribute("cp")
							.toString());
				%>
				<!-- "currentPage" from action here -->
				<div class="pagination">
					<ul>
						<%
							if (currentPage != 1) {
						%>
						<li><a href="FriendList.action?page=<%=currentPage - 1%>">Previous</a></li>
						<%
							}
						%>
						<%
							for (int i = 1; i <= templimit; i++) {
						%>
						<%
							if (currentPage == i) {
						%>

						<%
							} else {
						%>
						<li><a href="FriendList.action?page=<%=i%>"><%=i%></a></li>
						<%
							}
						%>
						<%
							}
						%>
						<%
							if (currentPage < templimit) {
						%>
						<li><a href="FriendList.action?page=<%=currentPage + 1%>">Next</a></li>
						<%
							}
						%>
					</ul>
				</div>
				<div class="well">
					<div style="height: 200px;">
						My Friends
						<table cellpadding="5">
							<tr>
								<s:iterator value="myFrdList" status="myFrdList">
									<td>
										<div>
											<table>
												<tr>
													<td><a
														href="MyFriend.action?friendID=<s:property value="stuId"/>">
															<img alt='<s:property value="name"/>'
															src='<s:property value="imageUrl"/>' width="100"
															height="100" />
													</a></td>
												</tr>
												<tr>
													<td><a
														href="MyFriend.action?friendID=<s:property value="stuId"/>"><s:property
																value="name" /></a></td>
												</tr>
												<tr>
													<td><a
														href="MyFriend.action?friendID=<s:property value="stuId"/>"><s:property
																value="rollNo" /></a></td>
												</tr>
											</table>
										</div>
									</td>
								</s:iterator>
							</tr>
						</table>
					</div>
					<%
						int templimit1 = Integer.parseInt(session.getAttribute("frNop")
								.toString());
					%>
					<!-- "noOfPages from action here -->
					<%
						int currentPage1 = Integer.parseInt(session.getAttribute("frCp")
								.toString());
					%>
					<!-- "currentPage" from action here -->
					<div class="pagination">
						<ul>
							<%
								if (currentPage1 != 1) {
							%>
							<li><a href="FriendList.action?pageMy=<%=currentPage1 - 1%>">Previous</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= templimit1; i++) {
							%>
							<%
								if (currentPage1 == i) {
							%>

							<%
								} else {
							%>
							<li><a href="FriendList.action?pageMy=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<%
								if (currentPage1 < templimit1) {
							%>
							<li><a href="FriendList.action?pageMy=<%=currentPage1 + 1%>">Next</a></li>
							<% } %>
						</ul>
					</div>
				</div>

				<div class="well">
					<div style="height: 200px;">
						My Enemies
						<table cellpadding="5">
							<tr>
								<s:iterator value="myEnemyList" status="myEnemyList">
									<td>
										<div>
											<table>
												<tr>
													<td><a
														href="MyFriend.action?friendID=<s:property value="stuId"/>">
															<img alt='<s:property value="name"/>'
															src='<s:property value="imageUrl"/>' width="100"
															height="100" />
													</a></td>
												</tr>
												<tr>
													<td><a
														href="MyFriend.action?friendID=<s:property value="stuId"/>"><s:property
																value="name" /></a></td>
												</tr>
												<tr>
													<td><a
														href="MyFriend.action?friendID=<s:property value="stuId"/>"><s:property
																value="rollNo" /></a></td>
												</tr>
											</table>
										</div>
									</td>
								</s:iterator>
							</tr>
						</table>
					</div>
					<%
						int templimit2 = Integer.parseInt(session.getAttribute("enNop")
								.toString());
					%>
					<!-- "noOfPages from action here -->
					<%
						int currentPage2 = Integer.parseInt(session.getAttribute("enCp")
								.toString());
					%>
					<!-- "currentPage" from action here -->
					<div class="pagination">
						<ul>
							<%
								if (currentPage2 != 1) {
							%>
							<li><a href="FriendList.action?enemyPageMy=<%=currentPage2 - 1%>">Previous</a></li>
							<%
								}
							%>
							<%
								for (int i = 1; i <= templimit2; i++) {
							%>
							<%
								if (currentPage2 == i) {
							%>

							<%
								} else {
							%>
							<li><a href="FriendList.action?enemyPageMy=<%=i%>"><%=i%></a></li>
							<%
								}
							%>
							<%
								}
							%>
							<%
								if (currentPage2 < templimit2) {
							%>
							<li><a href="FriendList.action?enemyPageMy=<%=currentPage2 + 1%>">Next</a></li>
							<% } %>
						</ul>
					</div>
				</div>


			</div>
		</div>
</body>
</html>