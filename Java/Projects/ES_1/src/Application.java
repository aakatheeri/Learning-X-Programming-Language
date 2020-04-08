
public class Application {

	public static void main(String[] args) {
		
		// Change From int to string to char to int (specific position of int)
		int number = 2104;
		System.out.println(Integer.parseInt(Character.toString(Integer.toString(number).charAt(0))));
	}

}
