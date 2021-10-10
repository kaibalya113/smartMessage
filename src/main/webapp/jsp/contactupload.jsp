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

					<div class="col-md-6">
					
						<div class="card" style="width: 28rem;">
							
							<div class="card-body">
								<h5 class="card-title">Upload CSV File</h5>
								
								<input class="btn btn-primary" type="file" id="file" size="3" name="image">
								<a href="#" class="btn btn-primary" onClick="uploadFile()">Upload Here</a>
							</div>
						</div>
						
						
					</div>
					
					
					
				</div>
			</div>

		</div>
	</div>

	<script type="text/javascript">
		function uploadFile(){
			var file = $("#file").val();
			console.log(file);
			var files = $('#file')[0].files[0];
			var fd = new FormData();
			fd.append('file', files);
			console.log(files);
			$.ajax({
				type:"POST",
				url:"/upload/csvfile",
				data:fd,
				processData: false,
			    contentType: false,
				success:function(resp){
					alert(resp);
					window.location.reload()
				}
			})
		}
	
	</script>
</body>
</html>