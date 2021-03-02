<template>
  <ion-app>
    <ion-router-outlet />
  </ion-app>
</template>

<script>
import { IonApp, IonRouterOutlet } from '@ionic/vue';
import { defineComponent } from 'vue';
import appStorage from './storage';

export default defineComponent({
     name: 'App',
     components: {
          IonApp,
          IonRouterOutlet
     },
     async created() {
          console.log('App is created!');

          // appStorage.clear();

          let isStorageKeysExist = false;

          // Get the current keys exist on app storage
          const storageKeys = appStorage.keys();

          // Get the the keys with Promise response
          storageKeys.then((response) => {

               // Check if every required key is exist
               response.forEach((key) => {

                    if (key == 'lastLessonCompleted' || key == 'lastSessionCompleted' || key == 'totalCompletedTutorials') {

                         // Assign key existance to true
                         isStorageKeysExist = true;

                    }

               })

          }).then(() => {

               // Check if keys are not exist
               if (isStorageKeysExist === false) {

                    // If required keys are not exist, create them by setting their items
                    appStorage.setItem('lastLessonCompleted', 0);
                    appStorage.setItem('lastSessionCompleted', 0);
                    appStorage.setItem('totalCompletedTutorials', 0);

               }

          });

     }

});
</script>
