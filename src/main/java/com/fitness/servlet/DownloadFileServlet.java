package com.fitness.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownloadFileServlet
 */
public class DownloadFileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DownloadFileServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String filename = request.getParameter("cv");
		System.out.println(filename);

		String path = "\\\\LAPTOP-9HDFMHNU\\Images";
		response.setContentType("application/pdf");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");
		FileInputStream inputStream = new FileInputStream(path + File.separator + filename);
		int i;
		while ((i = inputStream.read()) != -1) {
			out.write(i);
			//System.out.println(i);
		}
//		System.out.println(i);
		inputStream.close();
		out.close();
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
