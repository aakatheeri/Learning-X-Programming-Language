/*
	Problem 5 of Assignment: Take a decimal number (whole number only) 
	and write the method to convert it into binary number and output the result.
	
	Developed By: Ahmed Alkathiri and Sultan Albraiki
*/

import java.util.*;

public class Algorithms_Subject_Assignment {
	
	public static void main (String args[]) {
		
		// Define instance of Scanner class
		Scanner scan = new Scanner(System.in);
		
		// Take a decimal number from user
		System.out.print("Enter a decimal (positive) number to convert it to binary: ");
		int decimalNumber = scan.nextInt();
		
		// Display binary number of decimal number chosen 
		System.out.print("Your number converted to binary is: ");
        System.out.print(binaryDisplay(decimalNumber));
		
	}
	
	// Method of converting decimal to binary form
	private static String binaryDisplay(int number) {
		return Integer.toBinaryString(number);
    }
	
}
