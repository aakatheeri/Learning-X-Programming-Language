import java.util.Scanner;


public class ZULogic {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		/// Conditions
		System.out.print("Write your age: ");
		int age = scan.nextInt();
		
		if (age >= 18 && age < 30) {
			System.out.println("Your are allowed to get the job");
		} else if (age > 11 && age < 17) {
			System.out.println("Your too young!");
		} else {
			System.out.println("Sorry, try again later");
		}
		
		/// functions/methods
		
		/// returning value
		
	}

}
