import java.lang.reflect.Array;
import java.util.Scanner;
import java.util.Date;
import java.util.Calendar;
public class CompVer0 {

	
	public static void main(String[] args) {
		
		/* 
		 * Create a table of Your family member (your father and down)
		 * All your family will be in array and print out all of them in
		 * Table with main columns ( ID - Name - Father - Children)
		 */
		
		/*
		// Declaring fathers names in String class array
		String[] fathers = {"Mohammad", "Tarek", "Naser", "Khalid"};
		
		// Declaring children names in String class array
		String[][] children = new String[4][15];
		children[0][0] = "Abdullah";
		children[0][1] = "Amal";
		children[1][0] = "Safiya";
		children[1][1] = "Hamdan";
		children[1][2] = "Khalifa";
		children[2][0] = "Mohammad";
		children[2][1] = "Ahmed";
		children[2][2] = "Zayed";
		children[3][0] = "Mohammad";
		children[3][1] = "Aeshah";
		children[3][2] = "Aleyah";
		children[3][3] = "Abdulrahman";
		children[3][4] = "Omar";
		
		createSplitLine();
		
		// Print main address words
		printAddressInHash("ID");
		printAddressInHash("Name");
		printAddressInHash("Father");
		printAddressInHash("Children");
		
		createSplitLine();
		
		// loop the table for ID, Name, Father, Children
		for (int i = 0; i<fathers.length;i++) {
			
			printAddressInHash(i+1);
			printAddressInHash(fathers[i]);
			printAddressInHash("Arfan");
			
			int numberOfChildren = 0;
			for (int j=0; j<children[i].length; j++) {
				if (children[i][j] != null) {
					numberOfChildren++;
				}
			}
			printAddressInHash("    "+numberOfChildren);
			createSplitLine();
		}
		 */
		
		/*
		 *  Test my self if I'm stronger or not by ask me many questions
		 *  And print the result in my situation (weak - medium - good - strong)
		 *  Evaluate questions by mark value in  ( 0.5 -   1.5  -   2  -   3   )
		 */
		
		/*
		// Declaring the questions
		String questions[] = {
				"Is not an artist your modal?",
				"Do you like work with group/others?",
				"Do you not like isolation?",
				"Can you defend your self?",
				"Do you like problem solving?"
				};
		
		// Declaring answers for user input
		String[] answers = new String[questions.length];
		
		// Declaring evaluation for each answer
		float[] evaluations = new float[5];
		evaluations[0] = 1.0f;
		evaluations[1] = 2.5f;
		evaluations[2] = 2.5f;
		evaluations[3] = 3.0f;
		evaluations[4] = 1.0f;
		
		// Declaring ecaluation value after asking user depending it his answers
		float evaluation = 0.0f;
		float totalEvaluation = 0.0f;
		
		// Declaring Scanner class variable
		Scanner scan = new Scanner(System.in);
		
		for (int i=0; i<questions.length;i++) {
			
			System.out.print(questions[i]+" ");
			answers[i] = scan.nextLine();
			
			if (false == answers[i].equals("Yes") && false == answers[i].equals("No")) {
				i = i-1;
				System.out.println("Error: just enter 'Yes' or 'No'. \n");
			} else {
				totalEvaluation+= evaluations[i];
			}
			
			if (answers[i].equals("Yes")) {
				evaluation = evaluation + evaluations[i];
			}
			
			
		}
		
		System.out.println("The result of evaluation of yourself is "+evaluation+" from "+totalEvaluation);
		 */
		
		/* Print out my age in years, months, days, hours, minutes, seconds 
		 *  Based on age input value
		 */
		
		int birthYear, birthMonth, birthDay, ageInYear, ageInMonth, ageInDay ,totalBirthInSeconds, totalBirthInHours, totalBirthInDays, totalBirthInYears, totalBirthInMonths;
		Scanner scan = new Scanner(System.in);
		
		System.out.print("Enter your birth day: ");
		birthDay = scan.nextInt();
		
		System.out.print("Enter your birth month: ");
		birthMonth = scan.nextInt();
		
		System.out.print("Enter your birth year: ");
		birthYear = scan.nextInt();
		
		Date date = new Date();
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);
		
		ageInYear = calendar.get(Calendar.YEAR) - birthYear;
		ageInMonth = calendar.get(Calendar.MONTH) - birthMonth;
		ageInDay = calendar.get(Calendar.DAY_OF_MONTH) - birthDay;
		
		if(ageInMonth < 0) {
			ageInMonth = ageInMonth + calendar.getActualMaximum(Calendar.MONTH);
		}
		
		if (ageInDay < 0) {
			ageInDay = ageInDay + calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
		}
		
		System.out.println("Your age old is "+ageInYear+" years, "+ageInMonth+" months, "+ageInDay+" days.");
		
		totalBirthInSeconds = ageInYear * birthMonth * birthDay * 24 * 60;
		totalBirthInDays = ((ageInYear*12) + ageInMonth)*30;
		totalBirthInMonths = ageInYear*12 + ageInMonth;
		totalBirthInHours = (((ageInYear*12) + ageInMonth)*30)*24;
		
		System.out.println("Your age have "+totalBirthInMonths+" months ..");
		System.out.println("Your age have "+totalBirthInDays+" days ..");
		System.out.println("Your age have "+totalBirthInHours+" hours ..");
		System.out.println("Your age have "+totalBirthInSeconds+" seconds ..");
		
	}
	
	private static void printLine(String word) {
		System.out.println(word);
	}
	
	private static void printAddress(String word) {
		if (word.length() > 7) {
			System.out.print("  \t"+word);
		} else {
			System.out.print("  \t"+word+"\t");
		}
	}
	
	private static void printAddressInHash(String word) {
		if (word.length() > 7) {
			System.out.print("  \t"+word+"   #");
		} else {
			System.out.print("  \t"+word+"\t   #");
		}
	}
	
	private static void printAddress(int integer) {
		System.out.print("  \t"+integer+"\t");
	}
	
	private static void printAddressInHash(int integer) {
		System.out.print("  \t"+integer+"\t   #");
	}
	
	private static void createSplitLine() {
		System.out.println("\n#################################################################################");
	}
	
	private static void createSplitLine(String sympol) {
		System.out.println(sympol);
	}
	
	private static void createSplitLine(String sympol, int numberOfSympol) {
		for (int i = 0; i<numberOfSympol; i++) {
			System.out.println(sympol);
		}
	}

}
