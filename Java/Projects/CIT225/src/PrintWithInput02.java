import java.util.Scanner;
public class PrintWithInput02 {

	public static void main(String[] args) {
		
		// Declaring Scanner class for using input features
		Scanner scan = new Scanner(System.in);

		// Create a program that takes a number from the user then specifies if this number is an even or odd number
		/* 
		System.out.print("Enter a number you need to know its status (even/odd): ");
		int number = scan.nextInt();
		int reminder = number%2;
		if (reminder == 0) {
			System.out.println(number+" is even number.");
		} else {
			System.out.println(number+" is odd number.");
		}
		  */
		
		// Write a program that reads values representing a time duration in hours, minutes and seconds, and then prints the equivalent total number of seconds
		/* 
		int hours, minutes,seconds, totalSeconds;
		
		System.out.print("Enter a hour value: ");
		hours = scan.nextInt();
		
		System.out.print("Enter a minutes value: ");
		minutes = scan.nextInt();
		
		System.out.print("Enter a seconds value: ");
		seconds = scan.nextInt();
		
		totalSeconds = (hours*60*60)+(minutes*60)+seconds;
		System.out.println("The total seconds value is "+totalSeconds);
		 */
		
		// Create a program that reads an integer value and prints the sum of all even integers between 2 and the input value, inclusive. Print an error message if the input value is less than 2 2
		int value, sum, reminder;
		
		System.out.print("Enter integer value to calculate the sum: ");
		value = scan.nextInt();
		sum = 0;
		
		if (value >= 2) {
			
			for (int i=1; i<=value; i++) {
				reminder = i%2;
				if (reminder == 0) {
					sum = sum + i;
				}
			}
			
			System.out.println("The sum of all even integers is "+sum);
			
		} else {
			System.out.println("Error: integer you have input is less than 2.");
		}

	}

}
