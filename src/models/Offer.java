package models;

import java.io.Serializable;

public class Offer implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id, discountedPrice;
	private Food food;
	private Restaurant restaurant;

	public Offer() {
	}

	public Offer(int id, Food food, int discountedPrice, Restaurant restaurant, String start, String end) {
		this.id = id;
		this.food = food;
		this.restaurant = restaurant;
		this.discountedPrice = discountedPrice;
	}

	public int getDiscountedPrice() {
		return discountedPrice;
	}

	public void setDiscountedPrice(int discountedPrice) {
		this.discountedPrice = discountedPrice;
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Food getFood() {
		return food;
	}

	public void setFood(Food food) {
		this.food = food;
	}

	public Restaurant getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(Restaurant restaurant) {
		this.restaurant = restaurant;
	}

}
