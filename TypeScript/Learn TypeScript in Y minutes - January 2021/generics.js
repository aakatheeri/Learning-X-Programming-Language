// Generics
// Classes
class Tuple {
    constructor(item1, item2) {
        this.item1 = item1;
        this.item2 = item2;
    }
}
// Functions
let pairToTuble = function (p) {
    return new Tuple(p.item1, p.item2);
};
