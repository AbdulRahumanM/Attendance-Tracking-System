<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import="java.util.ResourceBundle" %>
    <%
    if ((session.getAttribute("user") == null) ) {
     response.sendRedirect("index.jsp");
    }
    else if(session.getAttribute("usertype") == "a")
		response.sendRedirect("AdminHome.jsp");
	
%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0"> 
<link rel="shortcut icon" href="favicon.ico" type="image/icon">
<link rel="icon" href="favicon.ico" type="image/icon">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="Styles.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<title>Employee Portal</title>
</head>
<body>
<% ResourceBundle rsc =ResourceBundle.getBundle("LangBundle.LangBundle",request.getLocale()); %>

<nav class="navbar navbar-inverse navbar-fixed-top">
<div class="container-fluid">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>                      
      </button>
      <a class="navbar-brand" href="#">ATS<span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="logoutServlet"><span class="glyphicon glyphicon-log-out"></span><% out.print(rsc.getString("logout")); %></a></li>
    	</ul>
	  </div>
	</div>
</div>
</nav>
<img src="Images/bg1.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width:100%; height:100%; max-width: none; z-index: -999999; left: -3.75px; top: 0px;">
<section id="welcome">
<% out.print(rsc.getString("wel")); %> &nbsp;<span class="glyphicon glyphicon-user"></span></section>
<div class="content2">
<p><span class="glyphicon glyphicon-copyright-mark"></span><img src="favicon.ico" alt=""> successfactors.com<p>
</div>
</body>
</html>