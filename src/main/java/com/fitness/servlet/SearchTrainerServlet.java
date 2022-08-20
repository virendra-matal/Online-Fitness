package com.fitness.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import com.fitness.helper.GetSessionFactory;
import com.fitness.model.Trainer;
import com.google.gson.Gson;

/**
 * Servlet implementation class SearchTrainerServlet
 */
public class SearchTrainerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchTrainerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			String data = request.getParameter("key");
			System.out.println("Data is : "+data);
			
			Session session = GetSessionFactory.getFactory().openSession();
			String hql="from Trainer t where t.firstName like :letter "
					+ "or t.lastName like :letter";
			Query<Trainer> query = session.createQuery(hql,Trainer.class);
			query.setParameter("letter", "%"+data+"%");
			List<Trainer> trainers = query.list();
			System.out.println("data of search query is : "+trainers);
			session.close();
			String json = new Gson().toJson(trainers);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(json);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
