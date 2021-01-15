
// The let keyword allows you to declare a variable with block scope
//   while var keyword allows you to declare a variable with global scope

/*

var x = 10;

{
     let x = 2;
}

console.log(x); // => 10

*/

let name = "Ahmed";

{
     let name = null;
}

console.log(name); // => Ahmed
