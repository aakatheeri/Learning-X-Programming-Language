// Iterators and Geenrators

// for .. of statement
// iterate over the list of values on the object being iterated
let arrayOfAnyType = [1, "string", false];
for (const val of arrayOfAnyType) {
     console.log(val); // 1, "string", false
}

let list = [4, 5, 6];
for (const i of list) {
     console.log(i); // 4, 5, 6
}

// for ..in statement
// iterate over the list of keys on the object being iterated
for (const i in list) {
     console.log(i); // 0, 1, 2
}

// Type Assertion

// let foo = {}; // Creating foo as an empty object
// foo.bar = 123; // Error: property 'bar' does not exist on `{}`
// foo.baz = 'hello world'; // Error: property 'baz' does not exist on `{}`

// Because the interred type of foo is `{}` (an object with 0 properties), you are not allowed to add bar and baz to it. However with type assertion,
// the following will pass:

interface Foo {
     bar: number;
     baz: string;
}

let foo = {} as Foo;
foo.bar = 123;
foo.baz = 'hellow world';
