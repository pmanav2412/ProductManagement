package com.Product.Services;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductService {
     Connection connection;
     Product product = null;
     public ProductService() {
    	 try {
    	 Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Product", "root", "root");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
     }
     
     
     
     /// GET ALL THE SERVICES 
     public ArrayList<Product> viewAll(){
    	 ArrayList<Product> products = new ArrayList<>();
    	 
    	 try {
    		 PreparedStatement prstatement = connection.prepareCall("Select * from products");
    	 ResultSet rs = prstatement.executeQuery();
    	 while (rs.next()) {
    		 product = new Product(rs.getInt(1),rs.getString(2), rs.getDouble(3), rs.getString(4));
    		products.add(product);

    		
    	 }
    	 return products;
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return null;
     }
     
     
     
     ////// INSERT NEW PRODUCT
     public int insert(String name,double price,String seller) {
    	 
    	 
    	 try {
    		 PreparedStatement prstatement = connection.prepareCall("INSERT INTO products(name,price,seller) VALUES(?,?,?)");
    		 prstatement.setString(1,name);
    		 prstatement.setDouble(2, price);
    		 prstatement.setString(3, seller);
    		 return prstatement.executeUpdate();
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return -1;
     }
     
     
     ///// DELETE PRODUCT
     public int Delete(int id) {
    	 try {
    	 PreparedStatement prstatement = connection.prepareCall("DELETE FROM products WHERE id=?");
    	 prstatement.setInt(1,id);
    	 return prstatement.executeUpdate();
    	 
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return -1;
     }
     
     
     ///// GET PERTICULAR DATA
    
     public Product getProduct(int id) {
    	 try {
    		 System.out.println(id);
    		 String UPDATE_QUERY = "SELECT * FROM products WHERE id ='"+id+"'";
    		 Statement statement = connection.createStatement();
//    		 PreparedStatement prstatement = connection.prepareCall(UPDATE_QUERY);
    		 
    		 ResultSet rs = statement.executeQuery(UPDATE_QUERY);
    		 while(rs.next()) {
    		 product = new Product(rs.getInt(1),rs.getString(2), rs.getDouble(3), rs.getString(4));
    		
    		 }
    		 return product;
    		
    	 }
    	 catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return null;
     }
     
     
     //UPDATE Emp SET EmpLastName = 'Patel' WHERE Empname='Pooja'
     /// UPDATE DATA OF PERTICUROJECT
     public int Update(int id, String name,double price,String seller ) {
    	 try {
    		 PreparedStatement ps = connection.prepareCall("UPDATE products Set name=?,seller=?,price=?" +" WHERE id=?");
    		
    		
    		 ps.setString(1,name);
    		 ps.setString(2, seller);
    		 ps.setDouble(3, price);
    		 ps.setInt(4, id);
    		 System.out.println("pappu pass");
    		
    		 return ps.executeUpdate();
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return -1;
     }
     
}
