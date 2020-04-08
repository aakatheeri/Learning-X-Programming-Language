#ifndef Student_h
#define Student_h
#include <iostream>
using namespace std;

extern string student_name; // use extern for declare global variable on the class
extern int student_age;

// Methods
void registerStudent();
void printStudent();

#endif
