
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
    System.out.println("This is my list"+List);
    if(List != null && List.size()> 0){

%>
    <table class="table">
        <tr>
        <th scope="col">ID</th>
        <th scope="col">Product</th>
        <th scope="col">price</th>
        <th scope="col">seller</th>
        </tr>
 <%
       for(Product p:List){
    
 %> 
 		<tr>
        <th scope="row"><%= p.getId() %></th>
        <th><%= p.getName() %></th>
        <th><%= p.getPrice() %></th>
        <th><%= p.getSeller() %></th>
        <th><a href=<%="Delete.jsp?Id=" + p.getId()%> style="color: red;">Delete</a></th>
         <th><a href=<%="Update.jsp?Id=" + p.getId()%> style="color: blue;">Update</a></th>
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