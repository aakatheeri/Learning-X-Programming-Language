
// The find() method returns the value of the first array element that passes a test function.

const numbers = [4, 9, 16, 25, 29, 43];

let first = numbers.find(myFunction);

function myFunction(value, index, array) {
     return value > 18;
}

console.log( first );
