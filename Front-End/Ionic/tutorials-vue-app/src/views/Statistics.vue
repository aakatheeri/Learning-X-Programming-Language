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
                     <ion-icon :icon="readerOutline
" slot="start"></ion-icon>
                     <ion-label>
                          {{ completedLessons }} Completed lessons.
                     </ion-label>
                </ion-item>
                <ion-item lines="full">
                     <ion-icon :icon="extensionPuzzleOutline
" slot="start"></ion-icon>
                     <ion-label>
                          {{ completedSessions }} Completed sessions.
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
import { checkmarkDoneOutline, extensionPuzzleOutline, readerOutline } from 'ionicons/icons';
import appStorage from '../storage';
import { Plugins } from '@capacitor/core';

export default  {
     name: 'Statistics',
     components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonCard, IonItem, IonIcon, IonLabel, IonButton, IonText },
     data() {
          return {
            checkmarkDoneOutline,
            extensionPuzzleOutline,
            readerOutline,
            completedLessons: null,
            completedSessions: null,
            completedTutorials: null
          }
     },
     async mounted() {

          this.completedLessons = await appStorage.getItem('lastLessonCompleted');
          this.completedSessions = await appStorage.getItem('lastSessionCompleted');
          this.completedTutorials = await appStorage.getItem('lastSessionCompleted');

     },
     methods: {
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
