import java.util.Scanner;


public class Problem2 {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		// Get Town A population
		System.out.print("Enter pupolation of Town A: ");
		float townAPopulation = scan.nextInt();
		
		// Get Town A increase percentage
		System.out.print("Enter increase percentage of Town A: ");
		float townAIncrease = scan.nextInt();
		
		// Get Town B population
		System.out.print("Enter pupolation of Town B: ");
		float townBPopulation = scan.nextInt();
		
		// Get Town B increase percentage
		System.out.print("Enter increase percentage of Town B: ");
		float townBIncrease = scan.nextInt();
		
		// Initialize required years and condition to stop
		int numberOfYears = 0;
		boolean isPopulationOfTownAIsGreaterThanTownB = false;
		
		if (townAPopulation < townBPopulation) {
			
			while (isPopulationOfTownAIsGreaterThanTownB == false) {
				townAPopulation+= townAPopulation*(townAIncrease/100.0);
				townBPopulation+= townBPopulation*(townBIncrease/100.0);
				numberOfYears++;
				if (townAPopulation>townBPopulation) {
					isPopulationOfTownAIsGreaterThanTownB = true;
					System.out.println("The number of years that Town A have to be greater than town B is: "+numberOfYears);
				}
			}
			
		} else {
			System.out.println("Error: initial number of population A should be more than pupolation B.");
		}		

	}

}
