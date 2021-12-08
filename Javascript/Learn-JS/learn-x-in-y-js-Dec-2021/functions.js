
// Functions, Scope and Closures

function myFunction (thing) {
     return thing.toUpperCase();
}
console.log( myFunction('foo') );

function anotherFunction () {
     return console.log({ // with semicolon it will return the value before it
          thisIsAn: 'object literal'
     })
}


// Javascript functions are first class objects, so they can be reassigned to
//   different variable vames and passed to other functions as arguments
//   - for example, when supplying an event handler:
setTimeout(anotherFunction, 3000 );

// Anonymous local scope
(function() {
     var temporary = 5;
     console.log(temporary);
})();
// console.log(temporary); // = undefined


// One of Javascript's most powerful features is closures.
// If a function is defined inside another function,
// the inner function has access toa ll the outer function's variables,
// even afer the outer function exists
function sayHelloInFiveSeconds(name) {
     var prompt = "Hello, " + name + "!";
     // Inner functions are put in the local scope by default,
     // as if they were declared with 'var'

     function inner() {
          console.log( prompt )
     }
     setTimeout(inner, 5000);
}
sayHelloInFiveSeconds('Ahmed');
