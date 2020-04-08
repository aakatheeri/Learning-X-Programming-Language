import java.util.Scanner;
public class EnigmaMachineProject01 {

	public static void main(String[] args) {
		
		// Asking user for entering his word to be encrypted
		System.out.print("Enter your word to be encrypted in Enigma Machine (Using ASCII code): ");
		
		// The word you want to encrypt
		Scanner scan = new Scanner(System.in);
		String word = scan.next();
		
		String encrptedWord = new String();
		char[] encrptedChar = new char[word.length()];
		
		// Cutting word in characters that will be converted to ASCII code (in numbers)
		int[] charsInASCIICode = new int[word.length()];
		for (int i = 0; i<charsInASCIICode.length; i++) {
			
			// By converting String to int variable type, it will give us ASCII number versus each character
			charsInASCIICode[i] = (int)word.charAt(i); 
		}
		
		// Using rotor1 to add its numbers to ASCII code of word
		int[] rotor1 = {59,88,28,31,49,69,58,15,45,81,20,57,46,25,87,3,4,1,11,83};
		for (int i = 0; i<charsInASCIICode.length; i++) {
			
			// Applying rotor to character in ASCII code 
			charsInASCIICode[i] = charsInASCIICode[i] + rotor1[i];
			
			// Checking if value of char's ASCII code is between 32 and 126 and apply rules if it bigger than 126 or lower than 32
			if (charsInASCIICode[i] > 126) {
				charsInASCIICode[i] = charsInASCIICode[i] - 126 + 32;
			} else if (charsInASCIICode[i] < 32) {
				charsInASCIICode[i] = 126 - (32-charsInASCIICode[i]);
			}
		}
		
		// Using rotor2 to add its numbers to ASCII code of word
		int[] rotor2 = {83,41,66,65,96,2,8,93,40,70,55,24,90,95,34,89,98,24,44,85};
		for (int i = 0; i<charsInASCIICode.length; i++) {
			
			// Applying rotor to character in ASCII code 
			charsInASCIICode[i] = charsInASCIICode[i] + rotor2[i];
			
			// Check if value of char's ASCII code is between 32 and 126 and apply rules if it bigger than 126 or lower than 32
			if (charsInASCIICode[i] > 126) {
				charsInASCIICode[i] = charsInASCIICode[i] - 126 + 32;
			} else if (charsInASCIICode[i] < 32) {
				charsInASCIICode[i] = 126 - (32-charsInASCIICode[i]);
			}
		}
		
		// Using rotor3 to add its numbers to ASCII code of word
				int[] rotor3 = {58,91,18,60,36,54,100,90,47,50,12,52,62,78,57,18,35,36,33,43};
				for (int i = 0; i<charsInASCIICode.length; i++) {
					
					// Applying rotor to character in ASCII code 
					charsInASCIICode[i] = charsInASCIICode[i] + rotor3[i];
					
					// Check if value of char's ASCII code is between 32 and 126 and apply rules if it bigger than 126 or lower than 32
					if (charsInASCIICode[i] > 126) {
						charsInASCIICode[i] = charsInASCIICode[i] - 126 + 32;
					} else if (charsInASCIICode[i] < 32) {
						charsInASCIICode[i] = 126 - (32-charsInASCIICode[i]);
					}
				}
		
		// Converting ASCII codes to normal characters
		for (int i = 0; i<charsInASCIICode.length; i++) {
			encrptedChar[i] = (char)charsInASCIICode[i];
		}
		
		// Adding encrypted characters in single word
		encrptedWord = String.valueOf(encrptedChar);
		
		// Outputing the encrypted word
		System.out.println("\nThe converted word after ASCII code is ==> "+encrptedWord);
		
		// Printing out the ASCII code of word
		/*System.out.print("The ASCII code of characters are "+ encChars);
		 for (int i = 0; i<encChars.length; i++) { 
			if (i == encChars.length-1) {
				System.out.print(encChars[i]);
			} else {
				System.out.print(encChars[i]+", ");
			}
		} */
	}

}
