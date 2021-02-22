<template>
     
     <base-layout title="Trips Overview">

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

     </base-layout>

</template>

<script>
import { IonText, IonButton, IonList, IonItem, IonIcon, IonLabel } from '@ionic/vue';
import BaseLayout from '../components/BaseLayout.vue';
import { journal, planet } from 'ionicons/icons';
import { Plugins } from '@capacitor/core';

export default  {
     name: 'Tab2',
     components: { IonText, IonButton, IonList, IonItem, IonIcon, IonLabel, BaseLayout },
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
