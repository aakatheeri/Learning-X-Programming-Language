
public class CompVer01 {

	public static void main(String[] args) {
		

		/*
		 * Create new class that include input, output, add, subtract, multiply, divide, getting percent
		 * Use this class to ask user user to add two number, after that multiply two number if he want
		 * get percent of his grade from exam from 45 points
		 */
		
		// Add two numbers
		/* MoidMath mdMath = new MoidMath();
		mdMath.inputNumber("Enter the first number");
		mdMath.inputNumber("Enter the second number");
		mdMath.setOperation('+');
		int result = mdMath.getResult();
		mdMath.printLine(result); */
		
		// Get percentage of specific point
		MoidMath mdMath = new MoidMath();
		mdMath.inputNumber("Enter your point that you get");
		float result = mdMath.getPercentage(50);
		mdMath.printLine(result);

	}

}
