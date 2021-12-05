const person = {
     firstName: 'John',
     lastName: 'Doe',
     age: 50,
     eyeColor: 'blue'
}

let id = Symbol('id');
person[id] = 1409453;

console.log(person[id]); // 1409453
console.log(person.id); // undefined
