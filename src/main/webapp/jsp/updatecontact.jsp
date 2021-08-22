<%@page import="com.blog.main.model.Contact"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update contact</title>
</head>
<%@include file="cdn.jsp"%>
<% 
	Contact contact = (Contact)request.getAttribute("contact");
%>
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
	<div class="col-md-12">
		<div class="row">
		<div class="col-md-4">
					<%@include file="sidebar.jsp" %>
			</div>
			
			<div class="col-md-6">
			<h2>Updating Contact</h2>
				<div class="modal-body">
							<form action="/contact/update" method="post"  enctype="multipart/form-data"
							 
							>
							<input type="hidden"  id="cId" name="cId" value="<%=contact.getcId()%>">
							
								<div class="form-group">
									<label for="name">Full Name</label> <input type="text"
										class="form-control" id="name" name="name" value="<%=contact.getName()%>">
								</div>
								<div class="form-group">
									<label for="nickName">Nick Name</label> <input type="text"
										class="form-control" id="nickName" name="nickName" value="<%=contact.getNickName()%>">
								</div>
								<div class="form-group">
									<label for="phoneNumber"> Number</label> <input type="number"
										class="form-control" id="phoneNumber" name="phoneNumber" value="<%=contact.getPhoneNumber()%>">
								</div>
								<div class="form-group">
									<label for="emailId"> Email</label> <input type="text"
										class="form-control" id="emailId" name="emailId" value="<%=contact.getEmailId()%>">
								</div>
								
								<div class="form-group">
									<label for="work"> Work</label> <input type="text"
										class="form-control" id="work" name="work" value="<%=contact.getWork()%>">
								</div>
								
								<div class="form-group">
									<label for="work"> Select image:</label> 
									<input type="file" id="image" name="image">
								</div>
								<div class="form-group">
									<label for="work"> Description</label> 
									<textarea rows="4" cols="30" name="description" id="description"><%=contact.getDescription()%></textarea>
								</div>
								
								<input type="submit" class="btn btn-success btn-block" value="Add"
									
									style="width: 100%; border-radius: 0px; background: -webkit-linear-gradient(top, rgb(21, 97, 255) 0%, rgb(76, 98, 145) 100%);">
									
							</form>
						</div>
			</div>
		</div>
	
	
	</div>
</body>
</html>