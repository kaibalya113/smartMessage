<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat</title>
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

					<div class="col-md-12">
					
						<h1>List of online Contacts</h1>
						
						
					</div>
					<div class="col-md-12">
					
						<h1>Afer click here will show option to chat and chat history</h1>
						
						
					</div>
					
				</div>
			</div>

		</div>
	</div>
</body>
</html>