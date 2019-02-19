package models;

import java.io.Serializable;

public class CartItem implements Serializable {

	private static final long serialVersionUID = 1L;

	private Food food;
	private int quantity;
	private int totalPrice;

	public CartItem(Food food, int quantity, int totalPrice) {
		this.food = food;
		this.quantity = quantity;
		this.totalPrice = totalPrice;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

}
