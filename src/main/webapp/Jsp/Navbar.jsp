<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Navbar</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark"
		style="background-color: #000070; width: 100%;">
		<a
			class="navbar-brand text-capitalize font-italic font-weight-bold ml-5"
			href="#">Online Fitness</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse " id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto mx-5">
				<li class="nav-item "><a class="nav-link mx-2 text-white"
					href="/OnlineFitness/index.jsp">Home </a></li>
				<li class="nav-item"><a class="nav-link mx-2 text-white"
					href="/OnlineFitness/Jsp/TrainerForm.jsp">Add Trainer</a></li>

				<li class="nav-item"><a class="nav-link mx-2 text-white"
					href="/OnlineFitness/Jsp/AllTrainer.jsp">All Trainers</a></li>
			</ul>
			
		</div>
	</nav>

	<script>
			
			
		</script>
</body>
</html>