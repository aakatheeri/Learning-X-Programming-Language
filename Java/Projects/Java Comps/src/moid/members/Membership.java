package moid.members;
import java.util.Random;

public class Membership {
	
	private Random randomClass = new Random();
	
	private int id = this.randomClass.nextInt(100);
	public String firstname;
	public String lastname;
	public int age;
	
	// This is a constructor
	public Membership(String firstname, String lastname, int age) {
		
		this.firstname = firstname;
		this.lastname = lastname;
		this.age = age;
		
	}
	
	public void reset () {
		this.firstname = null;
		this.lastname = null;
		this.age = 0;
	}
	
	public void print (boolean inOneLine) {
		if (inOneLine == true) {
			System.out.println("{ "+this.firstname+", "+this.lastname+", "+this.age+" }");
		} else {
			System.out.println(this.firstname);
			System.out.println(this.lastname);
			System.out.println(this.age);
		}
	}
	
	public void print () {
		System.out.println(this.firstname);
		System.out.println(this.lastname);
		System.out.println(this.age);
	}
	
	public String getFirstName () {
		return this.firstname;
	}
	
	public String getLastName () {
		return this.lastname;
	}
	
	public int getAge () {
		return this.age;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

}
