
// Javascript's objects are equivalent to 'dictionaries' or 'maps' in other
//   languages: an unordered collaction of key-value

var myObj = {
     key1: "Hello",
     key2: "World"
};

var myObj2 = {
     myKey: "myValue",
     "my other key": 4
}

// Object attributes can also be accessed using the subscript syntax
console.log(myObj2["my other key"]);

// ... or using the dot syntax, provided the key is a valid identifier.
console.log( myObj2.myKey );

// Objects are mutable; values can be changed and new keys added
myObj.myThirdKey = true;

// If you try to access a value that's not yet set, you will get undefined.
myObj.myFourthKey;
console.log(myObj.myFourthKey); // = undefined
