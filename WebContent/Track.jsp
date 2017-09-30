<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.PrintWriter" %>
<%@ page import = "java.util.*" %>
<%@ page import="java.util.ResourceBundle" %>
<%
    if ((session.getAttribute("user") == null) ) {
     response.sendRedirect("index.jsp");
    }
    else if(session.getAttribute("usertype") == "e")
 		response.sendRedirect("EmployeeHome.jsp");

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<META Http-Equiv="Cache-Control" Content="no-cache">
<META Http-Equiv="Pragma" Content="no-cache">
<META Http-Equiv="Expires" Content="0"> 
<link rel="shortcut icon" href="favicon.ico" type="image/icon">
<link rel="icon" href="favicon.ico" type="image/icon">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="Styles.css">
<title>ATS Tracker</title>
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
      <a class="navbar-brand" href="AdminHome.jsp">ATS<span class="glyphicon glyphicon-home"></span></a>
    </div>
    <div>
      <div class="collapse navbar-collapse" id="myNavbar">
        <ul class="nav navbar-nav">
          <li><a href="AdminHome.jsp"><span class="glyphicon glyphicon-group"></span><% out.print(rsc.getString("info")); %></a></li>
          <li><a href="AdminHome.jsp#section2"><% out.print(rsc.getString("newemp")); %></a></li>
          <li><a href="AdminHome.jsp#section3"><% out.print(rsc.getString("delemp")); %></a></li>
          <li><a href="AdminHome.jsp#section4"><% out.print(rsc.getString("upemp")); %></a></li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
          <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span><% out.print(rsc.getString("logout")); %></a></li>
    	</ul>
	  </div>
	</div>
</div>
</nav>
<img src="Images/bg1.jpg" style="position: absolute; margin: 0px; padding: 0px; border: none; width:100%; height:100%; max-width: none; z-index: -999999; left: -3.75px; top: 0px;">
<br>
<br>
<br>
<div class="table-responsive container-fluid">
<div class="content1">
<table width ="750">
            <tr bgcolor="olivegreen">
            <th><% out.print(rsc.getString("date")); %></th>
            <th><% out.print(rsc.getString("in")); %> &nbsp;&nbsp;</th>
            <th><% out.print(rsc.getString("out")); %> &nbsp;&nbsp;</th>
            <th><% out.print(rsc.getString("wh")); %></th>
            </tr>
        
<%
String name = request.getParameter("id");
int userName = Integer.parseInt(name);
Connection conn = DriverManager.getConnection(
		"jdbc:oracle:thin:@localhost:1521:xe","system",
		"pwd");
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery("select logdate,intime,outtime from ats_track where username = "+ userName +" order by logdate asc");
ArrayList<Double> wh = new ArrayList<Double>();
while(rs.next())
{
	String date = rs.getString(1);
	String in = rs.getString(2);
	String[] parts = in.split(":");
	double inHour = Double.parseDouble(parts[0]);
	double inMin = Double.parseDouble(parts[1]);
	String out1	= rs.getString(3);
	String[] parts1 = out1.split(":");
	double outHour = Double.parseDouble(parts1[0]);
	double outMin = Double.parseDouble(parts1[1]);
	double inTotal = (inHour*60) + inMin;
	double outTotal = (outHour*60) + outMin;
	double total = outTotal - inTotal;
	double workHour = total/60;
	wh.add(workHour);
	out.print("<tr><td> "+ date.substring(0,10) +" &nbsp;&nbsp;&nbsp;</td><td> "+ in +" </td><td> "+ out1 +" </td><td>" + Math.round(workHour*100.0)/100.0 +" "+ rsc.getString("hr") +"</td></tr>");
 } 
st.close();
Statement st1 = conn.createStatement();
st1.executeUpdate("delete from ats_behaviour where id="+ userName +"");
st1.close();
double behaviour = wh.get(0);
double temp1= behaviour+0.3;
double temp2= behaviour-0.3;
int c=1;
while(c<(wh.size()-5))
{
    if(wh.get(c)>=temp1 || wh.get(c)<=temp2){
        double temp = wh.get(c);
        if((wh.get(c+1)>=temp-0.08 || wh.get(c+1)<=temp+0.08) && (wh.get(c+2)>=temp-0.08 || wh.get(c+2)<=temp+0.08 ) && (wh.get(c+3)>=temp-0.08 || wh.get(c+3)<=temp+0.08)  && (wh.get(c+4)>=temp-0.08 || wh.get(c+4)<=temp+0.08 )){
	        behaviour= (temp+wh.get(c+1)+wh.get(c+2)+wh.get(c+3)+wh.get(c+4))/5;
	        temp1=behaviour+0.3;
	        temp2=behaviour-0.3;
	        Statement st2 = conn.createStatement();
			st2.executeUpdate("insert into ats_behaviour values("+ userName +",'"+ behaviour +"')");
			st2.close();
	    }
    }
    c++;
}
Statement stBehaviour = conn.createStatement();
ResultSet rsBehaviour = stBehaviour.executeQuery("select behaviour from ats_behaviour where id="+ userName +"");
%>
</table>
<hr>
<h3><b><% out.print(rsc.getString("beh")); %></b></h3>
<%while(rsBehaviour.next()){
	String time = rsBehaviour.getString(1);
	out.print(" "+ rsc.getString("prod") +" <b>"+ time.substring(0,5) +" "+ rsc.getString("hr") +"</b><br>");
}
	%>

 <% conn.close();
 %>
 </div></div>
 <div class="content2">
<p><span class="glyphicon glyphicon-copyright-mark"></span><img src="favicon.ico" alt=""> successfactors.com<p>
</div>
 
</body>
</html>