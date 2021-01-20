export{}

// There are 3 basic types in TypeScript
let isDone: boolean = false;
let lines: number = 42;
let name: string = "Anders";

// Use const keyword for constants
const numLivesForCat = 9;
// numLivesForCat = 1; // Error

// For collections, there are typed arrays and generic arrays
let list: number[] = [1, 2, 3];
// Alternatively, using the generic array type
// let list: Array<number> = [1, 2, 3];

// For enumerations:
enum Color {
     Red,
     Green,
     Blue
}
let c: Color = Color.Green;

// Lastly, "void" is used in the special case of a function returning nothing
function bigHorribleAlert(): void {
     alert("I'm a little annoying box!");
}
