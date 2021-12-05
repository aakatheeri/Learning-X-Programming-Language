/*

     const myPromise = new Promise( (myResolve, myReject) => {
          // "Producing Code" (May take some time)

          myResolve(); // when successful
          myReject(); // when error

     });

     // "Consuming Code" (Must wait for a fulfilled Promise)
     myPromise.then(
          (value) => { code if successful },
          (value) => { code if some error }
     )

*/

// Example using a Promise

const myPromise = new Promise( (myResolve, myReject) => {
     setTimeout( () => {
          myResolve('I love You!');
     }, 3000);
});

myPromise.then( (value) => {
     console.log(value);
})
