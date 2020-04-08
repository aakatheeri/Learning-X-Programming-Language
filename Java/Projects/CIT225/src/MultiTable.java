import java.util.Scanner;
public class MultiTable {

	
	public static void main(String[] args) {
		

		Scanner scan = new Scanner(System.in);
		
		System.out.print("Enter a number: ");
		int number = scan.nextInt();
		
		for (int i = 1; i <=12; i++) {
			System.out.println(number+"x"+i+" = "+ (number*i));
		}

	}

}
