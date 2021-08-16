<%@page import="org.springframework.data.domain.Page"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.main.model.Contact"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.setDateHeader("Expires", 0);
String iv = "3ad5485e60a4fecde36fa49ff63817dc";
%>
<head>
<meta charset="UTF-8">
<title>${pageName}</title>
<%@include file="cdn.jsp"%>
<style type="text/css">
.vl {
	border-left: 2px solid #b7b7b7;
	height: 300px;
	margin-left: 98px;
	margin-top: 95px;
}
</style>

</head>
<body>
	<header>
		<div class="top-bar_sub_w3layouts container-fluid">
			<div class="row">
				<div class="col-md-12 logo text-left" style="z-index: 99999;">

					<a class="navbar-brand" href="">
						<h2>Hi ${username}, Contacts</h2>

					</a>

				</div>

			</div>
		</div>
	</header>
	<div>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
					<%@include file="sidebar.jsp"%>
				</div>
				<div class="col-md-8">
					<h1>Contacts</h1>
					<div class="row">

						<div class="col-md-12">
							<center>
								<h2>Recently Added</h2>
							</center>
							<div class="row">
								<%
								List<Contact> recentContacts = (List) request.getAttribute("recentContacts");
								for (int i = 0; i < recentContacts.size(); i++) {
									Contact contact = recentContacts.get(i);
								%>
								<div class="card"
									style="width: 12rem; border-radius: 2.25rem !important;">
									<div class="card-body">
										<h5 class="card-title"><%=contact.getName()%></h5>
										<h6 class="card-subtitle mb-2 text-muted"><%=contact.getPhoneNumber()%></h6>
										<p class="card-text"><%=contact.getDescription()%></p>
										<a href="#" class="card-link">Delete</a>

									</div>
								</div>
								<%
								}
								%>
								<div></div>

							</div>
							</br>
							<div class="row">

								<div class="col-md-12">
									<table class="table">
										<thead>
											<tr>
												<th scope="col">Sl. No</th>
												<th scope="col">Name</th>
												<th scope="col">NickName</th>
												<th scope="col">Email Id</th>
												<th scope="col">Phone</th>
												<th scope="col">Action</th>
											</tr>
										</thead>
										<%
										Page<Contact> list = (Page) request.getAttribute("contacts");
										System.out.println(list.getSize());
										int count = 1;
										for (int i = 0; i < list.getContent().size(); i++) {
											Contact contact = list.getContent().get(i);
											System.out.println(contact.getName());
										%>
										<tbody>
											<tr><%-- onclick="clickdata('<%=contact%>')" --%>
												<th scope="row"><%=count%></th>
												<td  data-toggle="modal" data-target="#myModal"><%=contact.getName()%></td>
												<td ><%=contact.getNickName()%></td>
												<td><%=contact.getEmailId()%></td>
												<td><%=contact.getPhoneNumber()%></td>
												<td><button type="submit"><a href="/user/show/<%=contact.getcId()%>">View</a></button></td>
											</tr>
										</tbody>

										<%
										count += 1;
										System.out.println(i);
										}
										%>
									</table>
									<nav aria-label="Page navigation example">
										<ul class="pagination">
										<%
										int totalPage = (int)request.getAttribute("totalpages");
										 int currentpage = (int)request.getAttribute("currentpage");
										 int nextpage =currentpage;
										if(currentpage != 0){ %>
											<li class="page-item"><a class="page-link" href="/user/contact/<%=nextpage-1 %>">Previous</a></li>
											<%} %>
											
											 <% 
											for(int i=1;i<=totalPage;i++) {
											if(currentpage == i-1){
												nextpage = i+1;
											%>
											
											<li class="page-item active"><a class="page-link" href="/user/contact/<%=i-1 %>"><%=i %></a></li>
											<%}else{ %>
											<li class="page-item"><a class="page-link" href="/user/contact/<%=i-1 %>"><%=i%></a></li>
											<%}} %>
											
											<% int t = currentpage+1;
											if(t != totalPage){ %>
											<li class="page-item"><a class="page-link" href="/user/contact/<%=nextpage-1 %>">Next</a></li>
											<%} %>
										</ul>
									</nav>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		 

</body>
</html>