import java.util.ArrayList;
import java.util.HashMap;

public class ArrayListExamples {

	public static void main(String[] args) {
	
		// Create new integer array (1)
		int numbers[] = new int[5];
		numbers[0] = 23;
		numbers[1] = 40;
		numbers[2] = 35;
		numbers[3] = 44;
		numbers[4] = 30;
		printArrayOfNumbers(numbers);
		
		spr();
		
		// Create new integer array (2)
		int numbers2[] = {10,40,60,70,100};
		printArrayOfNumbers(numbers2);
		
		spr();
		
		// Create new integer array (3)
		int[] numbers3 = new int[3];
		numbers3[0] = 30;
		numbers3[1] = 40;
		numbers3[2] = 50;
		printArrayOfNumbers(numbers3);
		
		spr();
		
		// Create 2 dimensions array
		String[][] cities = new String[3][9];
		cities[0][0] = "Abu Dhabi";
		cities[0][1] = "Dubai";
		cities[0][2] = "Sharjah";
		cities[1][0] = "Reyadh";
		cities[1][1] = "Jeddah";
		cities[1][2] = "Dammam";
		cities[2][0] = "Sana'a";
		cities[2][1] = "Sai'on";
		cities[2][2] = "Ta'ez";
		print2dArrayOfString(cities);
		
		spr();
		
		// Using ArrayList class for creating array
		ArrayList<String> list = new ArrayList<String>();
		list.add("Ahmed");
		list.add("Saaed");
		list.add("Sultan");
		printArrayList(list);
		
		spr();
		
		// Using HashMap class for creating array
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("UAE", "Abu Dhabi");
		map.put("KSA", "Riyadh");
		map.put("Oman", "Masqat");
		System.out.println(map);
		
		map.put("Brazil", "Saw Paulo");
		System.out.println(map);
		
		map.remove("KSA");
		System.out.println(map);
		
		String cap = map.get("UAE");
		System.out.println(cap);
		
	}
	
	private static void printArrayOfNumbers(int numbers[]) {
		System.out.print("{");
		for (int i = 0; i<numbers.length; i++) {
			if(numbers[i] == numbers[numbers.length-1]) {
				System.out.print(numbers[i]);
			} else {
				System.out.print(numbers[i]+", ");
			}
			
		}
		System.out.print("}");
	}
	
	private static void print2dArrayOfString(String string[][]) {
		System.out.print("{");
		for (int i=0; i<string.length; i++) {
			for (int j=0; j<string.length; j++) {
				if(string[i][j] == string[string.length-1][string.length-1]) {
					System.out.print(string[i][j]);
				} else {
					System.out.print(string[i][j]+", ");
				}
			}
		}
		System.out.print("}");
	}
	
	private static void printArrayList(ArrayList<String> list) {
		System.out.print("{");
		for(int i = 0; i<list.size(); i++) {
			if(list.get(i) == list.get(list.size()-1)) {
				System.out.print(list.get(i));
			} else {
				System.out.print(list.get(i)+", ");
			}
		}
		System.out.print("}");
	}
	
	private static void spr() {
		System.out.println("");
	}
	
}