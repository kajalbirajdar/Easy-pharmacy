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
 * Servlet implementation class Share_branded
 */
@WebServlet("/Share_branded")
public class Share_branded extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Share_branded() {
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
		PrintWriter pw = response.getWriter();
		String[] username = request.getParameterValues("Checkbox");
		String filename = request.getParameter("filename");
		HttpSession session = request.getSession(false);
		String name = (String) session.getAttribute("emailid");
		StringBuilder Medicine = new StringBuilder();
		try {
			Connection con = Dbconn.conn();
			int i = 0;
			Statement st = con.createStatement();
			String query1 = "select * from branded_searchdataset where User_Email_Id='"
					+ name + "' and Data_Name='" + filename + "'";
			ResultSet rs = st.executeQuery(query1);
			if (rs.next()) {
				Medicine.append(rs.getString("Composition_1")).append("\n");
			}

			for (String s : username) {

				SendMail.SendbrandedMedicine(s, Medicine.toString());

			}// for loop end

		} catch (Exception e) {
			e.printStackTrace();
		}

		pw.println("<html><script>alert('Medicine Share Success');</script><body>");
		pw.println("");
		pw.println("</body></html>");
		RequestDispatcher rd = request
				.getRequestDispatcher("/ShareMedicineData.jsp");
		rd.include(request, response);
	}

}
