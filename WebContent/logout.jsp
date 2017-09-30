<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
session.setAttribute("user", null);
session.setAttribute("usertype",null);
session.invalidate();
response.sendRedirect("index.jsp");
%>