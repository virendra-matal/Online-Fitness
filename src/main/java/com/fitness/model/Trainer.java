package com.fitness.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "trainer")
public class Trainer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int trainerId;
	private String firstName;
	private String lastName;
	private String username;
	private String address;
	private String city;
	private String state;
	private long zip;
	private String resume;
	
	public Trainer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Trainer(int trainerId, String firstName, String lastName, String username, String address, String city,
			String state, long zip, String resume) {
		super();
		this.trainerId = trainerId;
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.resume = resume;
	}
	
	
	public Trainer(String firstName, String lastName, String username, String address, String city, String state,
			long zip, String resume) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.address = address;
		this.city = city;
		this.state = state;
		this.zip = zip;
		this.resume = resume;
	}
	public int getTrainerId() {
		return trainerId;
	}
	public void setTrainerId(int trainerId) {
		this.trainerId = trainerId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public long getZip() {
		return zip;
	}
	public void setZip(long zip) {
		this.zip = zip;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	@Override
	public String toString() {
		return "Trainer [trainerId=" + trainerId + ", firstName=" + firstName + ", lastName=" + lastName + ", username="
				+ username + ", address=" + address + ", city=" + city + ", state=" + state + ", zip=" + zip
				+ ", resume=" + resume + "]";
	}
	
	
	

}
