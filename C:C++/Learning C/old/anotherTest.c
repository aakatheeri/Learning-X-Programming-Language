#include <stdio.h>
#include "test.h"

main() {
    int theSum = sum (8, 22);
    float theAverage = average(16.9, 7.89, 3.4);
    
    printf("the sum is: %i \n", theSum);
    printf("and the average is: %f \n", theAverage);
    printf("average casted to an int is: %i \n", (int)theAverage);
}