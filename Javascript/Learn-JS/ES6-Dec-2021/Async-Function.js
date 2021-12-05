async function myDisplay() {
     let myPromise = new Promise ( (myResolve, myReject) => {
          setTimeout( () => {
               myResolve('I love you!');
          }, 3000);
     });

     console.log( await myPromise);
}

myDisplay();
