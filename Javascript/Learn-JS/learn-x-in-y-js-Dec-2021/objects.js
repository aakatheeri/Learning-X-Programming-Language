
// Javascript's objects are equivalent to 'dictionaries' or 'maps' in other
//   languages: an unordered collaction of key-value

var myObj = {
     key1: "Hello",
     key2: "World"
};

var myObj2 = {
     myKey: "myValue",
     "my other key": 4
}

// Object attributes can also be accessed using the subscript syntax
console.log(myObj2["my other key"]);

// ... or using the dot syntax, provided the key is a valid identifier.
console.log( myObj2.myKey );

// Objects are mutable; values can be changed and new keys added
myObj.myThirdKey = true;

// If you try to access a value that's not yet set, you will get undefined.
myObj.myFourthKey;
console.log(myObj.myFourthKey); // = undefined


// More about Objects; Constructors and Prototypes

// Objects can contain functions.
var myObj3 = {
     myFunc: function() {
          return "Hello world!";
     }
};
console.log ( myObj3.myFunc() ); // = "Hello world!"

// When functions attached to an object are called, they can access the object
// they are attached to using the 'this' keyword.
var myObj4 = {
     myString: "Hello world again!",
     myFunc: function() {
          return this.myString;
     }
}

console.log( myObj4.myFunc() );

// We can also specify a context for a function to execute in when we invoke it
// using 'call' or 'apply'
var anotherFunc = function(s) {
     return this.myString + s;
}
console.log( anotherFunc.call(myObj4, " And Hello moon!") );

// The 'apply' function is nearly identical, but takes an array for an argument
console.log( anotherFunc.apply(myObj4, [' And Hello Sun!']) );

// But 'call' and 'apply' are only temporary.
// When we want it to stick, we can use 'bind'
var boundFunc = anotherFunc.bind(myObj4);
console.log( boundFunc(' And Hello Saturn!') );


// Object Constructor
var myConstructor = function() {
     this.myNumber = 5;
}
var myNewObj = new myConstructor(); // = { myNumber: 5 }
console.log(myNewObj.myNumber);

// Prototype (every function in JS has a prototype to extend the
//   funciton explaining)

var myObj = {
     myString: "Hello world!"
};

var myPrototype = {
     meaningOfLife: 42,
     myFunc: function() {
          return this.myString.toLowerCase();
     }
}

myObj.__proto__ = myPrototype;
console.log(myObj.meaningOfLife); // = 42
console.log(myObj.myFunc());

// If your property isn't on your prototype,
//  the prototype's prototype is searched, and so on.

myPrototype.__proto__ = {
     myBoolean: true
}
console.log( myObj.myBoolean ); // = true

// The for/in statement allows interation over properties of an object,
//  walking up the prototype chain until it sees a null prototype.
for (var x in myObj) {
     console.log( myObj[x] );
}

console.log('----');

// To only consider properties attached to the object itself
//  and not its prototypes, use the 'hasOwnProperty()'
for (var x in myObj) {
     if (myObj.hasOwnProperty(x)) {
          console.log( myObj[x] );
     }
}

console.log('----');

// Create new object with a given prototype.

var myObj = Object.create(myPrototype);
console.log( myObj.meaningOfLife);

console.log('----')

// Create an object with constructor
myConstructor.prototype = {
     myNumber: 5,
     getMyNumber: function() {
          return this.myNumber;
     }
}

var myNewObj2 = new myConstructor();
console.log( myNewObj2.getMyNumber() );
myNewObj2.myNumber = 6
console.log( myNewObj2.getMyNumber() );

console.log('----');

// check the Type Of

var myNumber = 12;
var myNumberObj = new Number(12);

console.log( typeof myNumber );
console.log( typeof myNumberObj );
console.log ( myNumber === myNumberObj);

console.log('----');

// The wrapper objects and the regular builtins share a prototype
//  so you can actually add functionality to a string, for instance

String.prototype.firstCharacter = function() {
     return this.charAt(0);
}
console.log( "abc".firstCharacter() );
