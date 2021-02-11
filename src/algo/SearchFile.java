package algo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.connection.Dbconn;

/**
 * Servlet implementation class SearchFile
 */
@WebServlet("/SearchFile")
public class SearchFile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		PrintWriter pw = response.getWriter();
		 String emailid=(String)session.getAttribute("emailid");
		String searchingname = request.getParameter("txt_search");
		session.setAttribute("search", searchingname);
		Connection con;
		try {
			CosineSimilarity cs = new CosineSimilarity();
			con = Dbconn.conn();
			Statement stRegister = con.createStatement();
			Statement stR = con.createStatement();
			Statement st = con.createStatement();
			
			st.executeUpdate("TRUNCATE table generic_searchdataset");
			st.executeUpdate("TRUNCATE table branded_searchdataset");
			ResultSet rsLogin;
			rsLogin = stRegister.executeQuery("select * from generic_filedataset");
			while (rsLogin.next()) {
				String Composition_1 = rsLogin.getString("Data_Name");
				String id = rsLogin.getString("id");
				double total = cs.GetSimilarity(Composition_1,searchingname);
				
				if(total>=0.75)
				{
					Userinfo.savedata(id,con,total,emailid);
					System.out.println("ID=>"+id+"\t Score=>"+total);
				}
				
			}
			
			///
			ResultSet rs;
			rs = stR.executeQuery("select * from branded_filedataset");
			while (rs.next()) {
				String Composition_1 = rs.getString("Data_Name");
				String id = rs.getString("id");
				double total = cs.GetSimilarity(Composition_1,searchingname);
				
				if(total>=0.75)
				{
					Userinfo.savebrandeddata(id,con,total,emailid);
					System.out.println("ID=>"+id+"\t Score=>"+total);
				}
				
			}
			
			
			
			
			
		} catch (Exception e) {
			pw.println("<script> alert(' Unexpected Error');</script>");
			RequestDispatcher rd = request
					.getRequestDispatcher("/UserHome.jsp");
			rd.include(request, response);
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request
				.getRequestDispatcher("/SearchFile.jsp");
		rd.include(request, response);
	}

}
