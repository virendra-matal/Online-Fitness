<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.fitness.model.Trainer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Trainers</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
	integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div>
		<jsp:include page="Navbar.jsp"></jsp:include>
	</div>
	<div class=" d-flex align-items-center justify-content-center mt-1 "
		style="height: 80%;">
		<div class="container text-center mt-5">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2 w-100" type="search"
					name="search" onkeyup="Search()" id="input"
					placeholder="Search for trainer" aria-label="Search">

			</form>
			<div class="list-group text-center" id="searchdata"></div>
			<jsp:include page="/AllTrainersServlet"></jsp:include>
			<div class="card mt-2">
				<div class="card-body">
					<h1>All Trainers</h1>

					<table
						class="table table-light table table-bordered  table-hover table-responsive ml-2"
						style="width: 95.5%;">

						<thead class="bg-dark text-white" style="width: 100%;">
							<tr>
								<th scope="col">Id</th>
								<th scope="col">Name</th>
								<th scope="col">Username</th>
								<th scope="col">Address</th>
								<th scope="col">Resume</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody class="" style="width: 100%">
							<c:forEach var="trainer" items="${data}">
								<tr id="trainer${trainer.trainerId}" class="">
									<th scope="row">${trainer.trainerId}</th>
									<td>${trainer.firstName}${trainer.lastName}</td>
									<td>${trainer.username}</td>
									<td>${trainer.address}${trainer.city }, ${trainer.state }-${trainer.zip }</td>
									<td>${trainer.resume} 

									<form action="../DownloadFileServlet" method="get">
									<input type="hidden" value="${trainer.resume}" name="cv">
									<button name="btn" class="btn btn-outline-warning" type="submit"><i class="fa-solid fa-download text-primary"></i></button>
									</form>
									</td>
									<td><i class="fa-solid fa-pen-nib text-primary"
										onclick="UpdateTrainer(${trainer.trainerId})"></i>
										&nbsp;&nbsp; <i class="fa-solid fa-trash-can text-warning"
										onclick="deleteRecord(${trainer.trainerId})"></i></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
				</div>
			</div>

		</div>
	</div>
	<script>
	const deleteRecord=(id)=>{
		console.log(id);
	    $.ajax({
	    	type:"Get",
	    	url:"../DeleteTrainerServlet",
	    	data: {id},
	    	success: (result)=>{
	        console.log("result is : ",result);
	        console.log("Hello");
	    }})

		setTimeout(() => {
			 $.ajax({
			    	type:"Get",
			    	url:"../AllTrainersServlet",
			    	success: (result)=>{
			        console.log("result is : ",result);
			        console.log("2nd ajax call");
			        window.location.href="/OnlineFitness/Jsp/AllTrainer.jsp";
			    }})
			    
		}, 1000);
	};
	
	const UpdateTrainer=(trainerId)=>{
		console.log("trainerId is: ",trainerId);
		  $.ajax({
		    	url:"../UpdateTrainerServlet",
		    	data:{
		    		id:trainerId
		    		},
		    	type: "POST",
		    	success: (result)=>{
			        console.log("result is : ",result);
			        console.log("2nd ajax call");
			        window.location.href="/OnlineFitness/Jsp/TrainerForm.jsp";
			    }
		    	}); 
		    
		    
	}
	
	const Search=()=>{
		console.log("hello");
		var info=$("#input").val();
		console.log("data is : ",info);
		
		if (info == '') {
			$('#searchdata').hide();
		}else{
			$.ajax({
	    	type: "Get",
	    	url: "../SearchTrainerServlet",
	    	data: {key:info},
	    	success: (response)=>{
	        console.log("result is : ",response);
			let text='';
			$.each(response,(index,trainer)=>{
				// console.log(trainer.lastName);
				text+='<a class="list-group-item list-group-item-action" href="#trainer'+trainer.trainerId+'" onClick="AddActive('+trainer.trainerId+')">'+trainer.firstName+' '+trainer.lastName+'</a>';
				console.log(text);

				
			})
			$('#searchdata').html(text);
			$('#searchdata').show();
			$('#searchdata').css("position","absolute");
			$('#searchdata').css("width","79%");
			
			$('#searchdata').css("z-index","100")
			
			
	    }})
		}
		
	};
	
	const AddActive=(id)=>{
		console.log("TRainer Id id: ",id);
		$('#trainer'+id+'').addClass('bg-secondary text-light');
		$('#trainer'+id+'').focus();
		setTimeout(() => {
			$('#trainer'+id+'').removeClass('bg-secondary text-light');
		}, 2000);
		$('#searchdata').hide();
	};
	
	function startdownload(identifier){
		let data =$(identifier).data('cv');
		console.log("data is : ",data);
		 $.ajax({
		    	url:"../DownloadFileServlet",
		    	data:{
		    		cv:data
		    		},
		    	type: "GET",
		    	success: (result)=>{
			        console.log("result is : ",result);
			       
			    }
		    	
		    	});
	}
	
	</script>
</body>
</html>