<%@page import="com.fitness.model.Trainer"%>
<%@page import="com.fitness.helper.MyResponse"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="../Css/Trainer.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<meta charset="ISO-8859-1">
<title>Add Trainer</title>
</head>
<body class="zigzag" style="background: #e2e2e2">
	<div><jsp:include page="Navbar.jsp"></jsp:include></div>
	<div
		class="container text-center d-flex align-items-center justify-content-center"
		style="height: 80vh;">

		<div class="card mt-5">
			<div class="card-body">
				<h2>Registered As Trainer</h2>
				
				<%
				HttpSession session2 = request.getSession();
				MyResponse attribute = (MyResponse) session2.getAttribute("Message");
				Trainer trainer = (Trainer) session2.getAttribute("Trainer");
				
				if (attribute != null) {
				%>
				<div class="alert alert-<%=attribute.getType()%>" role="alert"
					onload="hide()" id="alert">
					<%=attribute.getContent()%>
				</div>
				<%
				}
				session2.removeAttribute("Message");
				%>
				<form class="row g-3 needs-validation" novalidate
					action="../AddTrainerServlet" method="post"
					enctype="multipart/form-data">
					
					<div class="col-md-6 offset-3">
						<input type="hidden" name="trainerId" class="form-control"
							id="validationCustom01" 
							<% if(trainer!= null) {%>
							value="<%= trainer.getTrainerId() %>" 
							<%}else{ %>
							value="0"
							<%} %>
							placeholder="">
						<div class="invalid-feedback">Please enter your FirstName.</div>
					</div>
					
					<div class="col-md-4">
						<label for="validationCustom01" class="form-label">First
							name</label> <input type="text" name="firstName" class="form-control"
							id="validationCustom01" 
							<% if(trainer!= null) {%>
							value="<%= trainer.getFirstName() %>" 
							<%} %>
							placeholder="Enter your first Name eg.Virendra" required>
						<div class="invalid-feedback">Please enter your FirstName.</div>
					</div>
					<div class="col-md-4">
						<label for="validationCustom02" class="form-label">Last
							name</label> <input type="text" name="lastName" class="form-control"
							id="validationCustom02" 
							<% if(trainer!= null) {%>
							value="<%= trainer.getLastName() %>" 
							<%} %>
							placeholder="Enter your last Name eg.Matal" required>
						<div class="invalid-feedback">Please enter your LastName.</div>
					</div>
					<div class="col-md-4">
						<label for="validationCustomUsername" class="form-label">Username</label>
						<div class="input-group has-validation">

							<input type="text" name="username" class="form-control"
								id="validationCustomUsername"
								placeholder="Enter Username eg.veer"
								<% if(trainer!= null) {
									String username=trainer.getUsername();
									String[] newdata=username.split("@");
									
								%>
								value="<%= newdata[0] %>" 
								<%} %>
								aria-describedby="inputGroupPrepend" required> <span
								class="input-group-text" id="inputGroupPrepend">@Gmail.com</span>
							<div class="invalid-feedback">Please choose a Username.</div>
						</div>
					</div>
					<div class="col-md-8 offset-2">
						<label for="inputAddress" class="form-label">Address</label> <input
							type="text" name="address1" class="form-control"
							id="inputAddress"
							<% if(trainer!= null) {%>
							value="<%= trainer.getAddress() %>" 
							<%} %>
							placeholder=" Enter your address eg. 111,Station road," required>
						<div class="invalid-feedback">Please provide a valid
							Address.</div>
					</div>
					<div class="col-md-6">
						<label for="validationCustom03" class="form-label">City</label> <input
							type="text" name="city" class="form-control"
							<% if(trainer!= null) {%>
							value="<%= trainer.getCity() %>" 
							<%} %>
							id="validationCustom03" placeholder="Enter valid city eg.Mumbai"
							required>
						<div class="invalid-feedback">Please provide a valid city.</div>
					</div>
					<div class="col-md-3">
						<label for="validationCustom04" class="form-label">State</label> <select
							class="form-select" name="state"
							<% if(trainer!= null) {%>
							value="<%= trainer.getState() %>" 
							<%} %>
							 id="validationCustom04" required>
							<option disabled
							 
							 >Choose...</option>
							<option>Maharashtra</option>
						</select>
						<div class="invalid-feedback">Please select a valid state.</div>
					</div>
					<div class="col-md-3">
						<label for="validationCustom05" class="form-label">Zip</label> <input
							type="text" name="zip" class="form-control"
							<% if(trainer!= null) {%>
							value="<%= trainer.getZip()%>" 
							<%} %>
							id="validationCustom05"
							placeholder="Entrer your Area zip eg.123456" required>
						<div class="invalid-feedback">Please provide a valid zip.</div>
					</div>
					<div class="col-md-6 offset-3">
						<label for="fileUpload">Choose your Resume :<% if(trainer!= null) {%>
							<%= trainer.getResume()%>" 
							<%} %></label> <input
							type="file" name="cv"
							value="hello"
							 class="form-control" id="inputGroupFile04"
							aria-describedby="inputGroupFileAddon04" aria-label="Upload"
							required>
						<div class="invalid-feedback">Please provide your Resume.</div>

					</div>
					<div class="col-2 offset-5">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" value=""
								id="invalidCheck" required> <label
								class="form-check-label" for="invalidCheck"> Agree to
								terms and conditions </label>
							<div class="invalid-feedback">You must agree before
								submitting.</div>
						</div>
					</div>
					<div class="col-4 offset-4">
					<% if(trainer== null) {%>
						<button class="btn btn-primary" type="submit">Submit form</button>
						<%}else{ %>
						<button class="btn btn-primary" type="submit">Update Trainer</button>
						<button class="btn btn-primary" type="button"" onclick="CancelEdit()">Cancel</button>
						<%} %>
					</div>
					

				</form>

				<script>
					//Example starter JavaScript for disabling form submissions if there are invalid fields
					(function() {
						'use strict'

						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.querySelectorAll('.needs-validation')

						// Loop over them and prevent submission
						Array.prototype.slice.call(forms).forEach(
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (!form.checkValidity()) {
											event.preventDefault()
											event.stopPropagation()
										}

										form.classList.add('was-validated')
									}, false)
								})
					})()
					
					
					setInterval(() => {
						
							//console.log("Hello");
							var $alert = $("#alert");
							if ($alert.is(":visible")) {
								setTimeout(function() {
									$alert.hide();
								}, 2000);
								return;
							}
							//$alert.show();
							
						
					}, 1000);
					
					const CancelEdit=()=>{
						 $.ajax({
						    	type:"Get",
						    	url:"../AddTrainerServlet",
						    	success: ()=>{
						        window.location.href="/OnlineFitness/Jsp/AllTrainer.jsp";
						    }})
					};
				</script>
			</div>
		</div>
	</div>
</body>
</html>