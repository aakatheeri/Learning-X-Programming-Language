// Interfaces are structural, anything that has the properties is compliant with the interface
export interface Person {
     name: string;
     age?: number; // optional properties, marked with a "?"
     move(): void; // functions
}

// Object that imlements the "Person" interface
// Can be treated as a Person since it has the name and move properties
let p: Person = {
     name: "Bobby",
     age: 42,
     move: () => {

     }
}

// Is not a person because age is not a number
/*
let invalidPerson: Person = {
     name: "Bobby",
     age: true
}
*/

// Interfaces can also describle a function type
interface SearchFunc {
     (source: string, subString: string): boolean;
}

// Only the parameters' types are important, names are not important.
let mySearch: SearchFunc;
mySearch = function(src: string, sub: string) {
     return src.search(sub) != -1
}
