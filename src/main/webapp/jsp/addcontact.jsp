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

</style>

<style type="text/css" href="/css/card.css"></style>
</head>
<body>
	<header>
		<div class="top-bar_sub_w3layouts container-fluid">
			<div class="row">
				<div class="col-md-12 logo text-left" style="z-index: 99999;">

					<a class="navbar-brand" href="">
						<h2>Smart Contact</h2>

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
				<div class="col-md-6">
					<center><h2>${title}</h2></center>
					<%String message = request.getAttribute("result").toString(); %>
					<%if(message.equalsIgnoreCase("Success")) {%>
						<div class="alert alert-success" role="alert">
						  ${result}
						</div>
					
					<%}else if(message.equalsIgnoreCase("")){ %>
						
					<%} else{%>
						<div class="alert alert-danger" role="alert">
						  ${result}
						</div>
					<%} %>
					
					
					<br />
					<div class="modal-body" style="padding: 40px 50px;">
							<form action="/user/addcontact1" method="post"  enctype="multipart/form-data"
							 
							>
								<div class="form-group">
									<label for="name">Full Name</label> <input type="text"
										class="form-control" id="name" name="name" placeholder="Enter Name">
								</div>
								<div class="form-group">
									<label for="nickName">Nick Name</label> <input type="text"
										class="form-control" id="nickName" name="nickName" placeholder="Enter Nick Name">
								</div>
								<div class="form-group">
									<label for="phoneNumber"> Number</label> <input type="number"
										class="form-control" id="phoneNumber" name="phoneNumber" placeholder="Enter Phone Number">
								</div>
								<div class="form-group">
									<label for="emailId"> Email</label> <input type="text"
										class="form-control" id="emailId" name="emailId" placeholder="Enter email">
								</div>
								
								<div class="form-group">
									<label for="work"> Work</label> <input type="text"
										class="form-control" id="work" name="work" placeholder="Enter Work Details">
								</div>
								
								<div class="form-group">
									<label for="work"> Select image:</label> 
									<input type="file" id="image" name="image">
								</div>
								<div class="form-group">
									<label for="work"> Description</label> 
									<textarea rows="4" cols="30" name="description" id="description"></textarea>
								</div>
								
								<input type="submit" class="btn btn-success btn-block" value="Add"
									
									style="width: 100%; border-radius: 0px; background: -webkit-linear-gradient(top, rgb(21, 97, 255) 0%, rgb(76, 98, 145) 100%);">
									
							</form>
						</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function addcontact(){
			const name= $("#name").val();
			const nickname = $("#nickName").val();
			const emailId = $("#emailId").val();
			const phoneNumber = $("#phoneNumber").val();
			const work = $("#work").val();
			const description = $("#description").val();
			const image = $("image").val();
			console.log(image);
			console.log(name);
		}
	
	</script>
</body>
</html>