// Functions are first class citizens, support the lambda "fat arrow" syntax and use type inference
// The following are equivalent, the same signature will be interred by the compiler, and same JavaScript will be emitted
let f1 = function (i) {
    return i * i;
};
// Return type inferred
let f2 = function (i) {
    return i * i;
};
// "Fat arrow" syntax
let f3 = (i) => {
    return i * i;
};
// "Fat arrow" syntac with return type inferred
let f4 = (i) => {
    return i * i;
};
// "Fat arrow" syntax with return type inferred, braceless means no return
// keyword needed
let f5 = (i) => i * i;
