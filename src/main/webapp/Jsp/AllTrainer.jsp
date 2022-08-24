<%@page import="org.hibernate.Session"%>
<%@page import="com.fitness.helper.GetSessionFactory"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="java.awt.Desktop"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="com.fitness.model.Trainer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page isELIgnored="false"%> --%>
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
	<%
						    int count=3;
						    int totalPages;
						    Session session3 = GetSessionFactory.getFactory().openSession();
						    String hql2="select count(*) from Trainer";
							Query query2 = session3.createQuery(hql2);
							Long totalRecords = (Long) query2.uniqueResult();
							System.out.println("result is: "+ totalRecords);
							if(totalRecords % count != 0) {
								totalPages=(int) ((totalRecords/count)+1);
							}else {
								totalPages=(int) ((totalRecords/count));
							}
							%>
	<div class=" d-flex align-items-center justify-content-center mt-1 "
		style="height: 80%;">
		<div class="container text-center mt-5">
			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2 w-100" type="search"
					name="search" onkeyup="Search(<%=totalPages %>)" id="input"
					placeholder="Search for trainer" aria-label="Search">

			</form>
			<div class="list-group text-center" id="searchdata"></div>
			<div id="jspinclude">
			<%-- <jsp:include page="/AllTrainersServlet"></jsp:include> --%>
			</div>
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
						<tbody class="" style="width: 100%" id="tbody">
						
						
						
						</tbody>
					</table>
					<nav >
						  <ul class="pagination text-center justify-content-center">
						    
						    
							<li class="page-item" id="previousli"><a class="page-link" onclick="previous(<%= totalPages%>)">Previous</a></li>
							<%
							int i;
						    for(i=0;i<totalPages;i++){%>
						    
						    
						    <li class="page-item <% if(i==0){ %> active <%} %>" id="liForServletCall<%=i%>"><a class="page-link" data-i="<%=i%>" id="anchour<%=i%>" onclick="data(<%=i %>,<%= totalPages%>)"><%=i+1 %></a></li>
						    <%
						    //out.print("value of i is: "+i);
						    }	
						    %>
						    <li class="page-item" id="nextli"><a class="page-link" onclick="next(<%= totalPages%>)">Next</a></li>
						   
						  </ul>
						</nav>
					
				</div>
			</div>

		</div>
	</div>
	<script>
		// This will help to create Dynamice content of table...
		  const callingServlet=(pageNo)=>{
			
			let page=parseInt(pageNo);
			sessionStorage.setItem("pageNo",page);
			let text='';
			$.ajax({
		    	type:"Get",
		    	url:"../AllTrainersServlet",
		    	data: {pageNo:pageNo},
		    	success: (data)=>{
		        console.log("result is : ",data);
				
				 $.each(data,(index,trainer)=>{
					//Creating the table body in Ajax Response....
					text+=`
					<tr id="trainer${trainer.trainerId}" class="">
										<th scope="row">${trainer.trainerId}</th>
										<td id="name">${trainer.firstName} ${trainer.lastName}</td>
										<td id="username">${trainer.username}</td>
										<td id="address">${trainer.address} ${trainer.city }, ${trainer.state }-${trainer.zip }</td>
										<td id="resume">
										
										<a>${trainer.resume}</a> 

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
					`;
					$('#tbody').html(text);
				}); 
		    }});
		};
			var pageNo;
		// When user click on the pagination this ffunction will invoke.....
		const data=(i,total)=>{
			console.log("value of i : ",i);
			$('#liForServletCall'+pageNo+'').removeClass('active');
			$('#liForServletCall'+i-1+'').removeClass('active');
			$('#liForServletCall0').removeClass('active');
			$('#nextli').removeClass('disabled');

			pageNo=i;
			$('#liForServletCall'+pageNo+'').addClass('active');
			console.log("page and total value at data function : ",pageNo,total);
			if(pageNo === total-1){
				console.log("page and total value at data function : ",pageNo,total);
				$('#nextli').addClass('disabled');
			}else{
				$('#nextli').removeClass('disabled');
			}
			if (i === 0) {
				console.log("page value at data function when previous() called : ",pageNo);
				$('#previousli').addClass('disabled');
			}else{
				$('#previousli').removeClass('disabled');
			}

			//sending request to the calling Servlet to call Ajax...
			callingServlet(pageNo);
		     
		};
		
		// Checking consistentally value for pagination... 
		var interval=setInterval(() => {
			let avalue=$('#anchour'+pageNo+'').data('i');
			if(avalue == undefined){
				
				pageNo=0;
				$('#previousli').addClass('disabled');
				callingServlet(pageNo);
				//Stoping interval...
				clearInterval(interval);
			}
			console.log("anchour tag value is :",avalue);
		}, 1);

		var total=0;
		var pageForNext=0;
		var pageForPrevious=0;
		const next=(totalPages)=>{
			total=totalPages;
			pageForNext=parseInt(sessionStorage.getItem('pageNo'));
			if (pageForNext === total-1) {
				$('#nextli').addClass('disabled');
			}
			pageForNext=pageForNext+1;
			console.log("page no. is : ",pageForNext);
			data(pageForNext,total);
		};
			

		const previous=(info)=>{
			total=info;
			pageForPrevious=parseInt(sessionStorage.getItem('pageNo'));
			pageForPrevious=pageForPrevious-1;
			console.log("Page and total value at previous() is: "+pageForPrevious,total);
			data(pageForPrevious,total);
		};
		
		
		
	
	
	// Deleting the Records...
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
	

	// Updating the Reocrds...
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

	//Search Functionality When user click on serarch, this function will execute...
	
	const Search=(total)=>{
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
				text+='<a class="list-group-item list-group-item-action" href="#trainer'+trainer.trainerId+'" onClick="AddActive('+trainer.trainerId+','+total+')">'+trainer.firstName+' '+trainer.lastName+'</a>';
				console.log(text);

				
			})
			$('#searchdata').html(text);
			$('#searchdata').show();
			$('#searchdata').css("position","absolute");
			$('#searchdata').css("width","79%");
			$('#searchdata').css("height","300px");
			
			
			$('#searchdata').css("z-index","100")
			
			
	    }})
		}
		
	};
	
	//This finction will highlight searched records...

	const AddActive=(id,pagetotal)=>{
		
		 $.ajax({
		    	url:"../GetCountTillRecordServlet",
		    	data:{
		    		id:id
		    		},
		    	type: "GET",
		    	success: (PageNumber)=>{
			        console.log("Page Number is : ",PageNumber);
					PageNumber=PageNumber-1;
					total=pagetotal;
					console.log("total count at addActive() : ",total);
			        data(PageNumber,total);
			        console.log("Trainer Id id: ",id);
					
					setTimeout(() => {
						$('#trainer'+id+'').addClass('bg-secondary text-light');
						$('#trainer'+id+'').focus();
					}, 500);
					setTimeout(() => {
						$('#trainer'+id+'').removeClass('bg-secondary text-light');
					}, 2000);
					$('#searchdata').hide();
					var info=$("#input").val("");
			    }
		    	});
		
		
	};
	
	

	
	</script>
</body>
</html>