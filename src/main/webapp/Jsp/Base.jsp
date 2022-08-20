<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="Css/Base.css">
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body style="background: #EEEEEE">


	<div class="BackImage zigzag">
		<jsp:include page="Navbar.jsp"></jsp:include>
		<div class="container text-center text-white d-flex align-items-center justify-content-center"
			style="height: 70%; width: 100%">
			<div class="" id="Home">
				<h1 class="mt-5">Welcome To Online Fitness Center</h1>
				<br/>
				<button class="btn btn-outline-primary"><a href="Jsp/TrainerForm.jsp" class="text-white" style="text-decoration: none;">Get Started As Trainer</a></button>
				<h5>OR</h5>
				<button class="btn btn-outline-success"><a href="#" class="text-white" style="text-decoration: none;">Get Started As User</a></button>
			</div>
			
		</div>
	</div>


	
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
		
		<script>
				let data=sessionStorage.getItem("html");
				// $('#searchdiv').load("Jsp/Navbar.jsp #search" ,()=>{
				// 	$(this).html($('#search').html());
				// 	console.log("Hii")
				// })
				$('#searchdiv').html(data);
				setInterval(() => {
					sessionStorage.removeItem("html");
				}, 100);
				
			
			
		</script>
</body>
</html>