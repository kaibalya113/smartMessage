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
						<h2>${pageName}</h2>

					</a>

				</div>

			</div>
		</div>
	</header>

	<section class="main-content-w3layouts-agileits"
		style="padding: 0em 0; margin-top: 25px;">
		<div class="container-fluid">

			<div class="row">
				<div class="col-md-5">
					<!-- <img src="images/dashimage.jpeg"
						style="width: 83%; border-radius: 5px; margin-top: 58px;"> -->



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
									<label for="password"><span class="glyphicon glyphicon-key"></span>
										Password</label> <input type="text" class="form-control" id="password"
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
								<button type="button" class="btn btn-success btn-block" onclick="return register(this,event);"
									style="width: 100%; border-radius: 0px; background: -webkit-linear-gradient(top, rgb(21, 97, 255) 0%, rgb(76, 98, 145) 100%);">
									Signup Now</button>
							</form>
						</div>

					</div>



				</div>
				<div class="col-md-2">
					<div class="vl"></div>
				</div>
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
							<form autocomplete="off">
								<fieldset>
									<div class="form-group">
										<input class="form-control" placeholder="User Id"
											name="userid" id="userid" autofocus="" style="height: 45px;">
									</div>
									<div class="form-group">
										<input class="form-control" placeholder="Password"
											name="password" type="password" id="password"
											style="height: 45px;" onkeyup="passwords(this.value);">
									</div>



									<div class="checkbox">
										<label><a href="forgotPassword.jsp"
											style="font-weight: 700; text-decoration: none; color: #455e9c; font-size: 18px;">
												Forgot Your Password ? </a> </label>
									</div>




									<button
										style="width: 100%; border-radius: 0px; background: -webkit-linear-gradient(top, rgb(21, 97, 255) 0%, rgb(76, 98, 145) 100%);"
										id="buttonid" onclick="return submitForm(this,event);"
										class="btn btn-primary btn-lg button">Login</button>



								</fieldset>
							</form>
						</div>
					</div>

				</div>
			</div>
		</div>

	</section>
	<script type="text/javascript">
		function register(x,y){
			var name1 = $('#name').val();
			var email1 = $('#emailId').val();
			var password1 = $('#password').val();
			if(name1=="" || email1=="" || password1=="" ){
				alert("Enter value");
				return false;
			}
			// encrypt password
			password1 = sha256(password);

			var encryptedPass = CryptoJS.AES.encrypt(password1,CryptoJS.enc.Hex.parse("<%=request.getSession().getId()%>"),
		 			 {
		                    iv : CryptoJS.enc.Hex.parse("<%=iv%>"),
		                    mode : CryptoJS.mode.CBC,
		                    padding : CryptoJS.pad.Pkcs7
		             }); 
			
			
			
			// ajax call
			$.ajax({
				type: "POST",
				url : "register",
				contentType : "application/json",
				data: JSON.stringify({
					 name : name1, password : encryptedPass.toString(), emailId : email1
					
				}),
				dataType: 'json',
				success : function(data){
					//console.log(data.message);
					var obj = JSON.stringify(data);
					alert(obj);
					console.log(obj);
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