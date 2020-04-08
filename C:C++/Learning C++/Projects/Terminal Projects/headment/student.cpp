#include <iostream>
#include "student.h"
using namespace std;

void registerStudent(string first, string last, int age) {
	student_firstname = first;
	student_lastname = last;
	student_age = age;

}
void printStudent() {
	cout << student_firstname << " " 
		 << student_lastname 
		 << " (" 
		 << student_age 
		 << ")" 
		<< endl;
}