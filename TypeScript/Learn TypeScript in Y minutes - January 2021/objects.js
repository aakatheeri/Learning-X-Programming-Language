// Object that imlements the "Person" interface
// Can be treated as a Person since it has the name and move properties
let p = {
    name: "Bobby",
    age: 42,
    move: () => {
    }
};
// Only the parameters' types are important, names are not important.
let mySearch;
mySearch = function (src, sub) {
    return src.search(sub) != -1;
};
export {};
