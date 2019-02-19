package models;

import java.io.Serializable;

public class Restaurant implements Serializable {

	private static final long serialVersionUID = 1L;

	private int id;
	private String name;
	
	public Restaurant() {
	}

	public Restaurant(int id, String name) {
		this.id = id;
		this.name = name;
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

	

}
