<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.Product.Services.ProductService"%>
<%@page import="com.Product.Services.Product"%>
<%@page import="com.Product.Services.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<jsp:useBean id= "services" class="com.Product.Services.ProductService"/>
<% 
int s= Integer.parseInt(request.getParameter("Id"));

services.Delete(s);
response.sendRedirect("index.jsp");


%>
<h1>Hello <%= s %> </h1>

</body>
</html>