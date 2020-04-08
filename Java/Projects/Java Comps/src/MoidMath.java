import java.util.Scanner;
public class MoidMath {
	
	Scanner scan = new Scanner(System.in);
	int length = 2;
	int[] numbers = new int[this.length];
	int number;
	int currentIndex = 0;
	char operation;
	
	public int inputNumber(String message) {
		
		System.out.print(message+": ");
		this.number = scan.nextInt();
		
		this.numbers[currentIndex] = number;
		this.currentIndex=currentIndex+1;
		
		if (this.currentIndex>2) {
			this.changeCurrentNumbersWithNewNumber(this.number);
		}
		
		return this.number;
	}
	
	private void changeCurrentNumbersWithNewNumber (int newNumber) {
		
		int[] newNumbers = new int[5];
		for (int i = 0; i<numbers.length; i++) {
			newNumbers[i] = numbers[i];
		}
		
		this.length = numbers.length+1;
		
		this.reset();
		numbers = new int[this.length];
		
		for (int i = 0; i<numbers.length;i++) {
			numbers[i] = newNumbers[i];
		}
	}
	
	public void setOperation(char operation) {
		this.operation = operation;
	}
	
	public int getResult() {
		
		int numberValue = 0;
		for (int i= 0; i < this.numbers.length; i++) {
			
			if (operation == '+') {
				numberValue = numberValue + numbers[i];
			} else if (operation == '-') {
				numberValue = numberValue + numbers[i];
			} else if (operation == '*') {
				if (numberValue != 0) {
					numberValue = numberValue + numbers[i];
				} else {
					numberValue = numbers[i];
				}
			} else if (operation == '/') {
				if (numberValue != 0) {
					numberValue = numberValue + numbers[i];
				} else {
					numberValue = numbers[i];
				}
			}
		}
		
		return numberValue;
		
	}
	
	public float getPercentage(float point) {
		
		return ((float)this.number/point) * 100;
	}
	
	public void print(String message) {
		System.out.print(message);
	}
	
	public void print(int number) {
		System.out.print(number);
	}
	
	public void print(String message,int number) {
		System.out.print(message+number);
	}
	
	public void print(int number, String message) {
		System.out.print(number+message);
	}
	
	public void printLine(String message) {
		System.out.println(message);
	}
	
	public void printLine(int number) {
		System.out.println(number);
	}
	
	public void printLine(String message, int number) {
		System.out.println(message+number);
	}
	
	public void printLine(int number, String message) {
		System.out.println(number+message);
	}
	
	public void printLine(float number, String message) {
		System.out.println(number+message);
	}
	
	public void printLine(String message, float number) {
		System.out.println(message+number);
	}
	
	public void printLine(float number) {
		System.out.println(number);
	}
	
	public void reset() {
		numbers = null;
	}
}
