package models;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

public class Invoice implements Serializable {

	private static final long serialVersionUID = 1L;

	private User user;
	private Date today;
	private ArrayList<CartItem> cart;
	private Address address;

	public Invoice(User user, Date today, ArrayList<CartItem> cart, Address address) {
		this.user = user;
		this.today = today;
		this.cart = cart;
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getToday() {
		return today;
	}

	public void setToday(Date today) {
		this.today = today;
	}

	public ArrayList<CartItem> getCart() {
		return cart;
	}

	public void setCart(ArrayList<CartItem> cart) {
		this.cart = cart;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

}
