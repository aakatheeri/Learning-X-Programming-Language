// Modules, "." can be used as separator for sub modules
var Geometry;
(function (Geometry) {
    class Square {
        constructor(sideLength = 0) {
            this.sideLength = sideLength;
        }
        area() {
            return Math.pow(this.sideLength, 2);
        }
    }
    Geometry.Square = Square;
})(Geometry || (Geometry = {}));
let s1 = new Geometry.Square(5);
// Local alias for referencing a module
var G = Geometry;
let s2 = new G.Square(10);
