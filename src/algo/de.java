package algo;

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
 * Servlet implementation class de
 */
@WebServlet("/de")
public class de extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public de() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw=response.getWriter();
		String a,b,c;
	
		a=request.getParameter("txt_Uname");
		System.out.println("UserName"+a);
		b=request.getParameter("txt_Mname");
		System.out.println("Medicine Name"+b);
		c=request.getParameter("comment");
		System.out.println("Feed Back"+c);
		
		
		
		  try
		  {
			Connection con;
			con = Dbconn.conn();

			String sql="insert into tblfeedback(User_Email_Id,Medicine_Name,feedback_Data) values(?,?,?)";
			PreparedStatement p=(PreparedStatement) con.prepareStatement(sql);
			p.setString(1,a );
			p.setString(2, b);
			p.setString(3, c);
			
			
			int i=p.executeUpdate();
			Userinfo.countsavedata(con,b);
			
		}
		catch(Exception exc)
		{
			RequestDispatcher rd = request.getRequestDispatcher("/UserHome.jsp");
			rd.include(request, response);
			exc.printStackTrace();
		}
		  pw.println("<script> alert('Save Feed Back');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/UserHome.jsp");
			rd.include(request, response);
		
	}

}
