package com.admininfo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class brandeddatasave
 */
@WebServlet("/brandeddatasave")
public class brandeddatasave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public brandeddatasave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		String a,b,c,d,e,f;
	
		a=request.getParameter("txt_Gname");
		b=request.getParameter("txt_Gname1");
		c=request.getParameter("txt_Gname2");
		d=request.getParameter("txt_Gname3");
		e=request.getParameter("txt_Gname4");
		f=request.getParameter("txt_Gname5");
		
		
		  try
		  {
			Connection con;
			con = Dbconn.conn();

			String sql="insert into branded_filedataset(Data_Name,Composition_1,Composition_2,Composition_3,Composition_4,Price) values(?,?,?,?,?,?)";
			PreparedStatement p=(PreparedStatement) con.prepareStatement(sql);
			
			
			p.setString(1,a );
			p.setString(2, b);
			p.setString(3, d);
			p.setString(4, c);
			p.setString(5, e);
			p.setString(6, f);
			p.executeUpdate();
		  }
		  catch(Exception exc)
			{
				
				exc.printStackTrace();
			}
		  RequestDispatcher rd = request.getRequestDispatcher("/AdminHome.jsp");
			rd.include(request, response);
	}

}
