package com.fitness.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.fitness.helper.GetSessionFactory;
import com.google.gson.Gson;

/**
 * Servlet implementation class GetCountTillRecordServlet
 */
public class GetCountTillRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetCountTillRecordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		Session session = GetSessionFactory.getFactory().openSession();
		
		String hql="SELECT COUNT(*) FROM Trainer t WHERE t.trainerId  <= (SELECT a.trainerId FROM Trainer a WHERE a.trainerId=:id)";
		Query query = session.createQuery(hql);
		query.setParameter("id", id);
		Long totalRecords = (Long) query.uniqueResult();
		System.out.println("Total Counts of Records: "+totalRecords);
		
		int pageNumber=0,count=3;
		
		if(totalRecords % count != 0) {
			pageNumber=(int) ((totalRecords/count)+1);
		}else {
			pageNumber=(int) ((totalRecords/count));
		}
		String json = new Gson().toJson(pageNumber);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
		
		
		
		session.close();
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
