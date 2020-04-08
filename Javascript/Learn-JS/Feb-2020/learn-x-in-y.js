// Single-line comments start with two slashes

/* Multiline comments start with slash-star,
    and end with star-slash */

// Statements can be terminated by ;
//doStuff();

/*
3;
1.5;

console.log("My name is Ahmed, I born in " + 1988);

console.log(1 + 1) // = 2
console.log(0.1 + 0.2) // = 0.30
console.log(8-1) // = 7
console.log(10*2) // = 20
console.log(25/5) // = 7

// Including uneven division.
console.log(5/2) // = 2.5

// And modulo division
console.log(10 % 2) // = 0
console.log(30 % 4) // = 2
console.log(18.5 % 7) // = 4.5

// Bitwise operations also work; when you perform a bitwise operation your float
// is converted to a signed int *up to* 32 bits.
console.log(1 << 2) // = 4

// precedence is enforced with parentheses
console.log((1 + 3) * 2) // = 8
*/

/*

// There are three special not-a-real-number values:
console.log(Infinity)
console.log(-Infinity)
console.log(NaN)
console.log('\n')

// String
console.log("My name is")
console.log('Ahmed')

// Negation uses the ! symbol
console.log(!true); // = false
console.log(!false); // = true

// Equality is ===
console.log(1 === 1); // = true
console.log(2 === 1); // = false

// Inequality is !==
console.log(1 !== 1); // = false
console.log(2 !== 1); // = true

// More comparisons
console.log(1 < 10); // = true
console.log(1 > 10); // = false
console.log(2 <= 2); // = true
console.log(2 >= 2); // = true
*/

/*

// ... which works with more than just strings
console.log("1, 2, " + 3) // = "1, 2, 3"
console.log("Hello " + ["world", "!"]); // = "Hello world, !"

// and are compared with < and >
console.log("a" < "b") // = true

// Type coencion is performed for comparisons with double equals...
console.log("5" == 5); // = true
console.log(null === undefined) // = false

// ...which can result in some weird behaviour
console.log(13 + !0) // 14
console.log("13" + !0) // '13true'

// You can access characters in a string with 'charAt'
console.log("This is a string".charAt(0));
console.log("My name is Ahmed".charAt(11));

// ...or use 'substring' to get larger peices.
console.log("Hello world".substring(0,5));



// There is also 'null' and 'undefined'
console.log(null);
console.log(undefined)

*/

/*
  Variables, Arrays, and Objects
*/

/*
var someVar = 5;
someOtherVar = 10
var someThirdVar; // = undefined

var someFourthVar = 3, someFifthVar = 4;

var someVar = someVar + 5; // should be 10 now
var someVar = someVar + 10; // should be 100 now

someVar++; // = 101
someVar--; // = 100

*/
/*
var myArray = ["Hello", 45, true];

myArray[1]; // = 45

myArray.push("World") // = ['Hello', 45, true, 'World']
console.log(myArray);
console.log(myArray.length)
myArray[3] = "Ahmed";
console.log(myArray);
console.log(myArray.pop());

*/

/*
// Join all elements of an array with semicolon
var myArray0 = [32, false, "js", 12, 56, 90]
//console.log(myArray0.join(";"));

// Get subarray of elements from index 1 (include) to 4 (exclude)
//console.log(myArray0.slice(1,4)); // = [false, "js", 12]

// Remove 4 elements starting from index 2, and insert there strings
myArray0.splice(2,4, "Hi", "wr", "ld");
console.log(myArray0);
*/

// Javascript's objects are quivalent to "dictionaries" or "maps" in other in languages
    // An unordered collection of key-value pairs.

/*
var myObj = {key1: "Hello", key2: "Ahmed"};

var myObj = {
  myKey: "myValue",
  "my other key": 4
}

console.log(myObj["my other key"]) // = 4
console.log(myObj.myKey);

// Objects are mutable; values can be changed and new keys added
myObj.myThirdKey = true;

// If you try to access a value that's not yet set, you will get undefined.
myObj.myFourthKey; // = undefined

console.log(myObj.myThirdKey);
console.log(myObj.myFourthKey);
*/

