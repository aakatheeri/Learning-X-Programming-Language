var p1 = {
    name: "Tyrone",
    age: 42
};
// p1.age = 25; // Error, p1.age is read-only
var p2 = {
    name: "John",
    age: 60
};
var p3 = p2; // Ok, read-only alias for p2
// p3.age = 35; // Error, p3.age is read-only
p2.age = 45; // Ok, but also changes p3.age because of aliasing
//-----
class Car {
    constructor() {
        this.year = 2018;
        this.make = "Unknown Make"; // Assignment permitted in constructor
        this.model = "Unknown Model"; // Assignment permitted in constructor
    }
}
let numbers = [0, 1, 2, 3, 4];
let moreNumbers = numbers;
// moreNumbers[5] = 5; // Error, elements are read-READONLY
// moreNumbers.push(5); // Error, no push method (bacause it mutates array)
// moreNumbers.length = 3; // Error, length is read-only
// numbers = moreNumbers; // Error, mutating methods are missing
