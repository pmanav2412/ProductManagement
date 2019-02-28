<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*"%>
    <%@page import="java.sql.*"%>
    <%@page import="com.Product.Services.Product"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">

</head>
<body>
<jsp:useBean id= "services" class="com.Product.Services.ProductService"/>

<%

int s= Integer.parseInt(request.getParameter("Id"));
Product product = services.getProduct(s);
double d = product.getPrice();

%>



<form method="post"  action=<%="UpdateCommit.jsp?Id=" + product.getId()%> >
<div align="center">
  
  <div class="form-group">
    <label for="formGroupExampleInput">Product Name</label>
    <input type="text" class="form-control" id="formGroupExampleInput" placeholder="<%=product.getName() %>" name="name" style="width: 50%;">
  </div>
  
  <div class="form-group">
    <label for="formGroupExampleInput2">Price </label>
    <input type="" class="form-control" id="formGroupExampleInput2" value="<%=d %>" name="price" style="width: 50%;">
  </div>
  
  <div class="form-group">
    <label for="formGroupExampleInput2">Seller </label>
    <input type="text" class="form-control" id="formGroupExampleInput2" value="<%=product.getSeller() %>" name="seller" style="width: 50%;">
  </div>
  
   <div>
   <input type="submit"  value="Update Product">
  </div>
  
  </div>
</form>

</body>
</html>