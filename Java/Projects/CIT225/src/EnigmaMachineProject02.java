import java.util.Scanner;
public class EnigmaMachineProject02 {

	public static void main(String[] args) {
		
		// Asking user for entering his word to be encrypted
		System.out.print("Enter your word to be encrypted in Enigma Machine (Using ASCII code): ");

		// The word you want to encrypt
		Scanner scan = new Scanner(System.in);
		String word = scan.next();
		
		// Cutting word in characters that will be converted to ASCII code (in numbers)
		int[] charactersInASCIICode = new int[word.length()];
		for (int i = 0; i<charactersInASCIICode.length; i++) {
			
			// By converting String to int variable type, it will give us ASCII number versus each character
			charactersInASCIICode[i] = (int)word.charAt(i); /* Converting from character to ASCII code number */
									   /* Using Type Casting to convert type to type */
		}
		
		// Using rotor1 to add its numbers to ASCII code of word
		int[] rotor1 = {59,88,28,31,49,69,58,15,45,81,20,57,46,25,87,3,4,1,11,83};
		charactersInASCIICode = getCharactersEncryptedByRotors(charactersInASCIICode, rotor1);
		
		// Using rotor2 to add its numbers to ASCII code of word
		int[] rotor2 = {83,41,66,65,96,2,8,93,40,70,55,24,90,95,34,89,98,24,44,85};
		charactersInASCIICode = getCharactersEncryptedByRotors(charactersInASCIICode, rotor2);
		
		// Using rotor3 to add its numbers to ASCII code of word
		int[] rotor3 = {58,91,18,60,36,54,100,90,47,50,12,52,62,78,57,18,35,36,33,43};
		charactersInASCIICode = getCharactersEncryptedByRotors(charactersInASCIICode, rotor3);
		
		// Outputing statement before encrypted characters
		System.out.print("\nThe converted word after ASCII code is ==> ");
		
		// Outputing encrtpted characters
		for (int i = 0; i<charactersInASCIICode.length; i++) {
			System.out.print((char)charactersInASCIICode[i]);
		}
				
	}
	
	// function for reusing code of using rotor numbers in ASCII code characters
	public static int[] getCharactersEncryptedByRotors(int[] myASCIICharacters, int[] rotor) {
		
		// Using For loop for changing numbers of ASCII code using rotor entered by in argument 
		for (int i = 0; i<myASCIICharacters.length; i++) {
			
			// Applying rotor to character in ASCII code 
			myASCIICharacters[i] = myASCIICharacters[i] + rotor[i];
			
			// Check if value of char's ASCII code is between 32 and 126 and apply rules if it bigger than 126 or lower than 32
			if (myASCIICharacters[i] > 126) {
				myASCIICharacters[i] = myASCIICharacters[i] - 126 + 32;
			} else if (myASCIICharacters[i] < 32) {
				myASCIICharacters[i] = 126 - (32-myASCIICharacters[i]);
			}
		}
				
		return myASCIICharacters;
	}

}
