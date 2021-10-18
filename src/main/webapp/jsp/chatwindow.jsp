<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chat</title>
<%@include file="cdn.jsp"%>

</head>
<body onload="fetchuser()">
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
						<div class="online" id="online">
						
						</div>
						
						
					</div>
					<div class="col-md-12">
					
						<h1>Afer click here will show option to chat and chat history</h1>
					</div>
					<div class="container" style="height: 920px; background-color: rgba(255,0,0,0.1);">
					<div class="col-md-12" style="background-color:blue;">
						<h3>User Name</h3>
						
					</div>
					<div class="col-md-12">
					<textarea rows="4" cols="100" placeholder="Enter Message" id="message"></textarea>
					
					
					<button value="send" name="send" type="button">send</button>
					
					<div class="container" style="height: 770px; background-color:rgba(217, 217, 217);">
					
					
					
					</div>
					</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
		$.ajax({
			type:"GET",
			url:"/user/onlinecontact",
			success: function(resp){
				//console.log(resp)
				 var listOfonline = JSON.stringify(resp);
				console.log(listOfonline);
				
				var div = document.getElementById('online');
				for(var i=0; i < resp.length; i++) {
					var image = resp[i].imageUrl;
					var name = resp[i].name;
					var id = resp[i].uId;
					var emailId = resp[i].emailId;
					var phoneNumber = resp[i].phoneNumber;
					
			        div.innerHTML += '<img src="/images/'+resp[i].imageUrl+'" alt="'+resp[i].name+'"onclick="show('+id+')" style="width:100px;border-radius: 50%; box-shadow: 0 3px 10px rgb(0 0 0 / 0.2);">';
			      }
				
			}
		});
		
		function show(x){
			
		}
		
		function sendMessage(){
			var message = $('#message').val();
			
			$.ajax({
				type:"POST",
				url: "/message/api/send",
				success:function(resp){
					console.log(data);
				}
			})
		}
		
		
	</script>
</body>
</html>