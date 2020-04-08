import java.util.Scanner;
public class PrintWithInput {

	public static void main(String[] args) {
		
		// Declaring Scanner class variable
		Scanner scan = new Scanner(System.in);
		
		/*
		
		// Write a program to add two numbers
		int number1, number2, result;
		
		System.out.print("Enter the first number to add: ");
		number1 = scan.nextInt();
		
		System.out.print("Enter the second number to add: ");
		number2 = scan.nextInt();
		
		result = number1 + number2;
		System.out.println("The result of adding ( "+number1+" + "+number2+" ) is "+result);
		 
		 */
		
		// Write a program to calculate the average of 3 numbers
		
		/*
		int x,y,z,average;
		System.out.print("Enter the first number: ");
		x = scan.nextInt();
		
		System.out.print("Enter the second number: ");
		y = scan.nextInt();
		
		System.out.print("Enter the third number: ");
		z = scan.nextInt();
		
		average = (x+y+z)/3;
		
		System.out.println("The average of 3 numbers ("+x+", "+y+", "+z+") is "+average); 
		 */
		
		// Write a program that prints any word the user will enter
		/*
		System.out.print("Enter any word you like: ");
		String word = scan.next();
		System.out.println(word);
		 */
		
		// Write a program to take two numbers from user then displays the highest
		/*
		int number1, number2;
		
		System.out.print("Enter the first number: ");
		number1 = scan.nextInt();
		
		System.out.print("Enter the second number: ");
		number2 = scan.nextInt();
		
		if(number1 > number2) {
			System.out.println(number1+" which is the first number, is the highest.");
		} else {
			System.out.println(number2+" which is the second number, is the highest.");
		}
		 */
		
		// Write a program to take three numbers from the user then displays the highest
		/*
		int num1, num2, num3;
		
		System.out.print("Enter the first number: ");
		num1 = scan.nextInt();
		
		System.out.print("Enter the second number: ");
		num2 = scan.nextInt();

		System.out.print("Enter the third number: ");
		num3 = scan.nextInt();
		
		if( (num1 > num2) && (num1 > num3) ) {
			System.out.println(num1+" which is the first number, is the highest.");
		} else if ( (num2 > num1) && (num2 > num3 ) ) {
			System.out.println(num2+" which is the second number, is the highest.");
		} else {
			System.out.println(num3+" which is the third number, is the highest.");
		}
		 */
		
		// Write a program to convert a grade from a number to a letter
		/*
		int gradeInNumber;
		char gradeInCharacter;
		
		System.out.print("Enter your grade: ");
		gradeInNumber = scan.nextInt();
		if (gradeInNumber <= 100 && gradeInNumber >= 90) {
			gradeInCharacter = 'A';
		} else if (gradeInNumber <= 89 && gradeInNumber >= 80) {
			gradeInCharacter = 'B';
		} else if (gradeInNumber <= 79 && gradeInNumber >= 70) {
			gradeInCharacter = 'C';
		} else if (gradeInNumber <= 69 && gradeInNumber >= 60) {
			gradeInCharacter = 'D';
		} else {
			gradeInCharacter = 'F';
		}
		
		System.out.println("Your grade in character is '"+gradeInCharacter+"'");
		 */
 		
		// Write a program that prints the month name for any number the user enters. You have to make sure that the user enters a number between 1 and 12.
		/*
		String monthName = "";
		
		System.out.print("Enter month number: ");
		int monthNumber = scan.nextInt();
		
		switch(monthNumber) {
			case 1: 
				monthName = "January";
				break;
			case 2:
				monthName = "February";
				break;
			case 3:
				monthName = "March";
				break;
			case 4:
				monthName = "April";
				break;
			case 5:
				monthName = "May";
				break;
			case 6:
				monthName = "June";
				break;
			case 7:
				monthName = "July";
				break;
			case 8:
				monthName = "August";
				break;
			case 9:
				monthName = "September";
				break;
			case 10:
				monthName = "October";
				break;
			case 11:
				monthName = "November";
				break;
			case 12:
				monthName = "December";
				break;
			default:
				
		}
		
		if(monthNumber >= 1 && monthNumber <=12) {
			System.out.println("The month that match your chosen number '"+monthNumber+"' is '"+monthName+"'");
		} else {
			System.out.println("You entered invalid month number.");
		}
		 */
		
		// Write a program that prints any word the user will enter 10 times
		/*
		System.out.print("Enter your word: ");
		String word = scan.next();
		
		for (int i = 0; i<10; i++) {
			System.out.println(word);
		}
		 */
		
		// Write a program that prints any word the user will enter n number of times
		/*
		System.out.print("Enter your word: ");
		String word = scan.next();
		
		System.out.print("Enter number of times you need to display your word: ");
		int numberOfTime = scan.nextInt();
		
		for (int i=0; i<numberOfTime; i++) {
			System.out.println
			(word);
		}
		 */
		
	}

}
