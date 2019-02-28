<%@page import="com.Product.Services.ProductService"%>
<%@page import="com.Product.Services.Product"%>
<%@page import="com.Product.Services.*"%>
<%@page import="java.util.*"%>
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
 			 String name = request.getParameter("name");
    		double price = Double.parseDouble(request.getParameter("price"));
    		String seller = request.getParameter("seller");
    		ProductService ps = new ProductService();
    		int num =ps.insert(name, price, seller);
    		if(num>0){
    			out.print("1 row inserted");
    		}
    		response.sendRedirect("index.jsp");
    	
    		
    	
    
%>

</body>
</html>