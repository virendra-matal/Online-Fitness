package com.fitness.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;

import org.hibernate.query.Query;

import com.fitness.helper.GetSessionFactory;
import com.fitness.model.Trainer;
import com.google.gson.Gson;


/**
 * Servlet implementation class AllTrainersServlet
 */
public class AllTrainersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllTrainersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println("Hii");
		int start=0;
		int count=3;
		int totalPages;
		String pageNo =request.getParameter("pageNo");
		System.out.println("page No is : "+pageNo);
		if(pageNo != null) {
			start=Integer.parseInt(pageNo)*count;
			System.out.println("start is : "+start);
			HttpSession session2 = request.getSession();
			session2.setAttribute("page", pageNo);
		}
		Session session = GetSessionFactory.getFactory().openSession();
		String hql="from Trainer";
		Query<Trainer> query = session.createQuery(hql,Trainer.class);
		query.setFirstResult(start);
		query.setMaxResults(count);
		List<Trainer> list = query.list();
		
		/*
		 * String hql2="select count(*) from Trainer"; Query query2 =
		 * session.createQuery(hql2); Long totalRecords = (Long) query2.uniqueResult();
		 * System.out.println("result is: "+ totalRecords); if(totalRecords % count !=
		 * 0) { totalPages=(int) ((totalRecords/count)+1); }else { totalPages=(int)
		 * ((totalRecords/count)); }
		 * System.out.println("Total pages are : "+totalPages);
		 */
		
		
		
		System.out.println(list);
		session.close();
		
		//session2.setAttribute("data", list);
		//session2.setAttribute("totalPages", totalPages);
		
		
		  String json = new Gson().toJson(list);
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
		  //response.sendRedirect("/OnlineFitness/Jsp/AllTrainer.jsp");
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
