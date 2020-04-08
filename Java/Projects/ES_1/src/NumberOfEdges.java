import java.io.File;
import java.io.FileNotFoundException;
import java.util.Scanner;


public class NumberOfEdges {

	public static void main(String[] args) throws FileNotFoundException {
		
		Scanner scan = new Scanner(new File("edges.in"));
		
		int tries = scan.nextInt();
		//print(tries);
		
		for (int i = 0; i < tries; i++) {
			//print(i);
			int numberOfEdges = scan.nextInt();
			int totalEdges = 0;
			//print(numberOfEdges);
			String []rows = new String[numberOfEdges]; 
			for (int j = 0; j < numberOfEdges; j++) {
				rows[j] = scan.next();
				for (int z = 0; z < rows[j].length(); z++) {
					totalEdges+=Integer.parseInt(rows[j].substring(z,z+1));
					//print(totalEdges);
				}
			}
			System.out.println("Graph #"+(i+1)+" has "+totalEdges/2+" edges");
			
		}
	}
	
	public static void print(int x) {
		System.out.println(x);
	}
	
	public static void print(String string) {
		System.out.println(string);
	}

}
