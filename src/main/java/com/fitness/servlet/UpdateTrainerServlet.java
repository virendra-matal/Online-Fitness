package com.fitness.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.fitness.helper.GetSessionFactory;
import com.fitness.model.Trainer;

/**
 * Servlet implementation class UpdateTrainerServlet
 */
public class UpdateTrainerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTrainerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("post mapping");
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.println("Id id: "+id);
		try {
			Session session = GetSessionFactory.getFactory().openSession();
			
			Trainer trainer = session.get(Trainer.class, id);
			System.out.println(trainer);
			
			session.close();
			HttpSession session2 = request.getSession();
			session2.setAttribute("Trainer", trainer);
			response.sendRedirect("/OnlineFitness/Jsp/TrainerForm.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Put mapping");
		int id = Integer.parseInt(req.getParameter("id"));
		System.out.println("Id id: "+id);
		
	}

}
