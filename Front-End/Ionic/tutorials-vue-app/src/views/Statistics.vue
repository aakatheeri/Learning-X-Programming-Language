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
                     <ion-icon :icon="checkmarkDoneOutline" slot="start"></ion-icon>
                     <ion-label>
                          2 Completed tutorials.
                     </ion-label>
                </ion-item>
                <ion-item lines="full">
                     <ion-icon :icon="extensionPuzzleOutline
" slot="start"></ion-icon>
                     <ion-label>
                          2 Completed sessions.
                     </ion-label>
                </ion-item>
           </ion-card>

           <br />

           <ion-button expand="block">
               Share the app!
           </ion-button>


          </ion-content>

     </ion-page>
</template>

<script>
import { IonPage, IonHeader, IonToolbar, IonTitle, IonContent, IonCard, IonItem, IonIcon, IonLabel, IonButton, IonText } from '@ionic/vue';
import { checkmarkDoneOutline, extensionPuzzleOutline } from 'ionicons/icons';

export default  {
  name: 'Statistics',
  components: { IonHeader, IonToolbar, IonTitle, IonContent, IonPage, IonCard, IonItem, IonIcon, IonLabel, IonButton, IonText },
  data() {
       return {
            checkmarkDoneOutline,
            extensionPuzzleOutline
       }
 }
}
</script>
