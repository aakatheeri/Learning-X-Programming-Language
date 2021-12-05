
// Being able to use an Object as a key is an important Map feature.

// Create Objects
const apples = { name: 'Apples' };
const bananas = { name: 'Bananas' };
const oranges = {name: 'Oranges'};

// Create a new Map
const fruits = new Map();

// Add new Elements to the Map

fruits.set(apples, 500);
fruits.set(bananas, 300);
fruits.set(oranges, 200);

console.log(fruits);
