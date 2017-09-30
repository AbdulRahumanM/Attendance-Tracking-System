<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ResourceBundle" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.*" %>
<%
    if ((session.getAttribute("user") == null) ) {
     response.sendRedirect("index.jsp");
    }
    else if(session.getAttribute("usertype") == "e")
 		response.sendRedirect("EmployeeHome.jsp");

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0"> 
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet" href="Styles.css">
<link rel="shortcut icon" href="favicon.ico" type="image/icon">
<link rel="icon" href="favicon.ico" type="image/icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 <style>
  	  body {
        position: relative; 
  	  }
	  #section1 {padding-top:50px;height:500px;color: #000; background-color: #d2dfdf;}
	  #section2 {padding-top:50px;height:500px;color: #000; background-color: #d2dfdf;}
	  #section3 {padding-top:50px;height:500px;color: #000; background-color: #d2dfdf;}
	  #section4 {padding-top:50px;height:500px;color: #000; background-color: #d2dfdf;}
	  #section5 {padding-top:50px;height:500px;color: #000; background-color: #d2dfdf;}
  </style>
<title>Admin Home</title>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="197">
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
        <ul class="nav navbar-nav">
          <li><a href="#section1"><span class="glyphicon glyphicon-group"></span><% out.print(rsc.getString("info")); %></a></li>
          <li><a href="#section2"><% out.print(rsc.getString("newemp")); %></a></li>
          <li><a href="#section3"><% out.print(rsc.getString("delemp")); %></a></li>
          <li><a href="#section4"><% out.print(rsc.getString("upemp")); %></a></li>
          <li><a href="#section5"><% out.print(rsc.getString("tracker")); %></a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
          <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span><% out.print(rsc.getString("logout")); %></a></li>
    	</ul>
	  </div>
	</div>
</div>
</nav>
<section id="welcome">
<% out.print(rsc.getString("wel")); %> Admin &nbsp;<span class="glyphicon glyphicon-user"></span>
</section>
<div class="loader"></div>
<% 
	            Connection connection = DriverManager.getConnection(
	                "jdbc:oracle:thin:@localhost:1521:xe", "system", "pwd");
	
	            Statement statement = connection.createStatement() ;
	            ResultSet resultset = statement.executeQuery("select username,empname,mob from ats_users") ; 
%>
	    <section id="table-top">
	    <div id="section1" class="container-fluid">
	        <div class="table-responsive">
	        <table class="table table-striped" border="1" width ="400">
	            <tr bgcolor="grey">
	            <th style="text-align:center"><span class="glyphicon glyphicon-list"></span>&nbsp; <% out.print(rsc.getString("empid")); %></th>
	            <th style="text-align:center"><span class="glyphicon glyphicon-user"></span>&nbsp; <% out.print(rsc.getString("empname")); %></th>
	            <th style="text-align:center"><span class="glyphicon glyphicon-phone"></span>&nbsp; <% out.print(rsc.getString("mob")); %></th>
	            </tr>
	            <% while(resultset.next()){ %>
	            <tr bgcolor="lightgrey">
	                <td align="center"> <%= resultset.getString(1) %></td>
	                <td align="center"> <%= resultset.getString(2) %></td>
	                <td align="center"> <%= resultset.getString(3) %></td>
	            </tr>
	            <% } %>
	       <% connection.close(); 
	          statement.close();
	        %>
	        </table>
	        </div>
	     </div>
	     </section>
	     <div class="divider"></div>
	<div id="section2" class="container-fluid">
			<div class="col-lg-12 box" align="center">
				<form action="addEmployeeServlet" method="GET">
					   <div class="form-group" align="center">
					   <label for="name"><% out.print(rsc.getString("empname")); %></label>
			           <input type="text" name="name" placeholder ="<% out.print(rsc.getString("empname")); %>" required="true"/><br>
			           </div>
			           <div class="form-group" align="center">
			           <label for="number"><% out.print(rsc.getString("mob")); %>&nbsp;</label>
			           <input type="text" name="number" placeholder ="<% out.print(rsc.getString("mob")); %>" required="true" /><br>
			           </div>
			           <div class="form-group" align="center">
			           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
			           <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span><b>&nbsp; <% out.print(rsc.getString("add")); %></b></button>
			           </div>
			    </form>
		    </div>
	</div>
	<div id="section3" class="container-fluid">
	    	<div class="col-lg-12 box" align="center">
			    <form action="deleteEmployeeServlet" method="GET">
			      	   <div class="form-group" align="center">
			      	   <label for="name"><% out.print(rsc.getString("empid")); %></label>
			           <input type="number" name="name" placeholder ="<% out.print(rsc.getString("empid")); %>" required="true" />
			           </div>
			           <div class="form-group" align="center">
			           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;  &nbsp; &nbsp; &nbsp; 
			           <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-trash"></span><b>&nbsp; <% out.print(rsc.getString("del")); %></b></button>
			    	   </div>
			    </form>
			</div>
	</div>
	<div id="section4" class="container-fluid">
			    <div class="col-lg-12 box" align="center">
			    <form action="updateEmployeeServlet" method="get">
		       		<div class="form-group" align="center">
		       		<label for="name"><% out.print(rsc.getString("empid")); %>&nbsp; &nbsp; &nbsp;</label>
		           <input type="number" name="name" placeholder ="<% out.print(rsc.getString("empid")); %>" required="true"/><br>
		           </div>
		           <div class="form-group" align="center">
		           <label for="number"><% out.print(rsc.getString("mob")); %>&nbsp;&nbsp;&nbsp;</label>
		           <input type="number" name="number" placeholder ="<% out.print(rsc.getString("mob")); %>" required="true" /><br>
		           </div>
		           <div class="form-group" align="center">
		           &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
		           <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-edit"></span><b>&nbsp; <% out.print(rsc.getString("up")); %></b></button>
				   </div>
		       </form>
		       </div>
	</div>
	<div id="section5" class="container-fluid">
		<div class="row box" align="center">
		       <div class="col-lg-6" style="float:left;">
		           <form action="Track.jsp" method="get">
			       <div class="form-group" align="center">
			       <h3><b><% out.print(rsc.getString("trackid")); %></b></h3>
			       		<div class="txt">
		           		<label for="id"><% out.print(rsc.getString("empid")); %>&nbsp; &nbsp;</label>
		           		</div>
		           	<input type="text" name="id" placeholder ="<% out.print(rsc.getString("empid")); %>" required="true"/><br>
		           </div>
		           <div class="form-group" align="center">
		           <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-time"></span><b>&nbsp; <% out.print(rsc.getString("track")); %></b></button>
		           </div>
			       </form>
			    </div>
			    <div class="col-lg-6" style="float:right">
			    	<form action="Trackbydate.jsp" method="get">
			       <div class="form-group" align="center">
			       <h3><b><% out.print(rsc.getString("trdate")); %></b></h3>
			       <div class="txt">
		           <label for="id"><% out.print(rsc.getString("dateenter")); %>&nbsp; &nbsp;</label></div>
		           <input type="text" name="date" placeholder ="DD/MM/YYYY" required="true"/><br>
		           </div>
		           <div class="form-group" align="center">
		           <button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-calendar"></span><b>&nbsp;&nbsp; <% out.print(rsc.getString("trdate")); %></b></button>
		           </div>
			       </form>
			    </div>
		</div>
	</div>
<div class="content2">
<p><span class="glyphicon glyphicon-copyright-mark"></span><img src="favicon.ico" alt=""> successfactors.com<p>
</div>

		    </body>
</html>