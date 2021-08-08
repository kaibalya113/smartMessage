<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<c:if test="${isLogin == false}">

			<div class="top-bar_sub_w3layouts container-fluid">
				<div>
					<div class="row">
						<div class="col-md-4 logo text-right" style="z-index: 99999;">
						</div>
						<div class="col-md-4 logo text-right" style="z-index: 99999;"></div>
						<div class="col-md-4 logo text-center" style="z-index: 99999;">

							<a class="navbar-brand" href="">
								<h2>${pageName}</h2>

							</a>

						</div>


					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${isLogin == true}">

			<div class="top-bar_sub_w3layouts container-fluid">
				<div>
					<div class="row">
						<div class="col-md-4 logo text-center" style="z-index: 99999;">
						<a class="navbar-brand" href="">
								<h2>${pageName}</h2>

							</a>
						</div>
						<div class="col-md-4 logo text-right" style="z-index: 99999;"></div>
						<div class="col-md-4 logo text-center" style="z-index: 99999;">

							

						</div>


					</div>
				</div>
			</div>
		</c:if>
	</header>

	<section class="main-content-w3layouts-agileits"
		style="padding: 0em 0; margin-top: 25px;">
		<div class="container-fluid">

			<div class="row">
			
				<div class="col-md-5">
					
<c:if test="${isLogin == false}">
					<!-- Modal content-->
					<div class="">
						<div class="row">
							<div class="col-md-12">
								<h3
									style="text-align: center; font-weight: 600; color: #455e9c; font-size: 18px;">Sign
									Up</h3>
								<hr>
							</div>
						</div>
						<div class="modal-body" style="padding: 40px 50px;">
							<form>
								<div class="form-group">
									<label for="name">Full Name</label> <input type="text"
										class="form-control" id="name" placeholder="Enter Name">
								</div>
								<div class="form-group">
									<label for="emailId"> Email</label> <input type="text"
										class="form-control" id="emailId" placeholder="Enter email">
								</div>
								<div class="form-group">
									<label for="password"><span
										class="glyphicon glyphicon-key"></span> Password</label> <input
										type="text" class="form-control" id="password"
										placeholder="Enter password">
								</div>
								<!-- <div class="form-group">
									<label for="password"><span class="glyphicon glyphicon-key"></span>Confirm
										Password</label> <input type="text" class="form-control" id="password"
										placeholder="Confirm password">
								</div> -->
								<div class="checkbox">
									<label><input type="checkbox" value="" checked>Remember
										me</label>
								</div>
								<button type="button" class="btn btn-success btn-block"
									onclick="return register(this,event);"
									style="width: 100%; border-radius: 0px; background: -webkit-linear-gradient(top, rgb(21, 97, 255) 0%, rgb(76, 98, 145) 100%);">
									Signup Now</button>
							</form>
						</div>

					</div>


</c:if>
<c:if test="${isLogin == true}">
					

						<img src="images/dashimage.jpeg"
							style="width: 83%; border-radius: 5px; margin-top: 58px;">
					</div>


				</c:if>
				



				<c:if test="${isLogin == true}">
					<!-- <div class="col-md-2">
						<div class="vl"></div>
					</div> -->
					<div class="col-md-5">
						<div class="row">
							<div class="col-md-12">
								<h3
									style="text-align: center; font-weight: 600; color: #455e9c; font-size: 18px;">Login</h3>
								<hr>
							</div>
						</div>
						<div class="row">
							<div class="col-md-1"></div>
							<div class="col-md-10">
								<form:form autocomplete="off" action="/dologin">
									<fieldset>
										<c:if test="${not empty param.error}">

											<div class="alert alert-danger">Invalid username and
												password.</div>
										</c:if>
										<c:if test="${not empty param.logout}">
											<div class="alert alert-danger">user has logged out</div>
										</c:if>
										<div class="form-group">
											<input class="form-control" placeholder="User Id"
												name="username" id="username" autofocus=""
												style="height: 45px;">
										</div>
										<div class="form-group">
											<input class="form-control" placeholder="Password"
												name="password" type="password" id="password"
												style="height: 45px;">
										</div>



										<div class="checkbox">
											<label><a href="forgotPassword.jsp"
												style="font-weight: 700; text-decoration: none; color: #455e9c; font-size: 18px;">
													Forgot Your Password ? </a> </label>
										</div>




										 <button
											style="width: 100%; border-radius: 0px; background: -webkit-linear-gradient(top, rgb(21, 97, 255) 0%, rgb(76, 98, 145) 100%);"
											id="buttonid" 
											class="btn btn-primary btn-lg button">Login</button>


										<!-- <a href="/user/dashboard"> Login</a> -->

									</fieldset>
								</form:form>
							</div>
						</div>
					</div>
				</c:if>
				<c:if test="${isLogin == false}">
					<div class="col-md-7">

						<img src="images/dashimage.jpeg"
							style="width: 83%; border-radius: 5px; margin-top: 58px;">
					</div>


				</c:if>

			</div>
		</div>


	</section>
	<script type="text/javascript">
		function redi(){
			console.log("fff")
			window.location = "dashboard.jsp";
			/* $.ajax({
				type: "GET",
				url : "/user/dashboard",
				
				success : function(data){
					
					
					
				},
					error : function(data) {
						
					
				}


		}); */
		}
		function register(x,y){
			var name1 = $('#name').val();
			var email1 = $('#emailId').val();
			var password1 = $('#password').val();
			if(name1=="" || email1=="" || password1=="" ){
				alert("Enter value");
				return false;
			}
			<%-- var id = "<%=request.getSession().getId()%>"; --%>
			//console.log(password1)
			// encrypt password
			/* console.log(id)
			password1 = sha256(password);
			console.log(password1) */
			<%-- var encryptedPass = CryptoJS.AES.encrypt(password1,CryptoJS.enc.Hex.parse("<%=request.getSession().getId()%>"),
		 			 {
		                    iv : CryptoJS.enc.Hex.parse("<%=iv%>"),
		                    mode : CryptoJS.mode.CBC,
		                    padding : CryptoJS.pad.Pkcs7
		             });  --%>
			
			
			
			// ajax call
			$.ajax({
				type: "POST",
				url : "register",
				contentType : "application/json",
				data: JSON.stringify({
					 name : name1, password : password1, emailId : email1
					
				}),
				dataType: 'json',
				success : function(data){
					//console.log(data.message);
					var obj = JSON.stringify(data);
					alert(obj);
					console.log(obj);
					console.log(obj.msg);
					console.log(obj["msg"]);
					window.location = "login.jsp";
					
					
				},
					error : function(data) {
						
					alert("error");
					//window.location = "index.jsp";
					
					alert("Error while processing request.Try Again.");
				}


			})
			//console.log(encryptedPass.toString());
		}
	
		function sha256(pass){
			var sha256 = new jsSHA('SHA-256', 'TEXT');
			sha256.update(pass);
			var hash = sha256.getHash("HEX");
			//alert(hash);
			return hash;
		}
	</script>
</body>
</html>