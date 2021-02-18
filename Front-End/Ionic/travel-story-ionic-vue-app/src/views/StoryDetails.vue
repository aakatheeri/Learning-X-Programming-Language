<template>
     <ion-page>

          <ion-header>
            <ion-toolbar>
               <ion-buttons slot="start">
                    <ion-back-button></ion-back-button>
               </ion-buttons>
               <ion-title>Story Title</ion-title>
            </ion-toolbar>
          </ion-header>

          <ion-content class="ion-padding">
               <h3>Picture should be here</h3>
               <p>
                    quis summis aliqua ipsum nisi ipsum tamen nulla multos dolore multos duis duis
                    fore culpa sunt tempor quem amet summis duis tempor multos cillum multos tamen
                    magna anim sint tamen culpa tamen quis elit veniam nisi quorum fugiat export
                    minim eram malis legam eram legam
               </p>
          </ion-content>

     </ion-page>
</template>

<script>
import { IonPage, IonContent, IonHeader, IonToolbar, IonButtons, IonBackButton, IonTitle } from '@ionic/vue';
export default {
     name: 'StoryDetails',
     components: {
          IonPage,
          IonContent,
          IonHeader,
          IonToolbar,
          IonButtons,
          IonBackButton,
          IonTitle
     }
}

</script>
