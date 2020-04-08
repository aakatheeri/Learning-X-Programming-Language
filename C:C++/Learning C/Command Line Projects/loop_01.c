#include <stdio.h>

int main () {
	
	printf("\n\n");
	for(int i=1; i<10; i++) {
		if(0 == (i%2)) {
			printf("\tThe number (%i) is (even)\n", i);
		} else {
			printf("\tThe number (%i) is (odd)\n", i);
		}
	}

	return 0;
}