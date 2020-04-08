
public class methodsExamples {

	public static void main(String[] args) {
		
		print("My name is Ahmed \n");
		print(24+" is my years old .. \n");
		print("I'm "+24+" years old \n");
		
	}
	
	private static void printString(String string) {
		System.out.println(string);
	}
	
	private static void printMultiNames(String ... strings ) {
		
		String result = "";
		for (String string:strings) {
			result+=string+" ";
		}
		
		System.out.println(result);
	}
	
	private static void print(String string) {
		System.out.print(string);
	}
	
	private static void print(String string, int number) {
		System.out.print(string+number);
	}
	
	private static void print(int number, String string) {
		System.out.print(number+string);
	}
	
	private static void print(int number) {
		System.out.print(number);
	}
	
}

