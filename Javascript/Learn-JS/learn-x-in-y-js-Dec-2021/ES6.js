

// ES6 Addition

// Define a variables in lexical scope
let name = "Billy";
name = "William";

console.log( name );

console.log('----');

// The "const" keyword allows you to define a variable in a lexical scope
// like with let, but you cannot reassign the value once one has been assigned.

const pi = 3.14;
// pi = 4.13; // You can't dp this.

console.log(pi);

console.log('----');

// New syntax for functions in ES6 known as 'lambda syntax'
const isEven = (number) => {
     return number % 2 === 0;
}

console.log( isEven(7) );

console.log('----');
