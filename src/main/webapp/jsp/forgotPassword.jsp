<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="cdn.jsp"%>

<meta charset="UTF-8">
<title>Forgot Password</title>
</head>
<body>
	<header>
		<div class="top-bar_sub_w3layouts container-fluid">
				<div>
					<div class="row">
						<div class="col-md-12 logo text-center" style="z-index: 99999;">
						<center>
								<h2>Forgot Password</h2>

							</center>
						</div>
						


					</div>
				</div>
			</div>
		</header>
		<div class ="container-fluid">
  <div class ="row">
    <div class ="col-md-6 col-sm-6">
       
    </div>
    <div class ="col-md-6 col-sm-6">
       <div class="row">
       <form action="">
        <div class ="col-md-12">
        	<input type="email" id="email" placeholder="Enter your eamil">
		
        </div>
        <br>
		 <div class ="col-md-12">
		<input type="button"  onclick="forgot()" value="Submit">
		</div>
		</form>
		</div>
     </div>
  </div>
</div>
<script type="text/javascript">
		function forgot(){
			var emailId = $('#email').val();
			console.log(emailId);
			
			$.ajax({
				type: "POST",
				url: "/forgotpsw",
				data: {emailId : emailId},
				
				success: function(data){
					//console.log(data);
					var obj = JSON.stringify(data);
					//console.log(obj);
					//alert(obj["msg"])
					alert(obj)
						
				}
			})
		}
	</script>
		
</body>
</html>