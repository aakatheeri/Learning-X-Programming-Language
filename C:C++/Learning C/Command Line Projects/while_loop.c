#include <stdio.h>

char *NewRandomWord(int id) {

	char *word;
	switch (id) {
		case 0:
			word = "Your eye is beautiful!";
			break;
		case 1:
			word = "Killuminati";
			break;
		case 2:
			word = "Sucker";
			break;
		case 3:
			word = "Just a word";
			break;
		case 4:
			word = "I'm in home";
			break;
		case 5:
			word = "I want to sleep!";
			break;
		default:
			word = "No Word!";
	}

	return word;
}

int main() {

	int counter = 1;

	while (counter++<5) {
		printf("%s\n", NewRandomWord(counter));
		if (counter == 4)
			break;
		//counter++;
	}
}