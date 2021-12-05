class Car {

     constructor(name, year) {
          this.name = name;
          this.year = year;
     }
}

// Using Car class

const myCar = new Car('Tesla', 2021);
const anotherCar = new Car('Altima', 2006);

console.log(myCar.name);
