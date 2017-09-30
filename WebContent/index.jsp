<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ResourceBundle" %>
    <%
    if ((session.getAttribute("user") != null) ) {
    	if(session.getAttribute("usertype") == "a")
    		response.sendRedirect("AdminHome.jsp");
    	else if(session.getAttribute("usertype") == "e")
     		response.sendRedirect("EmployeeHome.jsp");
    	else
    		response.sendRedirect("logout.jsp");
    }
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0"> 
<link rel="shortcut icon" href="favicon.ico" type="image/icon">
<link rel="icon" href="favicon.ico" type="image/icon">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="Styles.css">
<title>Attendance Tracker System</title>
</head>
<body>
<% ResourceBundle rsc =ResourceBundle.getBundle("LangBundle.LangBundle",request.getLocale()); %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">ATS</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"><% out.print(rsc.getString("Home")); %></a></li>
        <li><a href="Features.jsp"><% out.print(rsc.getString("Featur")); %></a></li>
        <li><a href="Architecture.jsp"><% out.print(rsc.getString("Arch")); %></a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<form class="form-inline" method="post" action="loginServlet">
      	<div class="form-group">
      	<label for="name"><font color="white"><% out.print(rsc.getString("empid")); %></font></label>
		<input type="number" name="name" placeholder="<% out.print(rsc.getString("empid")); %>" required="true"/>
		</div>
		<div class="form-group">
		<label for="password"><font color="white"><% out.print(rsc.getString("pwd")); %></font></label>
		<input type="password" name="password" placeholder="<% out.print(rsc.getString("pwd")); %>" required="true"/>
		</div>
        <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-log-in"></span>&nbsp; <% out.print(rsc.getString("login")); %></button>
        </form>
      </ul>
    </div>
  </div>
</nav>
<img src="Images/bg1.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width:100%; height:100%; max-width: none; z-index: -999999; left: -3.75px; top: 0px;">
<div class="container-fluid">
<div class="col-sm-3">
<div class="content">
<h1><center><% out.print(rsc.getString("Greeting")); %></center></h1>
<h3 align="justify"><% out.print(rsc.getString("desc")); %>
</h3></div>
</div>

<div class="content2">
<p><span class="glyphicon glyphicon-copyright-mark"></span><img src="favicon.ico" alt=""> successfactors.com<p>
</div>

</body>
</html>