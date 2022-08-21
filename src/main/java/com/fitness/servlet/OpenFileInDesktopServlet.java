package com.fitness.servlet;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class OpenFileInDesktopServlet
 */
public class OpenFileInDesktopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OpenFileInDesktopServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String filename = request.getParameter("cv");

		String path = "\\\\LAPTOP-9HDFMHNU\\Images";
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		File file = new File(path + File.separator + filename);
		if (!Desktop.isDesktopSupported())// check if Desktop is supported by Platform or not
		{
			System.out.println("not supported");
			return;
		}
		Desktop desktop = Desktop.getDesktop();
		if (file.exists()) { // checks file exists or not
			desktop.open(file); // opens the specified file
	}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
