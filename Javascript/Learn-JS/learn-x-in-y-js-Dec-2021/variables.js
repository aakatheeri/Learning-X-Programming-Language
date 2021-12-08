
/*
     Values
*/

// integer
console.log('- Integer -');
console.log(3);

// float
console.log('- Float -');
console.log(1.5);

// arithmetics
console.log('- Arithmetics -');
console.log(1 + 1);
console.log(0.1 + 0.2);
console.log(10 * 2)
console.log(35 / 5);
console.log(5 / 2);

// modulo division
console.log('- Modulo Division -');
console.log(10 % 2);
console.log(30 % 4);
console.log(18.5 % 7);

// Bitwise operations also works
// is converted to a signed int *up to* 32 bits
console.log(' - Bitwise -');
console.log(1 << 2);
console.log(2 << 8);

// There are three special not-a-real-number values:
console.log(' - Not a Real Number -');
console.log(Infinity);
console.log(-Infinity);
console.log(NaN);

// booleans
console.log(' - Boolean -');
console.log(true);
console.log(false);
console.log(!true);
console.log(!false);


// Stings are created with ' or ".
console.log(' - Strings -');
console.log('abc');
console.log("Hello, world");

// Equality is ===
console.log(' - Equality -');
console.log(1 === 1); // = true
console.log(2 === 1); // = false

// Inequality is !==
console.log(' - Inequality -');
console.log(1 !== 1);
console.log(2 !== 1);

// More comparisons
console.log(' - More comparisons -');
console.log(1 < 10); // = true
console.log(1 > 10); // = false
console.log(1 <= 2); // = true
console.log(2 >= 2); // = true

// Strings are concatenated with +
console.log("Hello " + "world!");

// ... which works with more than just strings
console.log("1, 2, " + 3); // = "1, 2, 3"
console.log("Hello " + ["world", "!"]); // = "Hello world,!"

// and are compared with < and >
console.log("a" < "b");

// Type coercion is performed for comparisons with double equals...
console.log("5" == 5); // = true
console.log(null == undefined); // = true

// ...unless you use ===
console.log("5" === 5) // = false
console.log(null === undefined) // = false

console.log('- Access characters - ');
console.log('This is a string'.charAt(0));
console.log('Hello world'.substring(0, 5));

/*
     Variables are declared with the 'var' keyword. Javascript is dynamically
*/


var someVar = 5;
someOtherVar = 10;

var someThirdVar; // = undefined

// If you want to declare a couple of variables, then you could use a comma
var someFourthVar = 2, someFifthVar = 4;

// There is shorthand for performing math operations on variables:
someVar += 5;
someVar *= 10;

// and an eve-shorter-hand for addinhg or subtracting 1
someVar++;
someVar--;

// Setting default values of variable
let otherName = '';
var name = otherName || 'default';
console.log(name);
