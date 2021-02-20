<template>
  <ion-page>

    <ion-header>
      <ion-toolbar>
        <ion-title>Trips Overview</ion-title>
      </ion-toolbar>
    </ion-header>

    <ion-content :fullscreen="true" class="ion-padding">

      <!-- For iOS platform view -->
      <ion-header collapse="condense">
        <ion-toolbar>
          <ion-title size="large">Trips Overview</ion-title>
        </ion-toolbar>
      </ion-header>

      <ion-text color="primary">
           <h4>Trips in numbers</h4>
      </ion-text>

      <ion-list lines="full">
           <ion-item>
                <ion-icon :icon="journal" slot="start"></ion-icon>
                <ion-label>{{ numberOfTrips }} Added Trips</ion-label>
           </ion-item>

           <ion-item lines="full">
                <ion-icon :icon="planet" slot="start"></ion-icon>
                <ion-label>{{ numberOfCities }} Visited Cities</ion-label>
           </ion-item>
      </ion-list>

      <br />
      <br />

      <ion-button expand="block" @click="shareTheApp">
           Share the app!
      </ion-button>

    </ion-content>

  </ion-page>
</template>

<script>
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonText, IonButton, IonList, IonItem, IonIcon, IonLabel } from '@ionic/vue';
import { journal, planet } from 'ionicons/icons';
import { Plugins } from '@capacitor/core';



export default  {
     name: 'Tab2',
     components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonText, IonButton, IonList, IonItem, IonIcon, IonLabel },
     data() {
          return { journal, planet }
     },
     methods: {
          async shareTheApp() {

               console.log('Share The app!');
               
               const { Share } = Plugins;

               return await Share.share({
                    title: 'See my trips!',
                    text: 'Discover my current trips during my travel to several cities',
                    url: 'http://example.com',
                    dialogTitle: 'Share with friends'
               });

          }
     },
     computed: {
          numberOfTrips() {
               return this.$store.getters.getCurrentStories.length;
          },
          numberOfCities() {
               return this.$store.getters.getNumberOfVisitedCities;
          }
     }
}
</script>
