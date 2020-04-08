import java.util.Scanner;

public class QuizExample {
	
	public static void main(String[] argc) {
		
		int x, y;
		char operation;
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("Enter the first number: ");
		x = scan.nextInt();
		
		System.out.print("Enter the second number: ");
		y = scan.nextInt();
		
		System.out.print("Enter operation symbol: ");
		operation = scan.next().charAt(0);
		
		
		if (operation == '+') {
			System.out.println(x+y);
		} else if (operation == '-') {
			System.out.println(x-y);
		} else if (operation == '*') {
			System.out.println(x*y);
		} else if (operation == '/') {
			System.out.println(x/y);
		}
		
		
	}
	
}