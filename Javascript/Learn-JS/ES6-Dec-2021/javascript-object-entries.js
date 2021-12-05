
// ECMAScript 2017 adds a new Object.entries method to objects.
// The Object.entries() method returns an array of the key/value pairs in an object.

const person = {
     firstName: 'John',
     lastName: 'Doe',
     age: 50,
     eyeColor: 'blue'
};

console.log( Object.entries(person) );
