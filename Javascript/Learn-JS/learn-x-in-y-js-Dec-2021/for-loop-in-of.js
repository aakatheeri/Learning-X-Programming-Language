// The for/in statement allows interation over properties of an object
var description = "";
var person = { fname: "Paul", lname: "Ken", age: 18 };
for (var x in person) {
     description += person[x] + " ";
}
console.log(description);

// The for/of statement allows interation oevr iterable
//   objects ( including the built-in String, Array, e.g. the Array-like arguments)
//   or NodeList objects, TypedArray, Map and Set, and user-defined iterables

var myPets = "";
var pets = ["cat", "dog", "hamster", "hedgehog"];
for (var pet of pets) {
     myPets += pet + " ";
}
console.log(myPets);
