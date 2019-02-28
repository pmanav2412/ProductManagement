package com.Product.Services;

public class Product {
   private int id;
   private String name;
   private double price;
   private String seller;
   
   public Product() {
	   
   }

public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

public double getPrice() {
	return price;
}

public void setPrice(double price) {
	this.price = price;
}

public String getSeller() {
	return seller;
}

public void setSeller(String seller) {
	this.seller = seller;
}

/**
 * @param name
 * @param price
 * @param seller
 */
public Product(String name, double price, String seller) {
	this.name = name;
	this.price = price;
	this.seller = seller;
}


/**
 * @param id
 * @param name
 * @param price
 * @param seller
 */
public Product(int id, String name, double price, String seller) {
	this.id = id;
	this.name = name;
	this.price = price;
	this.seller = seller;
}

@Override
public String toString() {
	return String.format("Product [id=%s, name=%s, price=%s, seller=%s]", id, name, price, seller);
}
   
}
