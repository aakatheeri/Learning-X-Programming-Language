import java.util.Scanner;
public class Application {

	public static void main(String[] args) {
		
		Scanner scan = new Scanner(System.in);
		
		System.out.print("Enter your grade in number: ");
		float grade = scan.nextFloat();
		char gradeInCharacter;
		
		if (grade >= 90 && grade <=100) {
			gradeInCharacter = 'A';
		} else if (grade >= 80 && grade <=89) {
			gradeInCharacter = 'B';
		} else if (grade >= 70 && grade <=79) {
			gradeInCharacter = 'C';
		} else if (grade >= 60 && grade <=69) {
			gradeInCharacter = 'D';
		} else {
			gradeInCharacter = 'F';
		}
		
		System.out.println("Your grade is '"+gradeInCharacter+"'");
		
	}
	
}