
// Arrays are ordered lists of values, of any type.
var myArray = ["Hello", 45, true];

// Their memebers can be accessed using the square-brackets subscript syntax.
// Array indices start at zero
myArray[1]; // = 45

// Arrays are mutable and of variable length
myArray.push("World");
myArray.length; // = 4

// Add/Modify at specific index
myArray[3] = "Hello";

// Add and remove elements from fornt or back end of an Array
myArray.unshift(3); // Add as the first elements
myArray.unshift('Ahmed');

console.log(myArray);

someVar = myArray.shift(); // Remove first element and return it
console.log(someVar);

myArray.push(3) // Add as the last element
someVar = myArray.pop(); // Remove the last element and return it
console.log(someVar);

// Join all elements of an array with semicolon
var myArray0 = [32, false, "js", 12, 56, 90];
myArray0Joined = myArray0.join("; ");
console.log(myArray0Joined);

// Get subarray of elements from index 1 (include) to 4 (execlude)
console.log( myArray0.slice(1, 4) );

// Remove 4 elements starting from index 2, and insert there strings
myArray0.splice(2, 4, 'hi', 'wr', 'ld')
console.log( myArray0 );
