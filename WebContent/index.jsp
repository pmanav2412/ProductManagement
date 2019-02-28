
<%@page import="com.Product.Services.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id= "services" class="com.Product.Services.ProductService"/>
<a href="insert.html">insert</a>
<br>
<%  
    //ProductService  ps = new ProductService();
    ArrayList<Product> List = services.viewAll();
    if(List != null && List.size()> 0){

%>
    <table>
        <tr>
        <th>ID</th>
        <th>Product</th>
        <th>price</th>
        <th>seller</th>
        </tr>
 <%
       for(Product p:List){
    
 %> 
 		<tr>
        <th><%= p.getId() %></th>
        <th><%= p.getName() %></th>
        <th><%= p.getPrice() %></th>
        <th><%= p.getSeller() %></th>
        <th><a href=<%="Delete.jsp?Id=" + p.getId()%>>Delete</a></th>
        </tr>
    <%
      
       } 
    }
    else{
    	out.println("NO data Exist!");
    }
 %> 
    </table>
</body>
</html>