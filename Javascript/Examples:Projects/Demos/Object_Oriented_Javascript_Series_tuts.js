function print(){
	for(var i = 0; i < arguments.length; i++) {
		console.log(arguments[0]);
	}
}

// Old way to create object in Javascript
/* 
var person = new Object();
person.firstname = "Ahmed";
person.lastname = "Alkatheeri";
person.printName = function() {
	print(person.firstname + " " + person.lastname);
};
 */


// Creating object in literal notation way (single object)
/*
var person = {
	firstname: "Ahmed",
	lastname: "Alkatheeri",
	printName: function() {
		return this.firstname + " " + this.lastname;
	}
};

print(person.printName());

var employee = {
	firstName: "Ahmed",
	lastName: "Alkatheeri",
	position: "Founder",
	printInfo: function (){
		return this.firstName + " " + this.lastName + " is " + this.position;
	}
};

print(employee.printInfo()); */

/* // Creating object in constructor function (multiple objects)
var Person = function (firstName, lastName) {
	return {
		firstName: firstName,
		lastName: lastName,
		getInformation: function() {
			return firstName + " " + lastName;
		}
	}
}

var ahmed = new Person("Ahmed", "Alkatheeri");
print(ahmed.getInformation());  */

// Creating object in construtor function with (Data and Accessor Properties)
/* var Person = function (firstName, lastName) {
	var person = {};

	// Define many properties
	Object.defineProperties(person, {
		firstName: {
			value: firstName,
			writable: true
		},
		lastName: {
			value: lastName,
			writable: true
		},
		fullName: {
			get: function() {
				return this.firstName + " " + this.lastName;
			}
		}
	});

	// Define single property
	/* Object.defineProperty(person, "firstName", {
		value: firstName,
		writable: true
	}); */ /*

	return person;
}


// Create new Person object
var zuStudent_1 = new Person("Ahmed", "Alkatheeri");
print(zuStudent_1.firstName);

// Change firstName property value
zuStudent_1.firstName = "Saeed";
print(zuStudent_1.firstName);

// Display full name
print(zuStudent_1.fullName); */

/*************************************************************/
/*						Exercise 1							 */
/*************************************************************/


