package models;

import java.io.Serializable;

public class Offer implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private Food food;
	private Restaurant restaurant;

	public Offer() {
	}

	public Offer(int id, Food food, Restaurant restaurant, String start, String end) {
		this.id = id;
		this.food = food;
		this.restaurant = restaurant;
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
