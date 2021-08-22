<%@page import="com.blog.main.model.Contact"%>
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
	.w3-sidebar {
    	overflow: hidden !important;
}
.avatar {
  vertical-align: middle;
  width: 200px;
  height: 200px;
  border-radius: 50%;
}
</style>
<style type="text/css" href="/css/card.css"></style>
</head>
<body>
	<header>
		<div class="top-bar_sub_w3layouts container-fluid">
			<div class="row">
				<div class="col-md-12 logo text-left" style="z-index: 99999;">

					<a class="navbar-brand" href="">
						<h2>Hi ${user.name}, Dashboard</h2>

					</a>

				</div>

			</div>
		</div>
	</header>
	<div>
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
					<%@include file="sidebar.jsp" %>
				</div>
				<div class="col-md-8">
					<h1>Contact Details</h1>
					
					
					<%Contact contact = (Contact)request.getAttribute("contact");
						
					%>
					<div class="row">
					<div class="col-md-6">
						<h4 style="padding-top: 45px;">Name : <%=contact.getName() %></h4>
						<h4>Email : <%=contact.getEmailId() %></h4>
						<h4>Nick Name : <%=contact.getNickName() %></h4>
						<h4>Phone Number : <%=contact.getPhoneNumber() %></h4>
						<h4>Work : <%=contact.getWork() %></h4>
						<h4>Created By : <%=contact.getTime() %></h4>
					</div>
						<div class="col-md-4">
						<%if(contact.getImage()==null){ %>
							 <img src="/images/pic.png" alt="Avatar" class="avatar"> 
						<%}else{ %>
						
						 <img src="/images/<%=contact.getImage() %>" alt="Avatar" class="avatar"> 
						<%} %>
					</div>
					
					</div>
					<div class="row">
						<div class="col-md-8">
							<center><h4><%=contact.getDescription() %></h4></center>
						</div>
						<br>
						
						<div class="col-md-8">
						<center>
							<button type="submit">Delete</button>
							<button><a href="/contact/updatecontact/<%=contact.getcId()%>">update</a> </button></center>
						</div>
					</div>
					
					
				</div>
			</div>
		</div>
	</div>
	<!-- <script type="text/javascript">
		function onContact(){
			alert("hi")
			$.ajax({
				type:"GET",
				url:"user/contact",
				success: function(data){
					
				}
			})
		}
	</script> -->
</body>
</html>