/////////////////////////////////////
// Logic and Control Structures
/*
var count = 1;
if (count == 3) {
  // evaluated if count is 3
} else if (count == 5) {
  // evaluated of count is 5
} else {
  // evaluated if it's not either 3 or 5
}

// As does 'while'
while (true) {
  // an infinite loop!
}

var input;
do {
  input = getInput();
} while (!isValid(input));

// Breaking out of labeled loops is similar to Java
outer:
for (var i = 0; i < 10; i++) {
  for (var j = 0; j < 10; j++) {
    if (i == 5 && j == 5) {
      break outer;
      // break out of outer loop instead of only the inner one
    }
  }
}

*/

/*

// The for/in statement allows iteration over properties of an object.
var description = "";
var person = {fname: "Paul", lname: "Ken", age:18};
for (var x in person) {
  description += person[x] + " ";
} // description = 'Paul Ken 18 '

console.log(description);

// The for/of statement allows iteration over iterable objects (including the built-in String)
// Array, e.g. the Array-like arguments or NodeList objects, TypedArray, Map and Set,
// and user-defined iterables
var myPets = ""
var pets = ["cat", "dog", "hamster", "hedgehog"];
for (pet of pets) {
  myPets += pet + " ";
}
console.log(myPets);

// && is logical and, || is logical or
var house = {size: "big", colour: "blue", filtered: false};

if (house.size == "big" && house.colour == "blue") {
  house.filtered = true;
}
console.log(house);

*/

/*

// && and || "short circuit", which is useful for setting default values
//var name = otherName || "default";

// The 'switch'  statement checks for equality with '==='
// Use 'break' after each case
// or the cases after the correct one will be executed too.
var grade = "B";
switch (grade) {
  case 'A':
    console.log("Great job");
    break;
  case 'B':
    console.log("OK job");
    break;
  case 'C':
    console.log("You can do better");
    break;
  default:
    console.log("Oy vey");
    break;
}

*/

/////////////////////////////////
// Functions, Scope and Closures

/*
// Javascript functions are declared with the 'function' keyword
function myFunction(thing) {
  console.log(thing.toUpperCase());
}
myFunction("foo"); // = "FOO"

// Allman style
function myFunction2() {
  return // <- semicolon automatically inserted here
  {thisIsAn: "object literal"}
}
console.log(myFunction2());

// Functions can be passed to other functions as well
function myFunction3() {
  console.log('Passed');
}
setInterval(myFunction3, 1000)


// Functions can be defined as a parameter of another funciton
setTimeout(function(){
    console.log("Call Me!");
}, 5000)


// Javascript has function scope; functions get their own scope but other blocks do not
if (true) {
  var i = 5;
}
console.log(i);



// This has led to a common pattern of 'immediately-executing anonymous'
// functions", which prevent temporary variables from leaking into the global scope

(function() {
  var temporary = 5;

  global.permanent = 10;

})();
// console.log(temporary); // raises ReferenceError
console.log(permanent); // = 10

// Closures feature on functions
// If a function is defined inside another function, the inner function has access to all the outer function's variables, even after the outer function exists.
function sayHelloInFiveSeconds(name) {
  var prompt = "Hello, " + name + "!";

  // Inner functions are put in the local scope by default, as if they were
  // declared with 'var'.
  function inner() {
    console.log(prompt);
  }

  setTimeout(inner, 3000);
}

sayHelloInFiveSeconds("Adam"); // will shows a message with "Hello, Adam!" in 5s

*/

///////////////////////////////
// More about Objects; Constructors and Prototypes

