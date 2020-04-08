import java.util.Scanner;


public class PrimaryNumber {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("Enter first number of range: ");
		int numberToEnter1 = scan.nextInt();
		
		System.out.print("Enter second number of range: ");
		int numberToEnter2 = scan.nextInt();
		
		for (int i = numberToEnter1; i <= numberToEnter2; i++) {
			boolean result = true;
			for (int j = 2; j<i; j++) {
				if (i % j == 0) {
					result = false;
					break;
				}
				
			}
			
			if (result != false) {
				System.out.print(i+" ");
			}
			
		}
		

	}
	
//	public static boolean isPrime(int n) {
//	       if (n <= 1) {
//	           return false;
//	       }
//	       for (int i = 2; i < Math.sqrt(n); i++) {
//	           if (n % i == 0) {
//	               return false;
//	           }
//	       }
//	       return true;
//	   }
//	
//	public static boolean isPrime(int n) {
//		int i;
//	    for (i = 2; i < n; i++) {
//	        if (n % i == 0) {
//	            return false;
//	        }
//	    }
//	    return true;
//	   }

}
