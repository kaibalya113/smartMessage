<%@page import="com.blog.main.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<%@include file="cdn.jsp"%>
<style type="text/css">

.avatar {
  vertical-align: middle;
  width: 200px;
  height: 200px;
  border-radius: 50%;
}

</style>
</head>
<body>

	<header>
		<div class="top-bar_sub_w3layouts container-fluid">
			<div class="row">
				<div class="col-md-12 logo text-left" style="z-index: 99999;">

					<a class="navbar-brand" href="">
						<h2>Hi ${username}, Profile</h2>

					</a>

				</div>

			</div>
		</div>
	</header>


	<!-- Profile Details -->
	
<%User user = (User)request.getAttribute("user"); %>
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-4">
				<%@include file="sidebar.jsp"%>
			</div>
			<div class="col-md-8">
				<h1>Profile</h1>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<%if(user.getImageUrl() == null){ %>
						 	<img src="/images/pic.png" alt="Avatar" class="avatar"> 
						 <%}else{ %>
						 	<img src="/images/<%=user.getImageUrl() %>" alt="Avatar" class="avatar">
						 <%} %>
					</div>
					<div class="col-md-4"></div>
				</div>
				<div class="row">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<h3 style="margin-left:30%">${user.name}</h3>
					</div>
					<div class="col-md-4"></div>
				</div>
				<div class="row">
					<div class="col-sm-12">
					<div class="card text-center">
						<div class="card-header text-center">
							<ul class="nav nav-tabs card-header-tabs text-center" style="margin-left:40%">
								<li class="nav-item"><a class="nav-link active" href="#">INFO</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">Recent Data</a>
								</li>
								<li class="nav-item"><a class="nav-link disabled" href="#">More</a>
								</li>
							</ul>
						</div>
						<div class="card-body">
							<h5 class="card-title">Upload New Profile Pic</h5>
							<p class="card-text">Image should be less than 1MB </p>
							<input class="btn btn-primary" type="file" id="image" size="3" name="image" onchange="setImage()">
							
						</div>
					</div>
					
					</div>

				</div>
				<br>
				<div class="row">
					<div class="col-sm-6">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Update Mobile</h5>
								<%if(user.getPhoneNumber() == null){ %>
								<input type="number" id="phone" placeholder="Enter mobile No" >
								
								<input type="submit" value="update" onClick="updateMobile()">
								<%}else{ %>
								<input type="number" id="phone" placeholder="Enter mobile No" value="<%=user.getPhoneNumber()%>">
								
								<input type="submit" value="update" onClick="updateMobile()" disabled="disabled">
								
								<%} %>

							</div>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">Special title treatment</h5>
								<p class="card-text">With supporting text below as a natural
									lead-in to additional content.</p>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	function setImage(){
		
		var files = $('#image')[0].files[0];
		var fd = new FormData();
		fd.append('file', files);
		$.ajax({
			url: "/user/uploadImage",
			type: "POST",
			data: fd,
			processData: false,
		    contentType: false,
			success: function(resp){
				alert(resp);
			},
            error: function () {
                alert("Error while processing request.Try Again.");
            }

		});
	}
	
	function updateMobile(){
		var mobile = $("#phone").val();
		var mob = /^[1-9]{1}[0-9]{9}$/;
		console.log(mobile.length)
		if(mobile.length <10){
			console.log("should 10 digit.")
		}else if(mob.test(mobile) == false){
			console.log("Please enter valid mobile number.");
		}else{
			$.ajax({
				type: "POST",
				url:  "/update/mobile",
				data: {mobile:mobile},
				success:function(resp){
					console.log(resp)
				}
			})
		}
	}

</script>
</body>
</html>