//
//  Foo.h
//  LearningProcess_20142_1
//
//  Created by Ahmed Alkatheeri on 2/4/14.
//  Copyright (c) 2014 Ahmed Alkatheeri. All rights reserved.
//

#ifndef __LearningProcess_20142_1__Foo__
#define __LearningProcess_20142_1__Foo__

#include <iostream>

namespace Foo {
    int fooNumber;
    int numberOfFoo() {
        return fooNumber;
    }
    
    void setNumberOfFoo(int number) {
        fooNumber = number;
    }
    
    void printFooNumber() {
        std::cout << fooNumber << std::endl;
    }
}

#endif /* defined(__LearningProcess_20142_1__Foo__) */
