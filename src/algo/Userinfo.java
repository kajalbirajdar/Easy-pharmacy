package algo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;

import com.connection.Dbconn;
import com.mysql.jdbc.PreparedStatement;

public class Userinfo {

	public static void savedata(String id,Connection con,double Score,String User_Email_Id)
	{
		
		try {
			Statement stRegister = con.createStatement();
			ResultSet rs;
			String Data_Name="";
			String Price="";
			String Composition="";
			
			rs = stRegister.executeQuery("select * from generic_filedataset where id='"+id+"'");
			if(rs.next()) {
				Data_Name=rs.getString("Data_Name");
				
				Price=rs.getString("Price");
				String a=rs.getString("Composition_1");
				String b=rs.getString("Composition_2");
				String c=rs.getString("Composition_3");
				String d=rs.getString("Composition_4");
				Composition=a+","+b+","+c+","+d;
				
			}
			String[] Compositionlist=Composition.split(",");
			for(int i=0;i<Compositionlist.length;i++)
			{
				String Composition_1=Compositionlist[i];
				String sql="insert into generic_searchdataset(Data_Name,Composition_1,Price,Score,User_Email_Id) values(?,?,?,?,?)";
				PreparedStatement p=(PreparedStatement) con.prepareStatement(sql);
				
				
				p.setString(1,Data_Name);
				p.setString(2, Composition_1);
				p.setString(3, Price);
				p.setString(4, String.valueOf(Score));
				p.setString(5,User_Email_Id);
				p.executeUpdate();
			}
		} catch (Exception e) {
						e.printStackTrace();
		}
		
		
	}
	public static void savebrandeddata(String id,Connection con,double Score,String User_Email_Id)
	{
		
		try {
			Statement stRegister = con.createStatement();
			ResultSet rs;
			String Data_Name="";
			String Price="";
			String Composition="";
			
			rs = stRegister.executeQuery("select * from branded_filedataset where id='"+id+"'");
			if(rs.next()) {
				Data_Name=rs.getString("Data_Name");
				
				Price=rs.getString("Price");
				String a=rs.getString("Composition_1");
				String b=rs.getString("Composition_2");
				String c=rs.getString("Composition_3");
				String d=rs.getString("Composition_4");
				Composition=a+","+b+","+c+","+d;
				
			}
			String[] Compositionlist=Composition.split(",");
			for(int i=0;i<Compositionlist.length;i++)
			{
				String Composition_1=Compositionlist[i];
				String sql="insert into branded_searchdataset(Data_Name,Composition_1,Price,Score,User_Email_Id) values(?,?,?,?,?)";
				PreparedStatement p=(PreparedStatement) con.prepareStatement(sql);
				
				
				p.setString(1,Data_Name);
				p.setString(2, Composition_1);
				p.setString(3, Price);
				p.setString(4, String.valueOf(Score));
				p.setString(5,User_Email_Id);
				p.executeUpdate();
			}
		} catch (Exception e) {
						e.printStackTrace();
		}
		
		
	}

	public static void countsavedata(Connection con,String medicinename)
	{
		
		try {
			Statement stRegister = con.createStatement();
			Statement st = con.createStatement();
			ResultSet rs;
			
			int count=0;
			
			rs = stRegister.executeQuery("select * from tblfeedback where Medicine_Name='"+medicinename+"'");
			if(rs.next()) {
				
				count=rs.getInt("User_count");
				
				
			}
			int count1=count+1;
			st.executeUpdate("update tblfeedback  set User_count='"+count1+"' where Medicine_Name='"+medicinename+"'");
				
			
		} catch (Exception e) {
						e.printStackTrace();
		}
		
		
	}
	public static void main(String args[])
	{
		try
		  {
			TreeSet<String> al=new TreeSet<String>(); 
			al.add("Ravi");
			 al.add("Vijay"); 
			al.add("Ravi"); 
			al.add("Ajay");
			 Iterator itr= al.iterator(); 
			while(itr.hasNext())
			{ 
			System.out.println(itr.next()); 
			}
			
		}
		catch(Exception exc)
		{
			
		}
	           
	}
	
}
