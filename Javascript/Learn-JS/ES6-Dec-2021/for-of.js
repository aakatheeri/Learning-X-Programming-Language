
// for/of lets you loop over data structures that are iterable such as Arrays, Strongs, Maps, NodeLists, and more.

/*

     for (vairable of iterable) {
          // code block to be executed
     }
}

*/

const cars = ["BMW", "Volvo", "Mini"];
let text = "";

for (let x of cars) {
     text += x + " ";
}

console.log(text);

// Looping over a String

let language = "JavaScript";
let text2 = "";

for (let x of language) {
     text2 += x + " ";
}

console.log(text2);
