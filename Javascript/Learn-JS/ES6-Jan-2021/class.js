
// JavaScript Classes are templates for JavaScript Objects.
// Use the keyword "class" to create a class
// Always add a method named constructor() with the class

// Create a class named "Car". The class has two initial properties: "name" and "year".
class Car {
     constructor(name, year) {
          this.name = name;
          this.year = year;
     }

     whatIsTheCar() {
          return 'This is "' + this.name + '", model "' + this.year + '"';
     }
}

// Using Car class
let ahmedCar = new Car("Altima", 2006);
let fatimaCar = new Car("BMW", 2008);

console.log(ahmedCar.whatIsTheCar());
