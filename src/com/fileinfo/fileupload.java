package com.fileinfo;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.connection.Dbconn;

/**
 * Servlet implementation class fileupload
 */
@WebServlet("/fileupload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50)
public class fileupload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public static Connection con;
	
	public fileupload() {
		super();
		//
	}

	String getFileName(Part filePart) {
		for (String cd : filePart.getHeader("content-disposition").split(";")) {
			if (cd.trim().startsWith("filename")) {
				String fileName = cd.substring(cd.indexOf('=') + 1).trim()
						.replace("\"", "");
				return fileName.substring(fileName.lastIndexOf('/') + 1)
						.substring(fileName.lastIndexOf('\\') + 1);
			}
		}
		return null;

	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		//
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@SuppressWarnings("unused")
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		InputStream inputStream = null;
		Connection con;
		HttpSession session = request.getSession(false);
		Part filePart = request.getPart("txt_search");
		String fileName = getFileName(filePart);
		long size = filePart.getSize();
		inputStream = filePart.getInputStream();
		// System.out.print("File" + filePart);
		System.out.print("\nFileName:-" + fileName);
		System.out.print("\nFileSize:-" + size);
		BufferedReader br = null;
	    String line = "";
	    int i=0;
        String cvsSplitBy = ",";
		try {
				con = Dbconn.conn();
			 br = new BufferedReader(new InputStreamReader(inputStream));
	            while ((line = br.readLine()) != null) {

	                // use comma as separator
	                String[] data = line.split(cvsSplitBy);

	                System.out.println("Name=> " + data[0] + "\t Composition_1=" + data[1] + "\t Composition_2=>"+ data[2] +"\t Composition_3+>"+data[3]+"\t Price =>"+data[5]);
	                if(i==0)
	                {}
	                else{

					String sql="insert into branded_filedataset(Data_Name,Composition_1,Composition_2,Composition_3,Composition_4,Price) values(?,?,?,?,?,?)";
					PreparedStatement p=(PreparedStatement) con.prepareStatement(sql);
					
					
					p.setString(1,data[0].replace("%",""));
					p.setString(2,data[1].replace("%",""));
					p.setString(3,data[2].replace("%",""));
					p.setString(4,data[3].replace("%",""));
					p.setString(5,data[4].replace("%",""));
					p.setString(6,data[5]);
					p.executeUpdate();
					}
i++;
	            }
	
		} catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
		RequestDispatcher rd = request.getRequestDispatcher("/AdminHome.jsp");
		rd.include(request, response);
	}
}