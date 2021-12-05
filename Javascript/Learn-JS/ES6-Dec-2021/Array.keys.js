
// The Array.keys() method returns an Array Iterator
// object with the keys of an array

const fruits = ["Banana", "Orange", "Apple", "Mango"];

const keys = fruits.keys();

let text = "";

for (let x of keys) {
     text += ( x + 1 == fruits.length) ? x : x + '\n';
}
console.log(text);
