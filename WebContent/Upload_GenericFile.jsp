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
    <link rel="shortcut icon" href="images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="images/ico/apple-touch-icon-57-precomposed.png">
</head><!--/head-->
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
							<jsp:include page="title.jsp"></jsp:include>
								</div>
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
			<jsp:include page="adminmenu.jsp"></jsp:include>
		</div>
	</div>
	<!--/.container--> </nav><!--/nav-->

	</div>
	<!--/.container--> </header>
	<!--/header-->


	<section id="feature">
	<div class="container">
		<div class="center wow fadeInDown">
			<h2>Upload Dataset Generic</h2>
			 
			 <div class="col-md-8 col-md-offset-2">
			<form enctype="multipart/form-data"  action="fileupload_generic" method="post">
			<div class="form-group">
			<table class="table table-responsive table-bordered" width="100%" >
	       <tr>
			<td width="30%"><label for="txt_Uname">Select File Path:</label></td>
		    <td width="30%" ><input type="file" style="border-color: gray;"  name="txt_search" id="txt_search" /></td>
		  <td   align="left" ><input type="submit"  name="btn_Submit" id="btn_Submit" Value="Submit"><br>
			</td>
			</tr>
			</table>
		
			</div>
			</form> 			
			
			
			</div>
		</div>
		<div class="row">
			<div class="features"></div>
			<!--/.services-->
		</div>
		<!--/.row-->
	</div>
	 </section>
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