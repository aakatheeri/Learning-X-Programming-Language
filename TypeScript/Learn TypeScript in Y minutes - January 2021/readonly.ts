// READONLY: New Feature in TypeScript 3.1
interface Person {
     readonly name: string;
     readonly age: number;
}

var p1: Person = {
     name: "Tyrone",
     age: 42
}
// p1.age = 25; // Error, p1.age is read-only

var p2 = {
     name: "John",
     age: 60
}
var p3: Person = p2; // Ok, read-only alias for p2
// p3.age = 35; // Error, p3.age is read-only
p2.age = 45; // Ok, but also changes p3.age because of aliasing

//-----

class Car {
     readonly make: string;
     readonly model: string;
     readonly year = 2018;

     constructor() {
          this.make = "Unknown Make"; // Assignment permitted in constructor
          this.model = "Unknown Model"; // Assignment permitted in constructor
     }
}

let numbers: Array<number> = [0, 1, 2, 3, 4];
let moreNumbers: ReadonlyArray<number> = numbers;
// moreNumbers[5] = 5; // Error, elements are read-READONLY
// moreNumbers.push(5); // Error, no push method (bacause it mutates array)
// moreNumbers.length = 3; // Error, length is read-only
// numbers = moreNumbers; // Error, mutating methods are missing
