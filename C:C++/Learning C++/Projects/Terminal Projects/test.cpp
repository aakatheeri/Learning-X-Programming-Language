#include <iostream>
#include <string>
using namespace std;

void header();
void footer();

int number(int number) {
	return number;
}

int yourAge() {
	return number(25);
}

int main () {
	
	header();
	cout << "This year your age will " << yourAge()+1 << " may of allah" << endl
	<< " .. your age now is " << yourAge() << endl;
	footer();

	return 0;
}

void header () {
	cout << "[Header Part]" << endl;
}

void footer() {
	cout << "[Footer Part]" << endl;
}