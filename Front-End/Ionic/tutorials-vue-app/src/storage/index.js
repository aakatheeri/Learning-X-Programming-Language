
import { Plugins } from '@capacitor/core';

const { Storage } = Plugins;

const appStorage = {
     setItem: async (key, value) => {
          await Storage.set({
               key: key,
               value: (value).toString()
          })
     },
     getItem: async (keyName) => {
          const { value } = await Storage.get({ key: keyName});
          // console.log('Got item: ', value);
          return value;
     },
     removeItem: async (keyName) => {
          await Storage.remove({ key: keyName });
     },
     keys: async () => {
          const { keys } = await Storage.keys();
          // console.log('Got keys: ', keys);
          return keys;
     },
     clear: async () => {
          await Storage.clear();
     },
     setup: async () => {

          // appStorage.clear();

          let isStorageKeysExist = false;

          // Get the current keys exist on app storage
          const storageKeys = appStorage.keys();

          // Get the the keys with Promise response
          storageKeys.then((response) => {
               console.log(response);

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

                    console.log(isStorageKeysExist);

                    // If required keys are not exist, create them by setting their items
                    appStorage.setItem('lastLessonCompleted', '0');
                    appStorage.setItem('lastSessionCompleted', '0');
                    appStorage.setItem('totalCompletedTutorials', '0');

               }

          });
     }

}

export default appStorage;
