<template>
  <ion-page>
    <ion-header>
      <ion-toolbar>
        <ion-title>Tab 1</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content :fullscreen="true">
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Tab 1</ion-title>
        </ion-toolbar>
      </ion-header>

      <h1>Where is Mike?</h1>
      <p>
           {{ locationData }}
      </p>
      <ion-button routerLink="/tabs/tab1/tab2">Go to Tab 2</ion-button>
      <ion-button @click="getLocation()">Where am I ?</ion-button>

    </ion-content>
  </ion-page>
</template>

<script lang="ts">
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonButton } from '@ionic/vue';
import { ref } from 'vue';
import { Plugins } from "@capacitor/core";

export default  {
  name: 'Tab1',
  components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonButton },
  setup() {
       const locationData = ref({});
       const getLocation = async () => {
            const { Geolocation } = Plugins;
            const results = await Geolocation.getCurrentPosition();
            locationData.value = {
                 lat: results.coords.latitude,
                 long: results.coords.longitude
            };
       };

       return {
            locationData,
            getLocation
       }
 }
}
</script>
