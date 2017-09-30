<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ResourceBundle" %>
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
<title>ATS-Features</title>
<style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      width: 70%;
      margin: auto;
  }
  </style>
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
      <a class="navbar-brand" href="index.jsp">ATS</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="index.jsp"><% out.print(rsc.getString("Home")); %></a></li>
        <li class="active"><a href="#"><% out.print(rsc.getString("Featur")); %></a></li>
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

<div class="container">
  <br>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
      <li data-target="#myCarousel" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="Images/Carousel1.jpg" alt="Manage Employees" width="500" height="400">
      </div>

      <div class="item">
        <img src="Images/Carousel2.jpg" alt="Employee Information" width="500" height="400">
      </div>
    
      <div class="item">
        <img src="Images/Carousel3.jpg" alt="Track attendance and behaviour change" width="500" height="400">
      </div>

      <div class="item">
        <img src="Images/carousel4.jpg" alt="Mobile Responsive" width="500" height="400">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<div class="container-fluid">
<div class="content2">
<p><span class="glyphicon glyphicon-copyright-mark"></span><img src="favicon.ico" alt=""> successfactors.com<p>
</div>
</div>
</body>
</html>