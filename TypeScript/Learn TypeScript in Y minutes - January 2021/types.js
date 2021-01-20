// There are 3 basic types in TypeScript
let isDone = false;
let lines = 42;
let name = "Anders";
// Use const keyword for constants
const numLivesForCat = 9;
// numLivesForCat = 1; // Error
// For collections, there are typed arrays and generic arrays
let list = [1, 2, 3];
// Alternatively, using the generic array type
// let list: Array<number> = [1, 2, 3];
// For enumerations:
var Color;
(function (Color) {
    Color[Color["Red"] = 0] = "Red";
    Color[Color["Green"] = 1] = "Green";
    Color[Color["Blue"] = 2] = "Blue";
})(Color || (Color = {}));
let c = Color.Green;
// Lastly, "void" is used in the special case of a function returning nothing
function bigHorribleAlert() {
    alert("I'm a little annoying box!");
}
export {};
