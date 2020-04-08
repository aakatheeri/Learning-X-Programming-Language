#include "Student.h"

// Properties
string student_name;
int student_age;

void registerStudent() {
    cout << "What is your name? ";
    getline(cin, student_name);
    
    cout << "How old are you? ";
    cin >> student_age;
}

void printStudent() {
    cout << "[Student Name] => " << student_name << " [Student Age] => " << student_age << endl;
}