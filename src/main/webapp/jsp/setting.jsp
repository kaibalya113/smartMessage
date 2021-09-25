<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Settings</title>
<%@include file="cdn.jsp"%>

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
	<div class="col-md-12">
		<div class="row">
			<div class="col-md-4">
				<%@include file="sidebar.jsp"%>
			</div>
			<div class="col-md-8">
				<h1>Options</h1>
				<div class="row">

					<div class="col-md-3">
					
						<div class="card" style="width: 18rem;">
							
							<div class="card-body">
								<h5 class="card-title">Change Password</h5>
								
								<a href="#" class="btn btn-primary">Click Here</a>
							</div>
						</div>
						
						
					</div>
					<div class="col-md-3"  style="padding-left: 63px;">
					
						<div class="card" style="width: 18rem;">
							
							<div class="card-body">
								<h5 class="card-title">Upload Contacts</h5>
								<p class="card-text">Upload large size contact file Like CSV</p>
								<a href="/user/contactupload" class="btn btn-primary">Click Here</a>
							</div>
						</div>
						
						
					</div>
					
					<div class="col-md-3" style="padding-left: 123px;">
					
						<div class="card" style="width: 18rem;">
							
							<div class="card-body">
								<h5 class="card-title">Chat</h5>
								<p class="card-text">Talk with your CloseOnes</p>
								<a href="/user/chatwindow" class="btn btn-primary">Enter </a>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>

		</div>
	</div>

</body>
</html>