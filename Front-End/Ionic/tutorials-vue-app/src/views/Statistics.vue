<template>
     <ion-page>

          <ion-header>
               <ion-toolbar>
                    <ion-title>Statistics</ion-title>
               </ion-toolbar>
          </ion-header>

          <ion-content :fullscreen="true" class="ion-padding">

           <!-- iOS View -->
           <ion-header collapse="condense">
               <ion-toolbar>
                    <ion-title size="large">Statistics</ion-title>
               </ion-toolbar>
           </ion-header>

           <ion-text color="primary">
                <h1>Overview Statistics</h1>

           </ion-text>

           <br />

           <ion-card>
                <ion-item lines="full">
                     <ion-icon :icon="extensionPuzzleOutline
" slot="start"></ion-icon>
                     <ion-label>
                          {{ completedLessons }} Completed lessons.
                     </ion-label>
                </ion-item>
                <ion-item lines="full">
                     <ion-icon :icon="checkmarkDoneOutline" slot="start"></ion-icon>
                     <ion-label>
                          {{ completedTutorials }} Completed tutorials.
                     </ion-label>
                </ion-item>
           </ion-card>

           <br />

           <ion-button expand="block" @click="shareInsights">Share your learning insights!</ion-button>


          </ion-content>

     </ion-page>
</template>

<script>
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonCard, IonItem, IonIcon, IonLabel, IonButton, IonText } from '@ionic/vue';
import { checkmarkDoneOutline, extensionPuzzleOutline } from 'ionicons/icons';
import appStorage from '../storage';
import { Plugins } from '@capacitor/core';

export default  {
     name: 'Statistics',
     components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonCard, IonItem, IonIcon, IonLabel, IonButton, IonText },
     data() {
          return {
            checkmarkDoneOutline,
            extensionPuzzleOutline,
            completedLessons: null,
            completedTutorials: null
          }
     },
     created() {

          // Initialize data on view once the view is created
          this.updateData();

     },
     ionViewDidEnter() {

          // Update data once view did enter
          this.updateData();

     },
     methods: {

          // Update any data when needed
          async updateData() {

               this.completedLessons = await appStorage.getItem('lastLessonCompleted');
               this.completedTutorials = await appStorage.getItem('totalCompletedTutorials');

          },
          async shareInsights() {

               const { Share } = Plugins;

               let shareRet = await Share.share({
                    title: 'See the insights!',
                    text: 'Checkout the insights of my learning journey!',
                    url: 'http://example.com',
                    dialogTitle: 'Share'
               });

               return shareRet;
          }
     }
}
</script>
