<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
response.setHeader("Cache-Control","no-cache");
response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache");
response.setDateHeader ("Expires", 0);
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
						<h2>Hi ${username}, Dashboard</h2>

					</a>

				</div>

			</div>
		</div>
	</header>
	
</body>
</html>