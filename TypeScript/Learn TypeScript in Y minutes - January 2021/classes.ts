import { Person } from './objects'
// Classes - members are public by default
class Point {
     x: number;

     // Constructor - the public/private keywords in this context will generate the boiler plate code for the property and the initialization in the constructor.
     // In this example, "y" will be defined just like "x" is, but with less code
     // Default values are also supported

     constructor (x: number, public y: number = 0) {
          this.x = x;
     }

     // Functions
     dist(): number {
          return Math.sqrt(this.x * this.x + this.y * this.y)
     }

     // Static members
     static origin = new Point(0, 0);
}

// Classes can be explicitly marked as implementing an interface.
// Any missing properties will then cause an error at complite-time.
class PointPerson implements Person {
     name: string;
     move() {

     }
}

let p1 = new Point(10, 20);
let p2 = new Point(25);


// Inheritance
class Point3D extends Point {

     constructor (x: number, y: number, public z: number = 0) {
          super (x, y) // Explicit call to the super class constructor is mandatory
     }

     dist(): number {
          let d = super.dist();
          return Math.sqrt(d * d + this.z * this.z);
     }
}
