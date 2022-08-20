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
		Session session = GetSessionFactory.getFactory().openSession();
		String hql="from Trainer";
		Query<Trainer> query = session.createQuery(hql,Trainer.class);
		List<Trainer> list = query.list();
		
		System.out.println(list);
		session.close();
		HttpSession session2 = request.getSession();
		session2.setAttribute("data", list);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
