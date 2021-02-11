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
							<li><a href="Usershow.jsp">Show Data</a></li>
							<li ><a href="SearchFile.jsp">SearchWord</a></li>
         
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
   
<%
String medicinename=request.getParameter("name1");
%>
   
    <section id="feature" >
        <div class="container" style="width: 50%" align="center">
           <div >
                <h2><span>Share Medicine</span></h2>
               
         		<div >
         		<form name="shareFile" action="Share_branded" method="post">
         		<table class="table table-responsive table-bordered" align="center" border="1" style="width: 100%">
			<tr><td colspan="3" align="center">
					<h2>Select User Name For Share</h2></td>
				</tr>
         		<tr>
					<td colspan="2"><input type="hidden" name="filename" value="<%= medicinename %>" /></td>
					</tr>
					<tr>
					<td class="col-md-2" colspan="2"><label for="txt_Uname"><h3>Medicine Name</h3> </label>
					</td>
			<td class="col-md-2" ><label for="txt_Uname"> <h3><%= medicinename %></h3> </label></td>
			
			</tr>
			<tr>
			<td class="col-md-2" colspan="2" align="center"><label for="txt_Uname"><h3>User ID </h3></label></td>
			
			<td class="col-md-2" colspan="2" align="center"><label for="txt_Uname"><h3>Select User Name </h3></label></td>
			
		   </tr>
            <%
            TreeSet<String> al=new TreeSet<String>();
            String emailid=(String)session.getAttribute("emailid");
           
            Connection con = Dbconn.conn();
            Statement st = con.createStatement();
int count=0;
            ResultSet rs;
            rs = st.executeQuery("select * from  userregistration");
            while(rs.next())
            {
            	if (!emailid.equals(rs.getString("Uemail"))) {
					%>
					<tr>
			<td class="col-md-2" colspan="2" align="center">
					<b><%=rs.getString("IdUser")%></b>
</td>
			<td class="col-md-2" colspan="2" align="left">
					<input type="checkbox" name="Checkbox"
						value="<%=rs.getString("Uemail")%>" /><b><%=rs.getString("Uname")%></b>
</td>
					<%
						}

            }
            %>
            </tr>
	<tr>
			<td class="col-md-2" colspan="3" align="center">
					<input type="submit" name="Submit" value=" Share"  />
					</td>
						</tr>
	
	</table>
	</form>
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