
import { Plugins } from '@capacitor/core';

const { Storage } = Plugins;

const appStorage = {
     setItem: async (key, value) => {
          await Storage.set({
               key: key,
               value: value
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
          console.log('Got keys: ', keys);
          return keys;
     },
     clear: async () => {
          await Storage.clear();
     }

}

export default appStorage;
