package com.fitness.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.servlet.jsp.PageContext;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fitness.helper.GetSessionFactory;
import com.fitness.helper.MyResponse;
import com.fitness.model.Trainer;

/**
 * Servlet implementation class AddTrainerServlet
 */
@MultipartConfig(maxFileSize = 16177215)
public class AddTrainerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTrainerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.removeAttribute("Trainer");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path="\\\\LAPTOP-9HDFMHNU\\Images";
		
		HttpSession httpSession = request.getSession();
		try {
		//fetching all data
		int trainerId = Integer.parseInt(request.getParameter("trainerId"));
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String username = request.getParameter("username");
		String address1 = request.getParameter("address1");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		long zip = Long.parseLong(request.getParameter("zip"));
		//fetching multipart file 
		InputStream inputStream=null;
		Part resumePart = request.getPart("cv");
		if (resumePart!=null) {
			
			//uploading file to the server...
			
			
			  path =path+File.separator+resumePart.getSubmittedFileName();
			//String path=httpSession.getServletContext().getRealPath("/");
			  System.out.println("Path is : "+path);
				
				
			  
				  FileOutputStream outputStream = new FileOutputStream(path);
				  
				  inputStream=resumePart.getInputStream(); //reading data
				  
				  byte[] data=new byte[inputStream.available()]; 
				  inputStream.read(data);
				  
				  //writing data in FileOutputStream 
				  outputStream.write(data);
				  
				  //closing inputStream and outputStream 
				  inputStream.close();
				  outputStream.close();
			
				 
			 
			 
				/*
				 * String path =
				 * request.getServletContext().getInitParameter("file-upload")+File.separator+
				 * resumePart.getSubmittedFileName(); FileOutputStream outputStream = new
				 * FileOutputStream(path); inputStream=resumePart.getInputStream(); byte[]
				 * data=new byte[inputStream.available()]; inputStream.read(data);
				 * outputStream.write(data); inputStream.close(); outputStream.close();
				 */
			
		}
		String resume = resumePart.getSubmittedFileName();
		Trainer trainer = new Trainer(trainerId,firstName,lastName,username+"@Gmail.com",address1,city,state,zip,resume);
		System.out.println("All values are : "+trainer);
		
		
//		try {
			Session session = GetSessionFactory.getFactory().openSession();
			
			Transaction transaction = session.beginTransaction();
			
			session.saveOrUpdate(trainer);
			
			transaction.commit();
			
			session.close();
			
			httpSession.setAttribute("Message", new MyResponse("new Trainer Added successfull !!!","success"));
			MyResponse attribute = (MyResponse) httpSession.getAttribute("Message");
			httpSession.removeAttribute("Trainer");
			System.out.println(attribute.getContent());
			response.sendRedirect("Jsp/TrainerForm.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
			
			httpSession.setAttribute("Message", new MyResponse("Oops, Something went wrong !!!","danger"));
			response.sendRedirect("Jsp/TrainerForm.jsp");
			MyResponse attribute = (MyResponse) httpSession.getAttribute("Message");
			System.out.println(attribute);
		}
		

		
		
		
	}

}
