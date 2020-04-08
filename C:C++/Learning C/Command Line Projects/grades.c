#include <stdio.h>

int main () {
	printf("\t\t Grade Program \n\n");

	int currentGrade, newGrade;
	char *grade;

	currentGrade = 90;
	newGrade = 80;

	if (newGrade>90)
	{
		grade = "A";
	} else if (newGrade<90 && newGrade>=80)
	{
		grade = "B";
	} else if (newGrade<80 && newGrade>=70)
	{
		grade = "C";
	} else if (newGrade<70 && newGrade>=60) {
		grade = "D";
	} else {
		grade = "F";
	}

	printf("Your old grade is %i,\n \t and your new grade is %i, \n \t \t and it's equal to (%s),  \n \t \t \t and your grade average is %i \n", currentGrade, newGrade, grade, (currentGrade+newGrade)/2);
}