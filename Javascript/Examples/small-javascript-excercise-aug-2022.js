/*

     Excercise instruction:

       - Setup first and last name on one String local variable.

       - Print a greeting messages to the user, in template string.

       - Print reference of user in uppercase of fullname

*/

let first = 'Ahmed',
     last = 'Alkatheeri',
     fullname = `${first} ${last}`;

console.log(`Hello ${fullname}! \n Nice to see you!\n`);
console.log(`Your user reference is: ${fullname.toUpperCase().replace(' ', '')}`)
console.log('\n')
