<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.activity.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">	
<head>
    <meta>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Medicine Project</title>
	
	<!-- core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/font-awesome.min.css" rel="stylesheet">
    <link href="css/animate.min.css" rel="stylesheet">
    <link href="css/prettyPhoto.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/responsive.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->       
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->

<body >
<header id="header">
        <div class="top-bar">
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-xs-4">
                 <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                <div class="navbar-header center wow fadeInDown">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
						
						<jsp:include page="title.jsp"></jsp:include>
						 </div>
		
		</nav><!--/nav-->      
                    </div>
                   
                </div>
            </div><!--/.container-->
        </div><!--/.top-bar-->

        <nav class="navbar navbar-inverse" role="banner">
            <div class="container">
                
                <div class="collapse navbar-collapse ">
                    <ul class="nav navbar-nav">
                          <li class="active"><a href="UserHome.jsp">Home</a></li>
							<li><a href="Usershow.jsp">Generic Show Data</a></li>
							<li><a href="User_brandedshow.jsp">Branded Show Data</a></li>
							<li ><a href="SearchFile.jsp">SearchWord</a></li>
         <li ><a href="ShareMedicineData.jsp">Share</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("name")%><i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="Login">Logout</a></li> 
                            </ul>
                        </li>
                        
                                               
                    </ul>
                </div>
            </div><!--/.container-->
        </nav><!--/nav-->
		
            </div><!--/.container-->
        		
    </header><!--/header-->
   

   
    <section id="feature" >
        <div class="container" style="width: 50%" align="center">
           <div >
                <h2><span>Feed Back</span></h2>
               
         		<div >
            <%
            TreeSet<String> al=new TreeSet<String>();
            TreeSet<String> al1=new TreeSet<String>();
            String emailid=(String)session.getAttribute("emailid");
            
            Connection con = Dbconn.conn();
            Statement st = con.createStatement();
int count=0;
            ResultSet rs;
            rs = st.executeQuery("select * from  generic_searchdataset where User_Email_Id='"+emailid+"'");
            while(rs.next())
            {
            	System.out.println(rs.getString("Data_Name"));
            	al.add(rs.getString("Data_Name"));
            }
            //
            Statement st1 = con.createStatement();

            ResultSet rs1;
            rs1 = st1.executeQuery("select * from  branded_searchdataset where User_Email_Id='"+emailid+"'");
            while(rs1.next())
            {
            	
            	al1.add(rs1.getString("Data_Name"));
            }
            
            %>
            <table class="table table-responsive table-bordered">
	<tr>
	<td align="left" ><a href="GenericSearchFile.jsp">Generic Search DataSet</a></td>
	<td align="center" ><a href="BrandedSearchFile.jsp">Branded Search DataSet</a></td>
	</tr>
	<tr>
	<td align="left">
	<%
	Iterator itr= al.iterator(); 
	while(itr.hasNext())
	{
		String na=itr.next().toString();
	%>
	<%=na %>
	
	<a href="User_ShareMedicineData.jsp?name1=<%=na%>"><input type="button" name="Download" value="Share" class="btn btn-info">
						</a>
						<br/>
						<br/>
	<%
	}
	%>
	
	</td>
	<td align="left">
	<%
	Iterator itr1= al1.iterator(); 
	while(itr1.hasNext())
	{
		String na=itr1.next().toString();
	%>
	<%=na %>
	<a href="User_Share_branded_MedicineData.jsp?name1=<%=na%>"><input type="button" name="Download" value="Share" class="btn btn-info">
						</a><br/>
						<br/>
						
	<%
	}
	%>
	</td>
	</tr>
	
	</table>
	
		</div> 
            
            
            </div>
         
            </div>

        </div><!--/.container-->
    </section><!--/#feature-->




    <section id="bottom">
        <div class="container wow fadeInDown" data-wow-duration="1000ms" data-wow-delay="600ms">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                   
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                     
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                      
                </div><!--/.col-md-3-->

                <div class="col-md-3 col-sm-6">
                       
                </div><!--/.col-md-3-->
            </div>
        </div>
    </section><!--/#bottom-->

    <footer id="footer" class="midnight-blue">
        <div class="container">
            
        </div>
        
    </footer><!--/#footer-->

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.prettyPhoto.js"></script>
    <script src="js/jquery.isotope.min.js"></script>
    <script src="js/main.js"></script>
    <script src="js/wow.min.js"></script>
</body>
</html>