package com.Product.Services;

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
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Product", "root", "rootroot");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
     }
     
     public ArrayList<Product> viewAll(){
    	 ArrayList<Product> products = new ArrayList<>();
    	 
    	 try {
    		 PreparedStatement prstatement = connection.prepareCall("Select * from products");
    	 ResultSet rs = prstatement.executeQuery();
    	 while (rs.next()) {
    		 product = new Product(rs.getInt(1),rs.getString(2), rs.getDouble(3), rs.getString(4));
    		products.add(product);
    		System.out.println(products);
    		
    	 }
    	 return products;
    	 }catch(Exception e) {
    		 e.printStackTrace();
    	 }
    	 return null;
     }
     
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
}
