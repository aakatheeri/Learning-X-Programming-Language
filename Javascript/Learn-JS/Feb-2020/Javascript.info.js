/*********************************
          Code Structure
*********************************/

/*
console.log('Hello');

console.log(
  "My name is",
  "Ahmed"
);

*/

/*
    The modern mode, "use strict"
*/

//"use strict";

/*********************************
            Variables
*********************************/

/*
let message;

message= "TCT AhmedK";

message = "CTCT Ahmed" // value changed

console.log(message);

// using other languages on naming variables
  // not recommended

/
let إسم = "Ahmed";
console.log(إسم);



// Constants - can not be changed
const myBirthday = '29.03.1988';
//myBirthday = '01.01.1988' // error

console.log(myBirthday);



// using Uppercase characters on constants variables

const MACHINE = 'ios';
const VERSION = '12.3';
const IS_DEBUG = true;

let message = "";

if (MACHINE == 'ios') {
  message += "This is for iOS implementation, built for iOS " + VERSION + " version. ";
  if (IS_DEBUG == true) {
    message += "Debugging is enabled.";
  }
}

console.log(message);

*/

/*********************************
            TASKS
*********************************/

// Declare two variables admin and name.
let admin, name;

// assign the value "John" to name
name = "John";

// Copy the value from name to admin
admin = name;

// Show the value of admin using console.log
console.log(admin);
