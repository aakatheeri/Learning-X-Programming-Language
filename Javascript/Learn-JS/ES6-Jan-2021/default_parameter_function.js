
// ES6 allows function aprameters to have deafult values

function add (x, y = 10) {
     return x + y;
}
console.log( add(5) ) // => 15

const multiply = (x, y = 5) => x * y;
console.log( multiply(2) ) // => 10
