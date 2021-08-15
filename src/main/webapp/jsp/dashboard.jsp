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
				<div class="col-md-4">
					<h1>Dashboard</h1>
					<br />
					<h3>Recently Added Contacts</h3>
					<div class="col-md-12">
						<div class="row">
							<div class="col-md-3">
								<div class="flip-card">
									<div class="flip-card-inner">
										<div class="flip-card-front">
											<img src="/images/dashimage.jpeg" alt="Avatar"
												style="width: 300px; height: 300px;">
										</div>
										<div class="flip-card-back">
											<h1>John Doe</h1>
											<p>Architect & Engineer</p>
											<p>We love that guy</p>
										</div>
									</div>
								</div>
							</div>
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