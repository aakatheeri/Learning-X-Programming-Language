// The rest parameter (...) allows a function to treat
// an indefinite number of arguments as an array:

function sum(...args) {
     let sum = 0;

     for (let arg of args) {
          sum += arg;
     }

     return sum;
}

let x = sum(4, 5, 6, 3, 10, 5);
console.log(x);
