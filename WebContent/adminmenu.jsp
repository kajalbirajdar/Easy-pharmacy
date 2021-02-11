<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<ul class="nav navbar-nav">
                       
                       	<li><a href="AdminFileUpload.jsp">Upload_BrandedFile</a></li>
                       	<li><a href="Upload_GenericFile.jsp">Upload_GenericFile</a></li>
							<!-- <li><a href="Adminshow.jsp">Show Branded Data</a></li>
							<li><a href="Admin_generic_show.jsp">Show Generic Data</a></li> -->
							<li><a href="GenericDataUpload.jsp">Upload_Generic Data</a></li>
							<li><a href="BrandedDataUpload.jsp">Upload_Branded Data</a></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><%=session.getAttribute("adminname")%><i class="fa fa-angle-down"></i></a>
                            <ul class="dropdown-menu">
                                <li><a href="Login">Logout</a></li> 
                            </ul>
                        </li>
                        
                                               
                    </ul>
</body>
</html>