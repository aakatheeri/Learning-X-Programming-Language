#include <stdio.h>

int main() {

	char *char_80 = "g";

	char *char_37 = "A";

	char *oldChar = "g";
	char *newChar;

	if (oldChar == char_80)
	{
		newChar = char_37;

	}

	printf("Your character is: %s\n", newChar);
}