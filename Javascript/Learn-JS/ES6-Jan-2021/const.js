
// The const keyword allows you to declare a constant (a Javascript variable with a constant value) - value that can not be changed

/*

const x = 5;
x = 10;
console.log(x); // => Error message "Assignment to constant variable"

*/

var x = 10;

{
     const x = 2;
}

console.log(x); // => 10
