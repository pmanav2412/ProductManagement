<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
System.out.println("HEllo");
System.out.println(s+request.getParameter("name")+Double.parseDouble(request.getParameter("price")) +request.getParameter("seller"));
int i =services.Update(s,request.getParameter("name"),Double.parseDouble(request.getParameter("price")) ,request.getParameter("seller"));
response.sendRedirect("index.jsp");


%>
</body>
</html>