/*

var myObj = {
  myFunc: function() {
    return "Hello world!";
  }
};

console.log(myObj.myFunc());

myObj = {
  myString: "Hello world!",
  myFunc: function() {
    return this.myString;
  }
}

console.log(myObj.myFunc());

// assign a function into another function
var myFunc = myObj.myFunc();
console.log(myFunc);

var myOtherFunc = function() {
  return this.myString.toUpperCase();
}

// We can also specify a context for a function to execute in when we invoke it
// using 'call' or 'apply'

myObj = {
  myString: "Hello world!",
  myFunc: function() {
    return this.myString;
  }
}

var anotherFunc = function(s) {
  return this.myString + s;
}

console.log(
  anotherFunc.call(myObj, " And Hello Moon!") );
    // = "Hello World! And Hello Moon"

console.log (
  anotherFunc.apply(myObj, [" And Hello Sun"])
);

myObj = {
  myString: "Hello World!",
  myFunc: function() {
    return this.myString;
  }
}

var anotherFunc = function(s) {
  return this.myString + s;
}

// 'bind' can also be used to partially apply (curry)  a function
var boundFunc = anotherFunc.bind(myObj);
console.log(
  boundFunc(" And Hello Saturn!")
);

// When you call a function with the 'new' keyword, a new object is created, and
// made available to the function via the 'this' keyword. Functions designed to be
// called like that are called constructors.

var myConstructor = function() {
  this.myNumber = 5
};
myNewObj = new myConstructor();
console.log(myNewObj.myNumber); // = 5



// Some JS implementations let you access an object's prototype on the magic
// property '__proto__'. While this is useful for explaining prototypes it's not
// part of the standard; we'll get to standard ways of using protytypes later.

var myObj = {
  myString: "Hello world!"
}
var myPrototype = {
  meaningOfLife: 42,
  myFunc: function() {
    return this.myString.toLowerCase();
  }
};

myObj.__proto__ = myPrototype;
console.log(myObj.meaningOfLife); // = 42
console.log(  myObj.myFunc() );

// Of course, if your property isn't on your prototype, the prototype's
  // is searched, and so on.
myPrototype.__proto__ = {
  myBoolean: true
}
console.log(myObj.myBoolean); // = true

// Object updated and changed together
myPrototype.meaningOfLife = 43;
myObj.meaningOfLife; // = 43;

// The for/in statement allows iteration over properties of an object,
// walking up the prototype chain until it sees a null prototype
for (var x in myObj) {
  console.log(myObj[x]);
}

for (var x in myObj) {
  if (myObj.hasOwnProperty(x)) {
    console.log(myObj[x]);
  }
}

// Changing current prototype of existing object
// Object.create() - which is a recent addition to JS, and therefore, but not available in all implementations yet
var myObj = Object.create(myPrototype)
console.log(myObj.meaningOfLife); // = 43



// Object.prototype() - prototype of constructor of new object
myConstructor.prototype = {
  myNumber: 5,
  getMyNumber: function() {
    return this.myNumber;
  }
};
var myNewObj2 = new myConstructor()
console.log(myNewObj2.getMyNumber())
myNewObj2.myNumber = 6;
console.log(myNewObj2.getMyNumber()) // = 6

// Built-in types like String, Number also have constructors that create
// equivalent wrapper objects
var myNumber = 12;
var myNumberObj = new Number(12);
console.log(myNumber == myNumberObj);

// (typeof Object) Except, they aren't exactly equivalent.
console.log(typeof myNumber); // = 'number'
console.log(typeof myNumberObj) // = 'object'
console.log(myNumber === myNumberObj) // = false

if (0) {
  // this code will not execute because wrapped numbers are objects, and Objects
  // are always truthy
}

if (new Number(0)) {
  // This code will execute, because wrapped numbers are objects, and objects
  // are always truthy
}



// You can add functionality to a string, for instance
String.prototype.firstCharacter = function() {
  return this.charAt(0);
}
console.log("abc".firstCharacter()); // = "a"

*/

////////////////////////
// ES6 Additions

// "let" keyword allows you to define variables in a lexical scope
let name = "Billy"
console.log(name);

// Variables defined with let can be reassigned new values.
firstname = "Ahmed";
console.log(firstname);

// The "const" keyword allows you to define a variable in a lexical scope, like let
const pi = 3.14;
console.log(pi);

// There are a new syntax for functions in ES 6 known as "lambda syntax".
// This allows functions to be defined in a lexical scope like with Variables
// defined by const and let
isEven = (number) => {
  return number % 2 === 0;
};

console.log(
  isEven(4)
);

// using the lambda syntax cannot be called before the definition.
// The following is an example of invalid usage:

const add = (firstNumber, secondNumber) => {
  return firstNumber + secondNumber;
}

console.log(
  add(1, 9)
);
