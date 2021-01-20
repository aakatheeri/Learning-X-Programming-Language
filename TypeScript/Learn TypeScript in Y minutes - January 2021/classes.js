// Classes - members are public by default
class Point {
    // Constructor - the public/private keywords in this context will generate the boiler plate code for the property and the initialization in the constructor.
    // In this example, "y" will be defined just like "x" is, but with less code
    // Default values are also supported
    constructor(x, y = 0) {
        this.y = y;
        this.x = x;
    }
    // Functions
    dist() {
        return Math.sqrt(this.x * this.x + this.y * this.y);
    }
}
// Static members
Point.origin = new Point(0, 0);
// Classes can be explicitly marked as implementing an interface.
// Any missing properties will then cause an error at complite-time.
class PointPerson {
    move() {
    }
}
let p1 = new Point(10, 20);
let p2 = new Point(25);
// Inheritance
class Point3D extends Point {
    constructor(x, y, z = 0) {
        super(x, y); // Explicit call to the super class constructor is mandatory
        this.z = z;
    }
    dist() {
        let d = super.dist();
        return Math.sqrt(d * d + this.z * this.z);
    }
}
export {};
