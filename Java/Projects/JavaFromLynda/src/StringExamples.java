
public class StringExamples {
	
	public static void main(String[] args) {
		
		// Array of strings
		String names[] = {"Ahmed", "Adel", "Saeed"};
		
		// Using print method
		System.out.print("{");
		
		// Loop of names from array
		for (int i = 0; i < names.length; i++) {
			
			// Check if name is a last string on array
			if(names[names.length-1].equals(names[i])) {
				System.out.print(names[i]);
			} else {
				System.out.print(names[i]+", ");
			}
		}
		System.out.print("}");
		
		// Break new line
		splt();
		
		// Using String class methods if there two variables doesn't match each other in declaration
		String s1 = "Welcome to Abu Dhabi";
		String s2 = new String("WELCOME to Abu Dhabi");
		
		
		if(s1.equalsIgnoreCase(s2)) {
			System.out.println("Strings are match!");
		} else {
			System.out.println("Strings are not match!");
		}
		
		// Using String class methods in two variable that they match in declaration
		String s3 = "Fifa";
		String s4 = "Fifa";
		
		if(s3 == s4) {
			System.out.println("They are match!");
		} else {
			System.out.println("They are not match!");
		}
		
		// Split String variable in character array
		String s5 = "Ahmed Alkatheeri";
		
		char [] chars = s5.toCharArray();
		System.out.print("{ ");
		for(char c :chars) {
			System.out.print("'"+c+"' ");
		}
		System.out.print(" }");
		
		splt(2);
		
		// Using StringBuilder class with String class - appending
		String s6 = "Welcome";
		StringBuilder sb = new StringBuilder(s6);
		
		sb.append(" to California");
		
		System.out.println(sb);
		
		splt();
		
		String newString = "This is my own string";
		
		// Get index of characters on String variable
		int pos = newString.indexOf("own");
		System.out.println("Position of 'own' word is "+pos);
		
		// Devide strings using subString method
		String sub = newString.substring(15);
		System.out.println(sub);

		// Get length of String variable
		int len = newString.length();
		System.out.println("Length of my string is "+len);
		
		// Using trim method
		String newestString = "Welcome       ";
		String trNewestString = newestString.trim(); /* this method remove white space */
		System.out.println(trNewestString.length());
		
	}
	
	private static void splt() {
		System.out.println("");
	}
	
	private static void splt(int numberOfLine) {
		for(int i=0; i<numberOfLine;i++) {
			System.out.println("");
		}
	}
}