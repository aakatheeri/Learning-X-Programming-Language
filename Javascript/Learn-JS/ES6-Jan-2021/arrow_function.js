
// Arrow functions allows a short syntax for writing function expressions
// You don't need the "function" ketword, the "return" keyword, and the "curly brackets".

// Using "const" keyword with arrow function is safer than using "var" keyword, because a function expression is always a constant value
/*

// ES5
var multiply_1 = function (x, y) {
     return x * y;
}

// ES6
const multiply_2 = (x, y) => x * y

console.log( multiply_1(2, 4) ) // => 8
console.log( multiply_2(2, 3) ) // => 6

*/

/*

const add = (n1, n2) => n1 + n2;
console.log( add(5, 5) ) // => 10

const whatis = ( command ) => {
     if ( command == 'ls' ) {
          return 'List files and directories on current work directory.'
     } else if ( command == 'cd' ) {
          return 'Change the work directory.'
     } else {
          return 'Not registered yet!'
     }
}
console.log( whatis('ls') )

*/

const print_fullname = (first, last) => {
     return first + ' ' + last;
}
console.log( print_fullname('Ahmed', 'Alkatheeri') )
