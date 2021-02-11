<%@page import="java.sql.ResultSet"%>
<%@page import="com.connection.Dbconn"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.activity.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<title>Easy pharmacy-generic medicine project</title>

<!-- core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/animate.min.css" rel="stylesheet">
<link href="css/prettyPhoto.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
</head>
<body class="homepage">

	<header id="header">
	<div class="top-bar">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-xs-4">
					<nav class="navbar navbar-inverse" role="banner">
					<div class="container">
						<div class="navbar-header center wow fadeInDown">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span> <span
									class="icon-bar"></span> <span class="icon-bar"></span> <span
									class="icon-bar"></span>
							</button>
							<jsp:include page="title.jsp"></jsp:include>	</div>
						</div>
						</nav>
				
					<!--/nav-->
				</div>

			</div>
		</div>
		<!--/.container-->
	</div>
</header>
	<!--/.top-bar--> <nav class="navbar navbar-inverse" role="banner">
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
	</div>
	<!--/.container--> </nav><!--/nav-->

	</div>
	<!--/.container--> </header>
	<!--/header-->


	<section id="feature">
	<div class="container">
		<div class="center wow fadeInDown">
			<h2>SEARCH WORD</h2>
			 
			 <div class="col-md-8 col-md-offset-2">
			<form role="form" action="SearchFile" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered" >
	       <tr>
			<td class="col-md-2"><label for="txt_Uname">Search Word:</label></td>
		    <td class="col-md-4"><input type="text" style="border-color: gray;" class="form-control"  name="txt_search" id="txt_search" /></td>
		    
			<td class="col-md-2" colspan="2" align="center" ><input type="submit"  class="btn-primary" name="btn_Submit" id="btn_Submit" Value="Search"></td>
			
			</tr>
			</table>
		
			</div>
			</form> 			
			
			<%
String action="";
action=(String)session.getAttribute("search");
String searchingname=request.getParameter("txt_search");

System.out.println(action+"=>"+searchingname);
if(searchingname==null ){

	
}
else
{
	session.setAttribute("search", searchingname);	
	
	%>
	<table class="table table-responsive table-bordered">
	<tr>
	<td align="left"><a href="GenericSearchFile.jsp">Generic Search DataSet</a></td>
	<td align="center"><a href="BrandedSearchFile.jsp">Branded Search DataSet</a></td>
	</tr>
	

</table>
<%

}
					%>
		</div>
		<div class="row">
			<div class="features"></div>
			<!--/.services-->
		</div>
		<!--/.row-->
	</div>
	<!--/.container--> </section>
	<!--/#feature-->
		
	<footer id="footer" class="midnight-blue"> </footer>
	<!--/#footer-->

	<script src="js/jquery.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.prettyPhoto.js"></script>
	<script src="js/jquery.isotope.min.js"></script>
	<script src="js/main.js"></script>
	<script src="js/wow.min.js"></script>
</body>
</html>